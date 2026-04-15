package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.QuestionDAO;

public class AddQuestionServlet extends HttpServlet {


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	    int formId = Integer.parseInt(req.getParameter("formId"));
	    String question = req.getParameter("question");
	    String type = req.getParameter("type");
	    String opt1 = req.getParameter("opt1");
	    String opt2 = req.getParameter("opt2");

	    QuestionDAO dao = new QuestionDAO();
	    dao.addQuestion(formId, question, type, opt1, opt2);

	    // Redirect back to the SAME page to allow adding more questions
	    res.sendRedirect("addQuestion.jsp?formId=" + formId);
	}
}