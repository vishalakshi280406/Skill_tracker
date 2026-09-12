package com.skill_tracker.controller;

import com.skill_tracker.dao.StudentDAO;
import com.skill_tracker.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/EditStudentProfileServlet")
public class EditStudentProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /* ================= LOAD PROFILE FOR EDIT ================= */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("rollNo") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String rollNo = (String) session.getAttribute("rollNo");

        StudentDAO dao = new StudentDAO();
        Student student = dao.getStudentByRollNo(rollNo);

        if (student == null) {
            request.setAttribute("message", "Student profile not found ❌");
            request.getRequestDispatcher("student_profile.jsp").forward(request, response);
            return;
        }

        request.setAttribute("student", student);
        request.getRequestDispatcher("edit_student_profile.jsp").forward(request, response);
    }

    /* ================= UPDATE PROFILE ================= */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("rollNo") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String rollNo = (String) session.getAttribute("rollNo");

        Student student = new Student();
        student.setRollNo(rollNo);
        student.setFullName(request.getParameter("fullName"));
        student.setEmail(request.getParameter("email"));
        student.setMobile(request.getParameter("mobile"));
        student.setDepartment(request.getParameter("department"));
        student.setSection(request.getParameter("section"));
        student.setCourse(request.getParameter("course"));
        student.setAcademicYear(request.getParameter("academicYear"));
        student.setYearSemester(request.getParameter("yearSemester"));

        /* ✅ arrears → int (safe) */
        try {
            String arrearsStr = request.getParameter("arrears");
            student.setArrears(
                (arrearsStr != null && !arrearsStr.trim().isEmpty())
                        ? Integer.parseInt(arrearsStr)
                        : 0
            );
        } catch (NumberFormatException e) {
            student.setArrears(0);
        }

        /* ✅ cgpa → BigDecimal (safe) */
        try {
            String cgpaStr = request.getParameter("cgpa");
            student.setCgpa(
                (cgpaStr != null && !cgpaStr.trim().isEmpty())
                        ? new BigDecimal(cgpaStr)
                        : null
            );
        } catch (NumberFormatException e) {
            student.setCgpa(null);
        }

        student.setGithubLink(request.getParameter("githubLink"));
        student.setLinkedinLink(request.getParameter("linkedinLink"));
        student.setProfilePhoto(request.getParameter("profilePhoto"));

        StudentDAO dao = new StudentDAO();
        boolean updated = dao.updateStudentProfile(student);

        if (updated) {
            /* update session values */
            session.setAttribute("name", student.getFullName());
            session.setAttribute("department", student.getDepartment());
            session.setAttribute("email", student.getEmail());
            session.setAttribute("mobile", student.getMobile());

            request.setAttribute("message", "Profile updated successfully ✅");
        } else {
            request.setAttribute("message", "Failed to update profile ❌");
        }

        request.getRequestDispatcher("student_profile.jsp").forward(request, response);
    }
}
