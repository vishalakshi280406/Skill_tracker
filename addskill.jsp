<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Skill</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-4">

    <!-- 🔹 Profile Card -->
    <div class="card shadow-sm mb-3">
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

    <!-- 🔹 Header -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4>Add Skill</h4>
        <div>
            <a href="StudentDashboardServlet" class="btn btn-outline-secondary btn-sm">
                ⬅ Back to Dashboard
            </a>
            <a href="LogoutServlet" class="btn btn-outline-danger btn-sm">
                Logout
            </a>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-8">

            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h5>Add New Skill</h5>
                </div>

                <div class="card-body">

                    <c:if test="${not empty message}">
                        <div class="alert alert-success text-center">
                            ${message}
                        </div>
                    </c:if>

                    <form action="AddSkillServlet" method="post">

                        <!-- COMMON -->
                        <div class="mb-3">
                            <label class="form-label">Skill Name</label>
                            <input type="text" name="skill_name" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Category</label>
                            <select name="category" class="form-select" required
                                    onchange="showCategoryFields(this.value)">
                                <option value="">-- Select --</option>
                                <option value="SPORTS">Sports</option>
                                <option value="PROJECT">Project</option>
                                <option value="INTERNSHIP">Internship</option>
                                <option value="TECHNICAL">Technical</option>
                                <option value="PUBLICATION">Publication</option>
                                <option value="SOFT_SKILL">Soft Skill</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Level</label>
                            <select name="level" class="form-select">
                                <option value="">-- Select --</option>
                                <option value="Beginner">Beginner</option>
                                <option value="Intermediate">Intermediate</option>
                                <option value="Advanced">Advanced</option>
                            </select>
                        </div>

                        <!-- SPORTS -->
                        <div id="sportsFields" class="d-none border rounded p-3 mb-3">
                            <h6>Sports Details</h6>
                            <input type="text" name="sports_name" class="form-control mb-2"
                                   placeholder="Sports Name">
                            <select name="matchLevel" class="form-select mb-2">
                                <option value="">Match Level</option>
                                <option>College</option>
                                <option>District</option>
                                <option>State</option>
                                <option>National</option>
                                <option>Zonal</option>
                            </select>
                            <input type="text" name="evidenceLink" class="form-control mb-2"
                                   placeholder="Certificate Link (optional)">
                            <input type="file" name="evidenceFile" class="form-control">
                        </div>

                        <!-- PROJECT -->
                        <div id="projectFields" class="d-none border rounded p-3 mb-3">
                            <h6>Project Details</h6>
                            <input type="text" name="projectName" class="form-control mb-2"
                                   placeholder="Project Name">
                            <textarea name="techStack" class="form-control mb-2"
                                      placeholder="Tech Stack / Description"></textarea>
                            <select name="projectStatus" class="form-select mb-2">
                                <option value="">Project Status</option>
                                <option>In Progress</option>
                                <option>Completed</option>
                            </select>
                            <input type="text" name="projectLink" class="form-control"
                                   placeholder="Project Link / Document Link">
                        </div>

                        <!-- INTERNSHIP -->
                        <div id="internshipFields" class="d-none border rounded p-3 mb-3">
                            <h6>Internship Details</h6>
                            <input type="text" name="companyName" class="form-control mb-2"
                                   placeholder="Company Name">
                            <div class="row mb-2">
                                <div class="col">
                                    <input type="date" name="internshipFrom" class="form-control">
                                </div>
                                <div class="col">
                                    <input type="date" name="internshipTo" class="form-control">
                                </div>
                            </div>
                            <select name="internshipSource" class="form-select mb-2">
                                <option value="">Source</option>
                                <option>Paid</option>
                                <option>Recommended</option>
                                <option>Applied</option>
                                <option>Through College</option>
                                <option>Online</option>
                            </select>
                            <textarea name="description" class="form-control"
                                      placeholder="What you learned"></textarea>
                        </div>

                        <!-- TECHNICAL -->
                        <div id="technicalFields" class="d-none border rounded p-3 mb-3">
                            <h6>Technical Skill</h6>
                            <input type="text" name="skill_name" class="form-control mb-2"
                                   placeholder="Technical Skill Name">
                            <textarea name="description" class="form-control mb-2"
                                      placeholder="Description"></textarea>
                            <input type="text" name="evidenceLink" class="form-control mb-2"
                                   placeholder="Proof / Document Link">
                        </div>

                        <!-- PUBLICATION -->
                        <div id="publicationFields" class="d-none border rounded p-3 mb-3">
                            <h6>Publication</h6>
                            <input type="text" name="publicationTitle" class="form-control mb-2"
                                   placeholder="Publication Title">
                            <textarea name="publicationAbout" class="form-control mb-2"
                                      placeholder="About Publication"></textarea>
                            <input type="text" name="publicationLink" class="form-control"
                                   placeholder="Publication Link">
                        </div>

                        <!-- SOFT SKILL -->
                        <div id="softSkillFields" class="d-none border rounded p-3 mb-3">
                            <h6>Soft Skill</h6>
                            <input type="text" name="softSkillName" class="form-control mb-2"
                                   placeholder="Soft Skill Name">
                            <textarea name="achievements" class="form-control mb-2"
                                      placeholder="Achievements"></textarea>
                            <input type="text" name="mediaLink" class="form-control"
                                   placeholder="Proof (Photos / Video link)">
                        </div>

                        <div class="d-grid mt-3">
                            <button type="submit" class="btn btn-success">
                                Submit Skill for Approval
                            </button>
                        </div>

                    </form>
                </div>

                <div class="card-footer text-center text-muted">
                    Submitted skills will be sent to staff for approval
                </div>
            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
function showCategoryFields(category) {

    const sections = [
        "sportsFields",
        "projectFields",
        "internshipFields",
        "technicalFields",
        "publicationFields",
        "softSkillFields"
    ];

    sections.forEach(id => document.getElementById(id).classList.add("d-none"));

    if (category === "SPORTS") document.getElementById("sportsFields").classList.remove("d-none");
    if (category === "PROJECT") document.getElementById("projectFields").classList.remove("d-none");
    if (category === "INTERNSHIP") document.getElementById("internshipFields").classList.remove("d-none");
    if (category === "TECHNICAL") document.getElementById("technicalFields").classList.remove("d-none");
    if (category === "PUBLICATION") document.getElementById("publicationFields").classList.remove("d-none");
    if (category === "SOFT_SKILL") document.getElementById("softSkillFields").classList.remove("d-none");
}
</script>

</body>
</html>
