<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FormApp | Create & Share Forms</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #0d6efd 0%, #0a58ca 100%);
            padding: 100px 0;
        }
        .feature-icon {
            font-size: 2.5rem;
            color: #0d6efd;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary" href="#">
                <i class="bi bi-ui-radios-grid me-2"></i>FormApp
            </a>
            <div class="ms-auto">
                <a href="login.jsp" class="btn btn-outline-primary me-2 rounded-pill">Login</a>
                <a href="register.jsp" class="btn btn-primary rounded-pill">Sign Up Free</a>
            </div>
        </div>
    </nav>

    <header class="hero-section text-white text-center">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <h1 class="display-3 fw-bold mb-4">Build beautiful forms in minutes.</h1>
                    <p class="lead mb-5 opacity-75">The easiest way to create surveys, quizzes, and data collection forms without writing a single line of code.</p>
                    <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
                        <a href="register.jsp" class="btn btn-light btn-lg px-4 rounded-pill fw-bold">Get Started</a>
                        <a href="#features" class="btn btn-outline-light btn-lg px-4 rounded-pill">Learn More</a>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <section id="features" class="py-5">
        <div class="container py-5">
            <div class="row g-4 text-center">
                <div class="col-md-4">
                    <div class="p-4">
                        <i class="bi bi-lightning-charge-fill feature-icon mb-3"></i>
                        <h4>Fast Setup</h4>
                        <p class="text-muted">Create your first form in under 60 seconds with our intuitive interface.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-4">
                        <i class="bi bi-phone-fill feature-icon mb-3"></i>
                        <h4>Responsive</h4>
                        <p class="text-muted">Your forms look great on desktops, tablets, and smartphones automatically.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-4">
                        <i class="bi bi-bar-chart-fill feature-icon mb-3"></i>
                        <h4>Live Results</h4>
                        <p class="text-muted">View responses in real-time with built-in analytics and data tracking.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="bg-dark text-light py-5">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5 class="fw-bold"><i class="bi bi-ui-radios-grid me-2"></i>FormApp</h5>
                    <p class="small opacity-50">© 2026 FormApp Inc. All rights reserved.</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <a href="#" class="text-light me-3 text-decoration-none">Privacy Policy</a>
                    <a href="#" class="text-light text-decoration-none">Terms of Service</a>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>