package controller;


import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import dao.UserDAO;
import model.User;

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        User user = new User();
        user.setName(req.getParameter("name"));
        user.setEmail(req.getParameter("email"));
        user.setPassword(req.getParameter("password"));
        user.setRole("student");

        UserDAO dao = new UserDAO();

        if (dao.register(user)) {
            res.sendRedirect("login.jsp");
        } else {
            res.getWriter().println("Error");
        }
    }
}