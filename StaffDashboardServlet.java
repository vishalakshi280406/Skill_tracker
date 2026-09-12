package com.skill_tracker.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.skill_tracker.model.Skill;
import com.skill_tracker.util.DBConnection;

@WebServlet("/StaffDashboardServlet")
public class StaffDashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("role") == null ||
            !"STAFF".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Skill> pendingSkills = new ArrayList<>();
        List<Skill> approvedSkills = new ArrayList<>();

        int pendingCount = 0;
        int approvedCount = 0;
        int rejectedCount = 0;

        try (Connection con = DBConnection.getConnection()) {

            // 🔹 Pending Skills
            String pendingSql = "SELECT * FROM skills WHERE status='PENDING'";
            PreparedStatement ps1 = con.prepareStatement(pendingSql);
            ResultSet rs1 = ps1.executeQuery();

            while (rs1.next()) {
                Skill skill = new Skill();
                skill.setSkillId(rs1.getInt("skill_id"));
                skill.setRollNo(rs1.getString("roll_no"));
                skill.setSkillName(rs1.getString("skill_name"));
                skill.setCategory(rs1.getString("category"));
                skill.setLevel(rs1.getString("level"));
                skill.setStatus(rs1.getString("status"));
                pendingSkills.add(skill);
            }

            // 🔹 Approved Skills
            String approvedSql = "SELECT * FROM skills WHERE status='APPROVED'";
            PreparedStatement ps2 = con.prepareStatement(approvedSql);
            ResultSet rs2 = ps2.executeQuery();

            while (rs2.next()) {
                Skill skill = new Skill();
                skill.setSkillId(rs2.getInt("skill_id"));
                skill.setRollNo(rs2.getString("roll_no"));
                skill.setSkillName(rs2.getString("skill_name"));
                skill.setCategory(rs2.getString("category"));
                skill.setLevel(rs2.getString("level"));
                skill.setStatus(rs2.getString("status"));
                approvedSkills.add(skill);
            }

            // 🔹 Counts
            pendingCount = getCount(con, "PENDING");
            approvedCount = getCount(con, "APPROVED");
            rejectedCount = getCount(con, "REJECTED");

        } catch (Exception e) {
            e.printStackTrace();
        }

        // 🔹 Send data to JSP
        request.setAttribute("pendingSkills", pendingSkills);
        request.setAttribute("approvedSkills", approvedSkills);
        request.setAttribute("pendingCount", pendingCount);
        request.setAttribute("approvedCount", approvedCount);
        request.setAttribute("rejectedCount", rejectedCount);

        RequestDispatcher rd =
                request.getRequestDispatcher("staff_dashboard.jsp");
        rd.forward(request, response);
    }

    private int getCount(Connection con, String status) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM skills WHERE status=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}
