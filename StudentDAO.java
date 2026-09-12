package com.skill_tracker.dao;

import com.skill_tracker.model.Student;
import com.skill_tracker.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.math.BigDecimal;

public class StudentDAO {

	public Student getStudentByRollNo(String rollNo) {

	    Student student = null;

	    String sql =
	        "SELECT rollNo, full_name, email, mobile, department, section, course, " +
	        "academic_year, year_semester, arrears, cgpa, github_link, linkedin_link, profile_photo " +
	        "FROM users WHERE rollNo = ? AND role = 'STUDENT'";

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, rollNo);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            student = new Student();
	            student.setRollNo(rs.getString("rollNo"));
	            student.setFullName(rs.getString("full_name"));
	            student.setEmail(rs.getString("email"));
	            student.setMobile(rs.getString("mobile"));
	            student.setDepartment(rs.getString("department"));
	            student.setSection(rs.getString("section"));
	            student.setCourse(rs.getString("course"));
	            student.setAcademicYear(rs.getString("academic_year"));
	            student.setYearSemester(rs.getString("year_semester"));
	            student.setArrears(rs.getInt("arrears"));
	            student.setCgpa(rs.getBigDecimal("cgpa"));
	            student.setGithubLink(rs.getString("github_link"));
	            student.setLinkedinLink(rs.getString("linkedin_link"));
	            student.setProfilePhoto(rs.getString("profile_photo"));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return student;
	}
    /* ================= UPDATE STUDENT PROFILE ================= */
    public boolean updateStudentProfile(Student student) {

        boolean status = false;

        String sql =
            "UPDATE users SET " +
            "full_name = ?, email = ?, mobile = ?, department = ?, section = ?, " +
            "course = ?, academic_year = ?, year_semester = ?, arrears = ?, cgpa = ?, " +
            "github_link = ?, linkedin_link = ?, profile_photo = ? " +
            "WHERE rollNo = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, student.getFullName());
            ps.setString(2, student.getEmail());
            ps.setString(3, student.getMobile());
            ps.setString(4, student.getDepartment());
            ps.setString(5, student.getSection());
            ps.setString(6, student.getCourse());
            ps.setString(7, student.getAcademicYear());
            ps.setString(8, student.getYearSemester());
            ps.setInt(9, student.getArrears());
            ps.setBigDecimal(10, student.getCgpa());
            ps.setString(11, student.getGithubLink());
            ps.setString(12, student.getLinkedinLink());
            ps.setString(13, student.getProfilePhoto());
            ps.setString(14, student.getRollNo());

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}
