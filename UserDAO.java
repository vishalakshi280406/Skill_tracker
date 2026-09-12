package com.skill_tracker.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.skill_tracker.model.User;
import com.skill_tracker.util.DBConnection;

public class UserDAO {

    public User validateUser(String rollNo, String password) {

        User user = null;
        String sql = "SELECT rollNo, role FROM users WHERE rollNo = ? AND password = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setString(1, rollNo);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User(
                    rs.getString("rollNo"),
                    rs.getString("role")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
