<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User, java.sql.*, db.DBConnection" %>

<%
    User user = (User) session.getAttribute("user");
    String formIdParam = request.getParameter("formId");

    if (user == null || formIdParam == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int formId = Integer.parseInt(formIdParam);
    int questionCount = 0;

    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM questions WHERE form_id=?");
    ps.setInt(1, formId);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        questionCount = rs.getInt(1);
    }

    String shareLink = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/viewForm.jsp?formId=" + formId;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Question</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

</head>

<body class="bg-light">

<!-- 🔝 NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm mb-5">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="bi bi-ui-radios-grid me-2"></i>FormApp
            </a>
            
            <div class="d-flex align-items-center">
                <span class="text-light me-3">
                    <i class="bi bi-person-circle me-1"></i><strong><%= user.getName() %></strong>
                </span>
                <a href="logout" class="btn btn-outline-light btn-sm rounded-pill px-3">
                    <i class="bi bi-box-arrow-right me-1"></i> Logout
                </a>
            </div>
        </div>
</nav>

<!-- 🔽 CONTENT -->
<div class="container mt-5" style="max-width: 700px;">

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h4>
            <i class="bi bi-question-circle me-2"></i>
            Add Question
        </h4>
    </div>

    <!-- Question Form -->
    <div class="bg-white p-4 border mb-4">

        <form action="addQuestion" method="post">
            <input type="hidden" name="formId" value="<%= formId %>">

            <div class="mb-3">
                <label class="form-label">Question</label>
                <input type="text" name="question" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Type</label>
                <select name="type" id="typeSelector" class="form-select" onchange="toggleType()">
                    <option value="text">Text</option>
                    <option value="mcq">MCQ</option>
                </select>
            </div>

            <div id="mcqSection" style="display:none;" class="mb-3">
                <label class="form-label">Options</label>
                <input type="text" name="opt1" class="form-control mb-2" placeholder="Option 1">
                <input type="text" name="opt2" class="form-control" placeholder="Option 2">
            </div>

            <button type="submit" class="btn btn-primary">
                <i class="bi bi-plus"></i> Add Question
            </button>
        </form>

    </div>

    <!-- Share Section -->
    <div class="bg-white p-4 border mb-3">

        <label class="form-label">Share Link</label>

        <div class="input-group">
            <input type="text" id="shareLink" class="form-control" value="<%= shareLink %>" readonly>
            <button class="btn btn-outline-secondary" onclick="copyLink(this)">
                <i class="bi bi-clipboard"></i>
            </button>
        </div>

    </div>

    <!-- Actions -->
    <div class="d-flex gap-2 mb-3">
        <a href="viewForm.jsp?formId=<%= formId %>" class="btn btn-outline-primary">
            <i class="bi bi-eye"></i> Preview
        </a>

        <a href="dashboard.jsp" class="btn btn-dark">
            Finish
        </a>
    </div>

    <!-- Info -->
    <p class="text-muted small">
        Total Questions: <strong><%= questionCount %></strong>
    </p>

</div>

<script>
function toggleType() {
    const type = document.getElementById('typeSelector').value;
    document.getElementById('mcqSection').style.display = (type === 'mcq') ? 'block' : 'none';
}

function copyLink(btn) {
    const copyText = document.getElementById("shareLink");

    navigator.clipboard.writeText(copyText.value);

    const originalHTML = btn.innerHTML;

    btn.innerHTML = "Copied";
    
    setTimeout(() => {
        btn.innerHTML = originalHTML;
    }, 2000);
}
</script>

</body>
</html>