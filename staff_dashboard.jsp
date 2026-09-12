<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    if (session == null || session.getAttribute("role") == null ||
        !"STAFF".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-4">

    <!-- 🔹 HEADER -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3>Staff Dashboard</h3>
        <a href="<%=request.getContextPath()%>/LogoutServlet"
           class="btn btn-outline-danger btn-sm">Logout</a>
    </div>

    <!-- 🔹 COUNTS -->
    <div class="row mb-4">
        <div class="col-md-4">
            <div class="card text-center shadow">
                <div class="card-body">
                    <h6>Pending Requests</h6>
                    <h3><c:out value="${pendingCount}" default="0"/></h3>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card text-center shadow">
                <div class="card-body">
                    <h6>Approved Skills</h6>
                    <h3><c:out value="${approvedCount}" default="0"/></h3>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card text-center shadow">
                <div class="card-body">
                    <h6>Rejected Skills</h6>
                    <h3><c:out value="${rejectedCount}" default="0"/></h3>
                </div>
            </div>
        </div>
    </div>

    <!-- 🔹 PENDING SKILLS -->
    <div class="card shadow mb-4">
        <div class="card-header bg-warning">
            <strong>Pending Skill Requests</strong>
        </div>

        <div class="card-body">
            <c:choose>
                <c:when test="${empty pendingSkills}">
                    <p class="text-muted text-center">No pending skill requests</p>
                </c:when>

                <c:otherwise>
                    <table class="table table-bordered table-hover align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>Student Roll No</th>
                                <th>Skill</th>
                                <th>Category</th>
                                <th>Level</th>
                                <th style="width:180px;">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="skill" items="${pendingSkills}">
                                <tr>
                                    <td>${skill.rollNo}</td>
                                    <td>${skill.skillName}</td>
                                    <td>${skill.category}</td>
                                    <td>${skill.level}</td>
                                    <td>
                                        <div class="d-flex gap-2">

                                            <!-- APPROVE -->
                                            <form action="<%=request.getContextPath()%>/ApproveSkillServlet"
                                                  method="post">
                                                <input type="hidden" name="skillId"
                                                       value="${skill.skillId}">
                                                <button type="submit"
                                                        class="btn btn-success btn-sm">
                                                    Approve
                                                </button>
                                            </form>

                                            <!-- REJECT -->
                                            <form action="<%=request.getContextPath()%>/RejectSkillServlet"
                                                  method="post">
                                                <input type="hidden" name="skillId"
                                                       value="${skill.skillId}">
                                                <input type="hidden" name="remarks"
                                                       value="Rejected by staff">
                                                <button type="submit"
                                                        class="btn btn-danger btn-sm">
                                                    Reject
                                                </button>
                                            </form>

                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- 🔹 APPROVED SKILLS -->
    <div class="card shadow">
        <div class="card-header bg-success text-white">
            <strong>Approved Skills</strong>
        </div>

        <div class="card-body">
            <c:choose>
                <c:when test="${empty approvedSkills}">
                    <p class="text-muted text-center">No approved skills</p>
                </c:when>

                <c:otherwise>
                    <table class="table table-bordered table-hover">
                        <thead class="table-light">
                            <tr>
                                <th>Student Roll No</th>
                                <th>Skill</th>
                                <th>Category</th>
                                <th>Level</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="skill" items="${approvedSkills}">
                                <tr>
                                    <td>${skill.rollNo}</td>
                                    <td>${skill.skillName}</td>
                                    <td>${skill.category}</td>
                                    <td>${skill.level}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</div>

</body>
</html>
