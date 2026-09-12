package com.skill_tracker.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.skill_tracker.util.DBConnection;

@WebServlet("/RejectSkillServlet")
public class RejectSkillServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"STAFF".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        int skillId = Integer.parseInt(request.getParameter("skillId"));

        try (Connection con = DBConnection.getConnection()) {

            String sql = "UPDATE skills SET status='REJECTED' WHERE skill_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, skillId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("StaffDashboardServlet");
    }
}
