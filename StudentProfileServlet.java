package com.skill_tracker.controller;

import com.skill_tracker.dao.StudentDAO;
import com.skill_tracker.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/StudentProfileServlet")
public class StudentProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // 🔒 Session validation
        if (session == null || session.getAttribute("rollNo") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String rollNo = session.getAttribute("rollNo").toString();

        try {
            // ✅ DAO object
            StudentDAO studentDAO = new StudentDAO();

            // ✅ Fetch student
            Student student = studentDAO.getStudentByRollNo(rollNo);

            if (student == null) {
                request.setAttribute("error", "Student profile not found");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // 🔹 Profile completion calculation
            int completion = calculateProfileCompletion(student);

            // 🔹 Send data to JSP
            request.setAttribute("student", student);
            request.setAttribute("profileCompletion", completion);

            request.getRequestDispatcher("student_profile.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to load profile");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    // 🔢 Profile completion logic (DB aligned)
    private int calculateProfileCompletion(Student s) {
        int filled = 0;
        int total = 10;

        if (notEmpty(s.getFullName())) filled++;
        if (notEmpty(s.getEmail())) filled++;
        if (notEmpty(s.getMobile())) filled++;
        if (notEmpty(s.getDepartment())) filled++;
        if (notEmpty(s.getCourse())) filled++;
        if (notEmpty(s.getYearSemester())) filled++;
        if (notEmpty(s.getAcademicYear())) filled++;
        if (s.getCgpa() != null && s.getCgpa().compareTo(BigDecimal.ZERO) > 0) {
            filled++;
        }											        // ✅ FIXED (BigDecimal)
        if (notEmpty(s.getGithubLink())) filled++;
        if (notEmpty(s.getLinkedinLink())) filled++;

        return (filled * 100) / total;
    }

    // ✅ String validator
    private boolean notEmpty(String value) {
        return value != null && !value.trim().isEmpty();
    }
}
