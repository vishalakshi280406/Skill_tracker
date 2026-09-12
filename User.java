package com.skill_tracker.model;

public class User {

    private String rollNo;
    private String role;

    public User(String rollNo, String role) {
        this.rollNo = rollNo;
        this.role = role;
    }

    public String getRollNo() {
        return rollNo;
    }

    public String getRole() {
        return role;
    }
}
