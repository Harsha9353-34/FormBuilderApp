package controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import dao.UserDAO;
import model.User;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.login(email, password);

        if (user != null) {

            // create session
            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            // handle redirect AFTER login success
            String redirect = req.getParameter("redirect");

            if (redirect != null && !redirect.equals("") && !redirect.equals("null")) {
                res.sendRedirect(redirect);
            } else {
                res.sendRedirect("dashboard.jsp");
            }
            

        } else {
            res.getWriter().println("Invalid Credentials");
        }
    }
}