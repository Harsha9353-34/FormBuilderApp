<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<!-- Bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5" style="max-width: 400px;">

    <h3 class="mb-4 text-center">Login</h3>

    <form action="login" method="post">

        <%
            String redirect = request.getParameter("redirect");
            if (redirect == null) redirect = "";
        %>

        <input type="hidden" name="redirect" value="<%= redirect %>">

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-primary w-100">Login</button>

    </form>

    <p class="mt-3 text-center">
        Don't have an account? <a href="register.jsp">Register</a>
    </p>

</div>

</body>
</html>