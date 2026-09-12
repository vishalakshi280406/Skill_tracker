<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register</title>
<script src="https://cdn.tailwindcss.com"></script>
<% if ("exists".equals(request.getParameter("error"))) { %>
  <div class="shake mb-4 bg-red-100 text-red-700 text-center p-3 rounded-lg font-semibold">
    ❌ Roll Number already registered
  </div>
<% } %>

<% if ("pin".equals(request.getParameter("error"))) { %>
  <div class="shake mb-4 bg-red-100 text-red-700 text-center p-3 rounded-lg font-semibold">
    ❌ Invalid Security PIN
  </div>
<% } %>

<% if ("db".equals(request.getParameter("error"))) { %>
  <div class="shake mb-4 bg-red-100 text-red-700 text-center p-3 rounded-lg font-semibold">
    ❌ Database error. Try again.
  </div>
<% } %>

<style>
  body {
    background: linear-gradient(135deg, #1e3a8a, #0f172a);
    font-family: 'Inter', sans-serif;
  }

  .shake {
    animation: shake 0.4s;
  }

  @keyframes shake {
    0% { transform: translateX(0); }
    25% { transform: translateX(-6px); }
    50% { transform: translateX(6px); }
    75% { transform: translateX(-6px); }
    100% { transform: translateX(0); }
  }

  .success-pop {
    animation: pop 0.6s ease-out forwards;
  }

  @keyframes pop {
    0% { transform: scale(0.7); opacity: 0; }
    100% { transform: scale(1); opacity: 1; }
  }
</style>
</head>

<body class="min-h-screen flex items-center justify-center">

<div class="w-full max-w-md">
  <div id="card" class="bg-white rounded-xl shadow-2xl p-8">

    <h1 class="text-2xl font-bold text-center text-blue-800 mb-6">
      Student / Staff Registration
    </h1>

    <!-- SUCCESS POPUP -->
    <% if ("success".equals(request.getParameter("status"))) { %>
      <div id="successPopup"
           class="success-pop mb-4 text-center bg-green-100 text-green-700 font-semibold p-3 rounded-lg">
        🎉 Registered Successfully! Redirecting to Login...
      </div>
      <script>
        setTimeout(function() {
          window.location.href = 'login.jsp?registered=true';
        }, 3000);
      </script>
    <% } %>

    <!-- ERROR POPUP -->
    <% if ("error".equals(request.getParameter("error"))) { %>
      <div class="shake mb-4 text-center bg-red-100 text-red-700 font-semibold p-3 rounded-lg">
        ⚠ Registration failed. Please check your details.
      </div>
    <% } %>

    <form method="post" action="RegisterServlet" class="space-y-4">

      <!-- ROLL NO -->
      <div>
        <label class="text-sm font-medium">Roll Number</label>
        <input type="text" name="rollNo" required
          class="w-full border rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-600">
      </div>

      <!-- ROLE -->
      <div>
        <label class="text-sm font-medium">Role</label>
        <select name="role" id="role" onchange="togglePin()"
          class="w-full border rounded-lg px-4 py-2">
          <option value="STUDENT">Student</option>
          <option value="STAFF">Staff</option>
          <option value="ADMIN">Admin</option>
        </select>
      </div>

      <!-- PASSWORD -->
      <div>
        <label class="text-sm font-medium">Password</label>
        <input type="password" id="password" name="password"
          onkeyup="checkPassword(event)"
          class="w-full border rounded-lg px-4 py-2">

        <p id="capsWarning" class="hidden text-xs text-red-600 mt-1">
          ⚠ Caps Lock is ON
        </p>

        <p id="strength" class="text-xs mt-1 font-semibold"></p>
      </div>

      <!-- PIN (STAFF / ADMIN ONLY) -->
      <div id="pinBox" class="hidden">
        <label class="text-sm font-medium">Security PIN (4 digits)</label>
        <input type="password" name="pin" maxlength="4"
          class="w-full border rounded-lg px-4 py-2">
      </div>

      <!-- REMEMBER ME -->
      <div class="flex items-center gap-2">
        <input type="checkbox" name="remember">
        <span class="text-sm">Remember Me</span>
      </div>

      <!-- SUBMIT -->
      <button type="submit"
        class="w-full bg-blue-700 hover:bg-blue-800 text-white py-2 rounded-lg font-semibold transition">
        Register
      </button>

    </form>

  </div>
</div>

<script>
function togglePin() {
  const role = document.getElementById("role").value;
  document.getElementById("pinBox").style.display =
    (role === "STAFF" || role === "ADMIN") ? "block" : "none";
}

function checkPassword(e) {
  const pwd = e.target.value;
  const strength = document.getElementById("strength");
  const caps = document.getElementById("capsWarning");

  // Caps lock warning
  caps.classList.toggle("hidden", !e.getModifierState("CapsLock"));

  const strong =
    /[A-Z]/.test(pwd) &&
    /[a-z]/.test(pwd) &&
    /[0-9]/.test(pwd) &&
    /[^A-Za-z0-9]/.test(pwd);

  if (pwd.length === 0) {
    strength.textContent = "";
    return;
  }

  if (strong) {
    strength.textContent = "✅ Strong Password";
    strength.className = "text-xs mt-1 text-green-600 font-semibold";
  } else {
    strength.textContent =
      "❌ Weak Password (Use A-Z, a-z, 0-9 & special char)";
    strength.className = "text-xs mt-1 text-red-600 font-semibold";
  }
}
</script>

</body>
</html>
