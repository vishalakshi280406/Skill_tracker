package com.skill_tracker.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.skill_tracker.util.DBConnection;

public class PinDAO {

    public boolean validatePin(String role, String pin) {

        String sql = "SELECT 1 FROM role_pins WHERE role = ? AND pin = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setString(1, role.toUpperCase());
            ps.setString(2, pin);

            ResultSet rs = ps.executeQuery();
            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
