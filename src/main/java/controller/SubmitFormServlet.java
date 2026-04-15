package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Enumeration;
import dao.ResponseDAO;
import model.User;

public class SubmitFormServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int formId = Integer.parseInt(req.getParameter("formId"));
        User user = (User) req.getSession().getAttribute("user");

        if (user == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        ResponseDAO dao = new ResponseDAO();
        int responseId = dao.createResponse(formId, user.getId());

        Enumeration<String> params = req.getParameterNames();

        while (params.hasMoreElements()) {
            String name = params.nextElement();

            if (name.startsWith("q_")) {
                int questionId = Integer.parseInt(name.split("_")[1]);
                String answer = req.getParameter(name);

                dao.saveAnswer(responseId, questionId, answer);
            }
        }

        res.getWriter().println("Form Submitted Successfully!");
    }
}