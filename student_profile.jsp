<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Profile</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-4">

    <!-- 🔹 Header -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4>Student Profile</h4>
        <a href="StudentDashboardServlet" class="btn btn-outline-secondary btn-sm">
            ⬅ Back to Dashboard
        </a>
    </div>

    <!-- 🔹 Profile Card -->
    <div class="card shadow mb-4">
        <div class="card-body">

            <div class="row align-items-center">

                <%-- <!-- Profile Photo -->
                <div class="col-md-3 text-center">
                    <img src="${empty student.profilePhoto 
                        ? 'https://via.placeholder.com/150' 
                        : student.profilePhoto}"
                         class="rounded-circle img-thumbnail mb-2"
                         width="150" height="150">
                    <p class="text-muted small">Profile Photo</p>
                </div> --%>

                <!-- Basic Info -->
                <div class="col-md-9">
                    <h5 class="mb-1">${student.fullName}</h5>

                    <p class="mb-1">
                        <strong>Register No:</strong> ${student.rollNo}
                    </p>

                    <p class="mb-1">
                        <strong>Department:</strong> ${student.department}
                    </p>

                    <c:if test="${not empty student.githubLink}">
                        <p class="mb-1">
                            <strong>GitHub:</strong>
                            <a href="${student.githubLink}" target="_blank">View</a>
                        </p>
                    </c:if>

                    <c:if test="${not empty student.linkedinLink}">
                        <p class="mb-1">
                            <strong>LinkedIn:</strong>
                            <a href="${student.linkedinLink}" target="_blank">View</a>
                        </p>
                    </c:if>
                </div>
            </div>

            <!-- Profile Completion -->
            <hr>
            <label class="form-label">Profile Completion</label>
            <div class="progress">
                <div class="progress-bar bg-success"
                     style="width: ${profileCompletion}%">
                    ${profileCompletion}%
                </div>
            </div>

        </div>
    </div>

    <!-- 🔹 Academic & Personal Details -->
    <div class="card shadow mb-4">
        <div class="card-header bg-primary text-white">
            Academic & Personal Details
        </div>

        <div class="card-body">

            <div class="row mb-2">
                <div class="col-md-6">
                    <strong>Email:</strong> ${student.email}
                </div>
                <div class="col-md-6">
                    <strong>Mobile:</strong> ${student.mobile}
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-6">
                    <strong>Course / Degree:</strong> ${student.course}
                </div>
                <div class="col-md-6">
                    <strong>Year / Semester:</strong> ${student.yearSemester}
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-6">
                    <strong>Section:</strong> ${student.section}
                </div>
                <div class="col-md-6">
                    <strong>No. of Arrears:</strong> ${student.arrears}
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-6">
                    <strong>Academic Year:</strong> ${student.academicYear}
                </div>
                <div class="col-md-6">
                    <strong>CGPA:</strong> ${student.cgpa}
                </div>
            </div>

        </div>
    </div>

    <!-- 🔹 Actions -->
    <div class="card shadow">
        <div class="card-body text-center">

            <a href="EditStudentProfileServlet" class="btn btn-outline-primary me-2">
                ✏️ Edit Profile
            </a>

            <a href="change_password.jsp" class="btn btn-outline-warning me-2">
                🔐 Change Password
            </a>

            <a href="LogoutServlet" class="btn btn-outline-danger">
                🚪 Logout
            </a>

        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
			