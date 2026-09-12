package com.skill_tracker.dao;

import java.sql.*;
import com.skill_tracker.util.DBConnection;

public class RegisterDAO {

    // Check if rollNo already exists
    public boolean rollNoExists(String rollNo) {
        String sql = "SELECT 1 FROM users WHERE rollNo = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, rollNo);
            ResultSet rs = ps.executeQuery();
            return rs.next();

        } catch (SQLException e) {
            e.printStackTrace();
            return true; // treat error as exists
        }
    }

    // Register user
    public boolean registerUser(String rollNo, String password, String role) {

        String sql = "INSERT INTO users (rollNo, password, role) VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, rollNo);
            ps.setString(2, password);
            ps.setString(3, role.toUpperCase());

            ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
