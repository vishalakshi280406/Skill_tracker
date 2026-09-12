package com.skill_tracker.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.skill_tracker.dao.UserDAO;
import com.skill_tracker.model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String rollNo = request.getParameter("rollNo");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.validateUser(rollNo, password);

        if (user == null) {
            response.sendRedirect("login.jsp?error=invalid");
            return;
        }
        /* ✅ Create fresh session */
        HttpSession session = request.getSession(true);
        session.setAttribute("rollNo", user.getRollNo());
        session.setAttribute("role", user.getRole());
  
        /* ✅ Role-based redirection */
        String role = user.getRole();

        if ("STUDENT".equalsIgnoreCase(role)) {

            response.sendRedirect("StudentDashboardServlet");

        } else if ("STAFF".equalsIgnoreCase(role)) {

            response.sendRedirect("StaffDashboardServlet");

        } else if ("ADMIN".equalsIgnoreCase(role)) {

            response.sendRedirect("admin_dashboard.jsp");

        } else {
            session.invalidate();
            response.sendRedirect("login.jsp?error=role");
        }
    }
}
