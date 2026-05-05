<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
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
    <title>Create New Form</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    
    <style>
        .form-card { border-radius: 1rem; border: none; }
        #mcqOptionsSection { 
            display: none; 
            animation: fadeIn 0.3s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm mb-5">
        <div class="container">
            <a class="navbar-brand fw-bold" href="dashboard.jsp">
                <i class="bi bi-ui-radios-grid me-2"></i>FormApp
            </a>
            <div class="d-flex align-items-center">
                <span class="text-light me-3 d-none d-sm-inline">
                    <i class="bi bi-person-circle me-1"></i> <%= user.getName() %>
                </span>
                <a href="logout" class="btn btn-outline-light btn-sm rounded-pill px-3">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                
                <div class="card shadow-sm form-card">
                    <div class="card-body p-4 p-md-5">
                        
                        <div class="text-center mb-4">
                            <div class="bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                                <i class="bi bi-plus-lg fs-3"></i>
                            </div>
                            <h3 class="fw-bold">Create New Form</h3>
                            <p class="text-muted">Start by giving your form a title</p>
                        </div>

                        <form action="createForm" method="post">
                            
                            <div class="mb-4">
                                <label class="form-label fw-bold">Form Title</label>
                                <input type="text" name="title" class="form-control form-control-lg" placeholder="e.g. Customer Feedback" required>
                            </div>
                         

                            <button type="submit" class="btn btn-primary btn-lg w-100 rounded-pill shadow-sm">
                                Create Form <i class="bi bi-arrow-right ms-2"></i>
                            </button>

                        </form>

                        <div class="text-center mt-4">
                            <a href="dashboard.jsp" class="text-decoration-none small text-muted">
                                <i class="bi bi-chevron-left"></i> Cancel and go back
                            </a>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <script>
        function toggleMCQ() {
            const type = document.getElementById('questionType').value;
            const mcqSection = document.getElementById('mcqOptionsSection');
            
            if (type === 'mcq') {
                mcqSection.style.display = 'block';
            } else {
                mcqSection.style.display = 'none';
            }
        }

        function addOptionField() {
            const container = document.getElementById('extraOptions');
            const div = document.createElement('div');
            div.className = 'input-group mb-2';
            div.innerHTML = `
                <span class="input-group-text bg-white border-end-0"><i class="bi bi-circle"></i></span>
                <input type="text" name="options" class="form-control border-start-0" placeholder="Another option">
            `;
            container.appendChild(div);
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>