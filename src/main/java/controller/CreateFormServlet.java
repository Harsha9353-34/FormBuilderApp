package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.FormDAO;
import model.User;

public class CreateFormServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String title = req.getParameter("title");

        User user = (User) req.getSession().getAttribute("user");

        FormDAO dao = new FormDAO();
        int formId = dao.createForm(title, user.getId());

        res.sendRedirect("addQuestion.jsp?formId=" + formId);
    }
}