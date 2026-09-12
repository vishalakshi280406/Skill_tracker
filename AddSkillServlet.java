package com.skill_tracker.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Types;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.skill_tracker.util.DBConnection;

@WebServlet("/AddSkillServlet")
public class AddSkillServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("rollNo") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String rollNo = (String) session.getAttribute("rollNo");

        // COMMON FIELDS
        String skillName = request.getParameter("skill_name"); 
        String category = request.getParameter("category");
        String level = request.getParameter("level");
        String description = request.getParameter("description");
        String evidenceLink = request.getParameter("evidenceLink");

        // SPORTS
        String sportsName = request.getParameter("sports_name");
        String matchLevel = request.getParameter("matchLevel");

        // PROJECT
        String projectName = request.getParameter("projectName");
        String techStack = request.getParameter("techStack");
        String projectStatus = request.getParameter("projectStatus");
        String projectLink = request.getParameter("projectLink");

        // INTERNSHIP
        String companyName = request.getParameter("companyName");
        String internshipFrom = request.getParameter("internshipFrom");
        String internshipTo = request.getParameter("internshipTo");
        String internshipSource = request.getParameter("internshipSource");

        // PUBLICATION
        String publicationTitle = request.getParameter("publicationTitle");
        String publicationAbout = request.getParameter("publicationAbout");
        String publicationLink = request.getParameter("publicationLink");

        // SOFT SKILL
        String softSkillName = request.getParameter("softSkillName"); // ✅ FIXED
        String achievements = request.getParameter("achievements");
        String mediaLink = request.getParameter("mediaLink");

        // VALIDATION
        if (skillName == null || skillName.trim().isEmpty()) {
            request.setAttribute("message", "Skill name is required");
            request.getRequestDispatcher("addskill.jsp").forward(request, response);
            return;
        }

        try (Connection con = DBConnection.getConnection()) {

            String sql = "INSERT INTO skills ("
                    + "roll_no, skill_name, category, level, status, "
                    + "description, evidence_link, "
                    + "sports_name, match_level, "
                    + "project_name, tech_stack, project_status, project_link, "
                    + "company_name, internship_from, internship_to, internship_source, "
                    + "publication_title, publication_about, publication_link, "
                    + "soft_skill_name, achievements, media_link"
                    + ") VALUES (?,?,?,?, 'PENDING', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            int i = 1;
            ps.setString(i++, rollNo);
            ps.setString(i++, skillName);
            ps.setString(i++, category);
            ps.setString(i++, level);

            ps.setString(i++, description);
            ps.setString(i++, evidenceLink);

            ps.setString(i++, sportsName);
            ps.setString(i++, matchLevel);

            ps.setString(i++, projectName);
            ps.setString(i++, techStack);
            ps.setString(i++, projectStatus);
            ps.setString(i++, projectLink);

            ps.setString(i++, companyName);

            if (internshipFrom != null && !internshipFrom.isEmpty()) {
                ps.setDate(i++, Date.valueOf(internshipFrom));
            } else {
                ps.setNull(i++, Types.DATE);
            }

            if (internshipTo != null && !internshipTo.isEmpty()) {
                ps.setDate(i++, Date.valueOf(internshipTo));
            } else {
                ps.setNull(i++, Types.DATE);
            }

            ps.setString(i++, internshipSource);

            ps.setString(i++, publicationTitle);
            ps.setString(i++, publicationAbout);
            ps.setString(i++, publicationLink);

            ps.setString(i++, softSkillName);
            ps.setString(i++, achievements);
            ps.setString(i++, mediaLink);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error occurred while submitting skill.");
            request.getRequestDispatcher("addskill.jsp").forward(request, response);
            return;
        }

        request.setAttribute("message", "Skill submitted successfully and sent for staff approval.");
        request.getRequestDispatcher("addskill.jsp").forward(request, response);
    }
}
