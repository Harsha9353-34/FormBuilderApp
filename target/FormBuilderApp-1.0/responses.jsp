<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,db.DBConnection,model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int formId = Integer.parseInt(request.getParameter("formId"));
    Connection con = DBConnection.getConnection();

    String sql = "SELECT r.id, r.submitted_at, u.name, u.email " +
                 "FROM responses r JOIN users u ON r.user_id = u.id WHERE r.form_id=?";

    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, formId);
    ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Responses</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">

    <h3 class="mb-4">Form Responses</h3>

<%
boolean hasData = false;

while (rs.next()) {
    hasData = true;
    int responseId = rs.getInt("id");
%>

    <div class="border p-3 mb-4 bg-white">

        <!-- User Info -->
        <p><b>Name:</b> <%= rs.getString("name") %></p>
        <p><b>Email:</b> <%= rs.getString("email") %></p>
        <p><b>Submitted At:</b> <%= rs.getTimestamp("submitted_at") %></p>

        <hr>

<%
    String ansSql = "SELECT q.question_text, a.answer_text " +
                    "FROM answers a JOIN questions q " +
                    "ON a.question_id = q.id WHERE a.response_id=?";

    PreparedStatement ps2 = con.prepareStatement(ansSql);
    ps2.setInt(1, responseId);
    ResultSet ansRs = ps2.executeQuery();

    while (ansRs.next()) {
%>

        <p class="fw-bold"><%= ansRs.getString("question_text") %></p>
        <p>Answer: <%= ansRs.getString("answer_text") %></p>

<%
    }
%>

    </div>

<%
}
%>

<%
if (!hasData) {
%>
    <p>No responses yet.</p>
<%
}
%>

<a href="forms.jsp" class="btn btn-secondary">Back</a>

</div>

</body>
</html>