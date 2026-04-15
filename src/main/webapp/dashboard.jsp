<%@ page import="model.User" %>

<%
    // Server-side logic kept at the top for clean separation
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        .action-card {
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }
        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
        }
    </style>
</head>

<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm mb-5">
        <div class="container">
            <a class="navbar-brand" href="#">
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

    <div class="container">
        
        <div class="row mb-4">
            <div class="col">
                <h3 class="fw-bold text-secondary">
                    Dashboard
                </h3>
                <p class="text-muted">What would you like to do today?</p>
            </div>
        </div>

        <div class="row g-4">
            
            <div class="col-md-6 col-lg-4">
                <div class="card h-100 border-0 shadow-sm action-card rounded-4">
                    <div class="card-body text-center p-5">
                        <div class="display-4 text-primary mb-3">
                            <i class="bi bi-plus-circle-fill"></i>
                        </div>
                        <h4 class="card-title fw-bold">Create Form</h4>
                        <p class="card-text text-muted mb-4">Design, customize, and publish a new form from scratch.</p>
                        <a href="createForm.jsp" class="btn btn-primary rounded-pill px-4">Get Started</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-4">
                <div class="card h-100 border-0 shadow-sm action-card rounded-4">
                    <div class="card-body text-center p-5">
                        <div class="display-4 text-success mb-3">
                            <i class="bi bi-folder-fill"></i>
                        </div>
                        <h4 class="card-title fw-bold">My Forms</h4>
                        <p class="card-text text-muted mb-4">View responses, edit, and manage your existing forms.</p>
                        <a href="forms.jsp" class="btn btn-success rounded-pill px-4">View Collection</a>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>