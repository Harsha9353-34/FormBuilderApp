<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,db.DBConnection,model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp?redirect=viewForm.jsp?formId=" + request.getParameter("formId"));
        return;
    }

    int formId = Integer.parseInt(request.getParameter("formId"));
    Connection con = DBConnection.getConnection();

    String sql = "SELECT * FROM questions WHERE form_id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, formId);
    ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fill Form</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm mb-5">
        <div class="container">
            <a class="navbar-brand" href="dashboard.jsp">
                <i class="bi bi-ui-radios-grid me-2"></i>FormApp
            </a>
            
            <div class="d-flex align-items-center">
                <span class="text-light me-3">
                    <i class="bi bi-person-circle me-1"></i> Hello, <strong><%= user.getName() %></strong>
                </span>
                <a href="logout" class="btn btn-outline-light btn-sm rounded-pill px-3">
                    <i class="bi bi-box-arrow-right me-1"></i> Logout
                </a>
            </div>
        </div>
    </nav>

    <div class="container" style="max-width: 700px;">
        
        <div class="card border-0 shadow-sm rounded-4 mb-5">
            <div class="card-body p-4 p-md-5">
                <h3 class="mb-4 text-primary fw-bold">
                    <i class="bi bi-file-earmark-text me-2"></i>Fill Form
                </h3>

                <form action="submitForm" method="post">
                    <input type="hidden" name="formId" value="<%= formId %>">

                    <% while (rs.next()) { 
                        int qId = rs.getInt("id");
                    %>
                        <div class="mb-4 bg-white p-3 border rounded-3">
                            <label class="form-label fw-bold mb-3">
                                <%= rs.getString("question_text") %>
                            </label>

                            <% if (rs.getString("type").equals("text")) { %>
                                <input type="text" name="q_<%= qId %>" class="form-control" placeholder="Your answer here...">
                            <% } else { 
                                PreparedStatement ps2 = con.prepareStatement("SELECT * FROM options WHERE question_id=?");
                                ps2.setInt(1, qId);
                                ResultSet optRs = ps2.executeQuery();

                                while (optRs.next()) {
                            %>
                                <div class="form-check mb-2">
                                    <input class="form-check-input" type="radio" name="q_<%= qId %>" id="opt_<%= optRs.getInt("id") %>" value="<%= optRs.getString("option_text") %>">
                                    <label class="form-check-label" for="opt_<%= optRs.getInt("id") %>">
                                        <%= optRs.getString("option_text") %>
                                    </label>
                                </div>
                            <%  } 
                                optRs.close();
                                ps2.close();
                            } %>
                        </div>
                    <% } %>

                    <div class="mt-4">
                        <button type="submit" class="btn btn-primary btn-lg w-100 rounded-pill">
                            Submit Form <i class="bi bi-send ms-2"></i>
                        </button>
                    </div>

                </form>
            </div>
        </div>

    </div>

</body>
</html>

<%
    // Clean up resources
    rs.close();
    ps.close();
    con.close();
%>