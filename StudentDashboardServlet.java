package com.skill_tracker.controller;

import com.skill_tracker.util.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/StudentDashboardServlet")
public class StudentDashboardServlet extends HttpServlet {

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

        String rollNo = (String) session.getAttribute("rollNo");

        int totalSkills = 0;

        // ✅ Category-wise lists
        List<Map<String, String>> sportsSkills = new ArrayList<>();
        List<Map<String, String>> projectSkills = new ArrayList<>();
        List<Map<String, String>> internshipSkills = new ArrayList<>();
        List<Map<String, String>> technicalSkills = new ArrayList<>();
        List<Map<String, String>> publicationSkills = new ArrayList<>();
        List<Map<String, String>> softSkillSkills = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String sql =
                "SELECT skill_name, category, level, evidence_link, remarks " +
                "FROM skills " +
                "WHERE roll_no=? AND status='APPROVED'";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, rollNo);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                totalSkills++;

                Map<String, String> skill = new HashMap<>();
                skill.put("skillName", rs.getString("skill_name"));
                skill.put("level", rs.getString("level"));
                skill.put("evidenceLink", rs.getString("evidence_link"));
                skill.put("description", rs.getString("remarks")); // ✅ FIX

                String category = rs.getString("category");

                if (category == null) continue;

                category = category.trim().toLowerCase(); // ✅ NORMALIZE

                switch (category) {

                    case "sports":
                        sportsSkills.add(skill);
                        break;

                    case "project":
                        projectSkills.add(skill);
                        break;

                    case "internship":
                        internshipSkills.add(skill);
                        break;

                    case "technical":
                        technicalSkills.add(skill);
                        break;

                    case "publication":
                        publicationSkills.add(skill);
                        break;

                    case "soft skill":
                        softSkillSkills.add(skill);
                        break;
                }
            }

            // ✅ Send data to JSP
            request.setAttribute("totalSkills", totalSkills);
            request.setAttribute("sportsSkills", sportsSkills);
            request.setAttribute("projectSkills", projectSkills);
            request.setAttribute("internshipSkills", internshipSkills);
            request.setAttribute("technicalSkills", technicalSkills);
            request.setAttribute("publicationSkills", publicationSkills);
            request.setAttribute("softSkillSkills", softSkillSkills);

            RequestDispatcher rd =
                    request.getRequestDispatcher("student_dashboard.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp");
        }
    }
}
