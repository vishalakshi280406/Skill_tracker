<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-4">

    <!-- ================= PROFILE CARD ================= -->
    <div class="card shadow-sm mb-4">
        <div class="card-body d-flex justify-content-between align-items-center">

            <div>
                <h6 class="mb-1">Welcome 👋</h6>
                <p class="mb-0"><strong>Register No:</strong> ${sessionScope.rollNo}</p>

                <c:if test="${not empty sessionScope.name}">
                    <p class="mb-0"><strong>Name:</strong> ${sessionScope.name}</p>
                </c:if>

                <span class="badge bg-info mt-1">${sessionScope.role}</span>
            </div>

            <div>
                <a href="student_profile.jsp" class="btn btn-outline-primary btn-sm">
                    View Profile
                </a>
            </div>

        </div>
    </div>

    <!-- ================= HEADER ================= -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3>Student Dashboard</h3>

        <div>
            <a href="addskill.jsp" class="btn btn-success btn-sm me-2">+ Add Skill</a>
            <a href="LogoutServlet" class="btn btn-outline-danger btn-sm">Logout</a>
        </div>
    </div>

    <!-- ================= SUMMARY ================= -->
    <div class="row mb-4">
        <div class="col-md-4">
            <div class="card text-center shadow">
                <div class="card-body">
                    <h6>Total Approved Skills</h6>
                    <h3>${totalSkills}</h3>
                </div>
            </div>
        </div>
    </div>

    <!-- ===== TEMPLATE SECTION (REUSED FOR ALL CATEGORIES) ===== -->

    <c:set var="sections" value="
        Sports:sportsSkills,
        Technical Skills:technicalSkills,
        Projects:projectSkills,
        Internship:internshipSkills,
        Publications:publicationSkills,
        Soft Skills:softSkillSkills
    "/>

    <!-- ================= SPORTS ================= -->
    <div class="card mb-4 shadow">
        <div class="card-header bg-primary text-white"><strong>Sports</strong></div>
        <div class="card-body">

            <c:if test="${empty sportsSkills}">
                <p class="text-muted">There are no records to display</p>
            </c:if>

            <c:if test="${not empty sportsSkills}">
                <table class="table table-bordered">
                    <tr>
                        <th>Name</th>
                        <th>Level</th>
                        <th>Description</th>
                        <th>Certificate</th>
                    </tr>
                    <c:forEach var="skill" items="${sportsSkills}">
                        <tr>
                            <td>${skill.skillName}</td>
                            <td>${skill.level}</td>
                            <td>${skill.description}</td>
                            <td>
                                <a href="${skill.evidenceLink}" target="_blank"
                                   class="btn btn-sm btn-outline-primary">View</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>

        </div>
    </div>

    <!-- ================= TECHNICAL ================= -->
    <div class="card mb-4 shadow">
        <div class="card-header bg-dark text-white"><strong>Technical Skills</strong></div>
        <div class="card-body">

            <c:if test="${empty technicalSkills}">
                <p class="text-muted">There are no records to display</p>
            </c:if>

            <c:if test="${not empty technicalSkills}">
                <table class="table table-bordered">
                    <tr>
                        <th>Skill</th>
                        <th>Level</th>
                        <th>Description</th>
                    </tr>
                    <c:forEach var="skill" items="${technicalSkills}">
                        <tr>
                            <td>${skill.skillName}</td>
                            <td>${skill.level}</td>
                            <td>${skill.description}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>

        </div>
    </div>

    <!-- ================= PROJECT ================= -->
    <div class="card mb-4 shadow">
        <div class="card-header bg-success text-white"><strong>Projects</strong></div>
        <div class="card-body">

            <c:if test="${empty projectSkills}">
                <p class="text-muted">There are no records to display</p>
            </c:if>

            <c:if test="${not empty projectSkills}">
                <table class="table table-bordered">
                    <tr>
                        <th>Project</th>
                        <th>Level</th>
                        <th>Description</th>
                        <th>Link</th>
                    </tr>
                    <c:forEach var="skill" items="${projectSkills}">
                        <tr>
                            <td>${skill.skillName}</td>
                            <td>${skill.level}</td>
                            <td>${skill.description}</td>
                            <td>
                                <a href="${skill.evidenceLink}" target="_blank"
                                   class="btn btn-sm btn-outline-success">Open</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>

        </div>
    </div>

    <!-- ================= INTERNSHIP ================= -->
    <div class="card mb-4 shadow">
        <div class="card-header bg-warning"><strong>Internship</strong></div>
        <div class="card-body">

            <c:if test="${empty internshipSkills}">
                <p class="text-muted">There are no records to display</p>
            </c:if>

            <c:if test="${not empty internshipSkills}">
                <table class="table table-bordered">
                    <tr>
                        <th>Internship</th>
                        <th>Level</th>
                        <th>Description</th>
                    </tr>
                    <c:forEach var="skill" items="${internshipSkills}">
                        <tr>
                            <td>${skill.skillName}</td>
                            <td>${skill.level}</td>
                            <td>${skill.description}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>

        </div>
    </div>

    <!-- ================= PUBLICATION ================= -->
    <div class="card mb-4 shadow">
        <div class="card-header bg-secondary text-white"><strong>Publications</strong></div>
        <div class="card-body">

            <c:if test="${empty publicationSkills}">
                <p class="text-muted">There are no records to display</p>
            </c:if>

            <c:if test="${not empty publicationSkills}">
                <table class="table table-bordered">
                    <tr>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Link</th>
                    </tr>
                    <c:forEach var="skill" items="${publicationSkills}">
                        <tr>
                            <td>${skill.skillName}</td>
                            <td>${skill.description}</td>
                            <td>
                                <a href="${skill.evidenceLink}" target="_blank"
                                   class="btn btn-sm btn-outline-secondary">View</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>

        </div>
    </div>

    <!-- ================= SOFT SKILLS ================= -->
    <div class="card mb-4 shadow">
        <div class="card-header bg-info text-white"><strong>Soft Skills</strong></div>
        <div class="card-body">

            <c:if test="${empty softSkillSkills}">
                <p class="text-muted">There are no records to display</p>
            </c:if>

            <c:if test="${not empty softSkillSkills}">
                <table class="table table-bordered">
                    <tr>
                        <th>Skill</th>
                        <th>Description</th>
                    </tr>
                    <c:forEach var="skill" items="${softSkillSkills}">
                        <tr>
                            <td>${skill.skillName}</td>
                            <td>${skill.description}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>

        </div>
    </div>

</div>
</body>
</html>
