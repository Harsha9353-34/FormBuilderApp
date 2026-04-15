package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.FormDAO;
import model.User;

public class DeleteFormServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int formId = Integer.parseInt(req.getParameter("formId"));

        User user = (User) req.getSession().getAttribute("user");

        FormDAO dao = new FormDAO();

        // 🔥 check ownership before delete
        if (dao.isOwner(formId, user.getId())) {
            dao.deleteForm(formId);
        }

        res.sendRedirect("forms.jsp");
    }
}