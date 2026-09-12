package com.skill_tracker.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    //private static final String URL = "jdbc:mysql://localhost:3306/users_db";
	/*
	 * private static final String USER = "root"; private static final String
	 * PASSWORD = "Vishalakshi@0456"; private static final String URL =
	 * "jdbc:mysql://localhost:3306/users_db?useSSL=false&serverTimezone=UTC";
	 */
	private static final String URL =
		    "jdbc:mysql://localhost:3306/skilltrack?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
	/*
	 * private static final String USER = "root"; private static final String
	 * PASSWORD = "Vishalakshi@0456";
	 */
	private static final String USER = "root";
	private static final String PASSWORD = "Vishalakshi@0456";



    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
