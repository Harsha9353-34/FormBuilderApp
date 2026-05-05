<%@ page import="java.sql.*,db.DBConnection,model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection con = DBConnection.getConnection();

    String sql = "SELECT * FROM forms WHERE created_by=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, user.getId());

    ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Forms</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">

    <h3 class="mb-4">Your Forms</h3>

    <a href="createForm.jsp" class="btn btn-primary mb-3">+ Create New Form</a>

    <table class="table table-bordered bg-white">
        <thead>
            <tr>
                <th>Title</th>
                <th>Share Link</th>
                <th>Actions</th>
            </tr>
        </thead>

        <tbody>

<%
while (rs.next()) {
    int id = rs.getInt("id");
%>

<tr>
    <td><%= rs.getString("title") %></td>

    <td>
        <input type="text"
               class="form-control"
               value="http://localhost:8080/FormBuilderApp/viewForm.jsp?formId=<%= id %>"
               readonly>
    </td>

    <td>
        <a href="viewForm.jsp?formId=<%= id %>" class="btn btn-sm btn-outline-primary">Open</a>

        <a href="responses.jsp?formId=<%= id %>" class="btn btn-sm btn-outline-success">Responses</a>

        <a href="deleteForm?formId=<%= id %>"
           class="btn btn-sm btn-outline-danger"
           onclick="return confirm('Delete this form?')">
           Delete
        </a>
    </td>
</tr>

<%
}
%>

        </tbody>
    </table>

    <a href="dashboard.jsp">Back to Dashboard</a>

</div>

</body>
</html>