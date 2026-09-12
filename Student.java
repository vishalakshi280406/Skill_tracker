package com.skill_tracker.model;

import java.math.BigDecimal;

public class Student {

    private int id;
    private String rollNo;
    private String password;
    private String role;

    private String fullName;
    private String email;
    private String mobile;
    private String department;
    private String section;
    private String course;
    private String academicYear;
    private String yearSemester;

    private int arrears;                 // int
    private BigDecimal cgpa;              // decimal(3,2)

    private String githubLink;
    private String linkedinLink;
    private String profilePhoto;
    private String status;

    // ---------- GETTERS & SETTERS ----------

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getRollNo() {
        return rollNo;
    }
    public void setRollNo(String rollNo) {
        this.rollNo = rollNo;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }

    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getDepartment() {
        return department;
    }
    public void setDepartment(String department) {
        this.department = department;
    }

    public String getSection() {
        return section;
    }
    public void setSection(String section) {
        this.section = section;
    }

    public String getCourse() {
        return course;
    }
    public void setCourse(String course) {
        this.course = course;
    }

    public String getAcademicYear() {
        return academicYear;
    }
    public void setAcademicYear(String academicYear) {
        this.academicYear = academicYear;
    }

    public String getYearSemester() {
        return yearSemester;
    }
    public void setYearSemester(String yearSemester) {
        this.yearSemester = yearSemester;
    }

    public int getArrears() {
        return arrears;
    }
    public void setArrears(int arrears) {
        this.arrears = arrears;
    }

    public BigDecimal getCgpa() {
        return cgpa;
    }
    public void setCgpa(BigDecimal cgpa) {
        this.cgpa = cgpa;
    }

    public String getGithubLink() {
        return githubLink;
    }
    public void setGithubLink(String githubLink) {
        this.githubLink = githubLink;
    }

    public String getLinkedinLink() {
        return linkedinLink;
    }
    public void setLinkedinLink(String linkedinLink) {
        this.linkedinLink = linkedinLink;
    }

    public String getProfilePhoto() {
        return profilePhoto;
    }
    public void setProfilePhoto(String profilePhoto) {
        this.profilePhoto = profilePhoto;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}
