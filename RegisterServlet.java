package com.skill_tracker.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.skill_tracker.dao.RegisterDAO;
import com.skill_tracker.dao.PinDAO;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔹 READ PARAMETERS
        String rollNo = request.getParameter("rollNo");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String pin = request.getParameter("pin");

        // 🔹 BASIC NULL / EMPTY VALIDATION
        if (isNullOrEmpty(rollNo) || isNullOrEmpty(password) || isNullOrEmpty(role)) {
            response.sendRedirect("register.jsp?error=invalid");
            return;
        }

        // 🔹 TRIM VALUES
        rollNo = rollNo.trim();
        password = password.trim();
        role = role.trim();

        RegisterDAO registerDAO = new RegisterDAO();

        // 🔴 CHECK DUPLICATE ROLL NO
        if (registerDAO.rollNoExists(rollNo)) {
            response.sendRedirect("register.jsp?error=exists");
            return;
        }

        // 🔐 PIN VALIDATION FOR STAFF / ADMIN
        if (!"STUDENT".equalsIgnoreCase(role)) {

            // Pin mandatory
            if (isNullOrEmpty(pin) || !pin.matches("\\d{4}")) {
                response.sendRedirect("register.jsp?error=pin");
                return;
            }

            PinDAO pinDAO = new PinDAO();

            // Validate pin from DB
            boolean validPin = pinDAO.validatePin(role.toUpperCase(), pin);
            if (!validPin) {
                response.sendRedirect("register.jsp?error=pin");
                return;
            }
        }

        // 🔹 REGISTER USER
        boolean success = registerDAO.registerUser(rollNo, password, role.toUpperCase());

        if (!success) {
            response.sendRedirect("register.jsp?error=db");
            return;
        }

        // ✅ SUCCESS REDIRECT
        response.sendRedirect("login.jsp?registered=" + role.toLowerCase());
    }

    // 🔹 UTILITY METHOD
    private boolean isNullOrEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }
}
