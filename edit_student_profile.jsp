<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student Profile</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-4">

    <!-- 🔹 Header -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4>Edit Student Profile</h4>
        <a href="StudentProfileServlet" class="btn btn-outline-secondary btn-sm">
            ⬅ Back to Profile
        </a>
    </div>

    <!-- 🔹 Edit Form -->
    <div class="card shadow">
        <div class="card-body">

            <form action="EditStudentProfileServlet" method="post">

                <!-- FULL NAME -->
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text" name="fullName"
                           value="${student.fullName}"
                           class="form-control" required>
                </div>

                <!-- EMAIL -->
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email"
                           value="${student.email}"
                           class="form-control">
                </div>

                <!-- MOBILE -->
                <div class="mb-3">
                    <label class="form-label">Mobile Number</label>
                    <input type="text" name="mobile"
                           value="${student.mobile}"
                           class="form-control">
                </div>

                <!-- DEPARTMENT -->
                <div class="mb-3">
                    <label class="form-label">Department</label>
                    <input type="text" name="department"
                           value="${student.department}"
                           class="form-control">
                </div>

                <!-- SECTION -->
                <div class="mb-3">
                    <label class="form-label">Section</label>
                    <input type="text" name="section"
                           value="${student.section}"
                           class="form-control">
                </div>

                <!-- COURSE -->
                <div class="mb-3">
                    <label class="form-label">Course / Degree</label>
                    <input type="text" name="course"
                           value="${student.course}"
                           class="form-control">
                </div>

                <!-- ACADEMIC YEAR -->
                <div class="mb-3">
                    <label class="form-label">Academic Year</label>
                    <input type="text" name="academicYear"
                           value="${student.academicYear}"
                           class="form-control"
                           placeholder="2022 - 2026">
                </div>

                <!-- YEAR / SEMESTER -->
                <div class="mb-3">
                    <label class="form-label">Year / Semester</label>
                    <input type="text" name="yearSemester"
                           value="${student.yearSemester}"
                           class="form-control">
                </div>

                <!-- ARREARS -->
                <div class="mb-3">
                    <label class="form-label">No. of Arrears</label>
                    <input type="number" name="arrears"
                           value="${student.arrears}"
                           class="form-control">
                </div>

                <!-- CGPA -->
                <div class="mb-3">
                    <label class="form-label">CGPA</label>
                    <input type="text" name="cgpa"
                           value="${student.cgpa}"
                           class="form-control">
                </div>

                <!-- GITHUB -->
                <div class="mb-3">
                    <label class="form-label">GitHub Link</label>
                    <input type="text" name="githubLink"
                           value="${student.githubLink}"
                           class="form-control">
                </div>

                <!-- LINKEDIN -->
                <div class="mb-3">
                    <label class="form-label">LinkedIn Profile</label>
                    <input type="text" name="linkedinLink"
                           value="${student.linkedinLink}"
                           class="form-control">
                </div>

                <!-- PROFILE PHOTO (URL) -->
                <div class="mb-3">
                    <label class="form-label">Profile Photo (URL)</label>
                    <input type="text" name="profilePhoto"
                           value="${student.profilePhoto}"
                           class="form-control">
                </div>

                <!-- ACTION BUTTONS -->
                <div class="d-flex justify-content-center mt-4">
                    <button type="submit" class="btn btn-success me-2">
                        💾 Save Changes
                    </button>
                    <a href="StudentProfileServlet" class="btn btn-outline-secondary">
                        Cancel
                    </a>
                </div>

            </form>

        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
