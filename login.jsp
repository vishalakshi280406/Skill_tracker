<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login</title>

  <!-- Bootstrap 5 CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body class="bg-dark d-flex align-items-center justify-content-center min-vh-100">

  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-5 col-lg-4">

        <div class="card shadow-lg border-0">
          <div class="card-body p-4">

            <!-- Title -->
            <h3 class="text-center fw-bold mb-1">Welcome Back</h3>
            <p class="text-center text-muted mb-4">Login to continue</p>

            <% if ("failed".equals(request.getParameter("error"))) { %>
              <div class="alert alert-danger text-center py-2">
                Login failed. Try again.
              </div>
            <% } %>

            <% if ("role".equals(request.getParameter("error"))) { %>
              <div class="alert alert-danger text-center py-2">
                Access denied.
              </div>
            <% } %>

            <% if ("true".equals(request.getParameter("registered"))) { %>
              <div class="alert alert-success text-center py-2">
                Registration successful. Please login.
              </div>
            <% } %>

            <% if ("staff".equals(request.getParameter("registered"))) { %>
              <div class="alert alert-success text-center py-2">
                Staff/Admin registered successfully. Please login.
              </div>
            <% } %>

            <!-- Form -->
            <form method="post" action="LoginServlet" class="mt-3">

              <!-- Roll No -->
              <div class="mb-3">
                <label class="form-label fw-semibold">Roll No</label>
                <input type="text" name="rollNo" class="form-control" required>
              </div>

              <!-- Password -->
              <div class="mb-3">
                <label class="form-label fw-semibold">Password</label>
                <div class="input-group">
                  <input
                    type="password"
                    name="password"
                    id="password"
                    class="form-control"
                    required>
                  <button
                    type="button"
                    class="btn btn-outline-secondary"
                    onclick="togglePassword()">
                    👁
                  </button>
                </div>
              </div>

              <!-- Submit -->
              <button
                type="submit"
                class="btn btn-primary w-100 fw-semibold py-2">
                Login
              </button>
            </form>

            <p class="text-center mt-4 mb-0">
              Don’t have an account?
              <a href="register.jsp" class="text-decoration-none fw-semibold">
                Register
              </a>
            </p>

          </div>
        </div>

      </div>
    </div>
  </div>

  <!-- Minimal JS only for password toggle -->
  <script>
    function togglePassword() {
      const input = document.getElementById("password");
      input.type = input.type === "password" ? "text" : "password";
    }
  </script>

</body>
</html>
