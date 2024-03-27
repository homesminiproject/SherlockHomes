package controller;

import DAO.QuestionDAO;
import DTO.QuestionDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({"*.do6"})
public class QuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String URI = request.getRequestURI();
		String PATH = URI.substring(URI.lastIndexOf("/"));
		int Q_no;
		String searchKeyword;
		RequestDispatcher dispatcher;
		if (PATH.equals("/updateQuestion.do6")) {
			System.out.println("문의 수정");
			Q_no = Integer.parseInt(request.getParameter("q_no"));
			searchKeyword = request.getParameter("reply");
			QuestionDTO dto = new QuestionDTO();
			dto.setQ_no(Q_no);
			dto.setReply(searchKeyword);
			QuestionDAO dao = new QuestionDAO();
			dao.updateQuestion(dto);
			dispatcher = request.getRequestDispatcher("/pages/question/question.jsp");
			dispatcher.forward(request, response);
		} else {
			QuestionDTO dto;
			QuestionDAO questionDAO;
			QuestionDTO dto;
			if (PATH.equals("/getQuestion.do6")) {
				System.out.println("문의 답변 처리");
				Q_no = Integer.parseInt(request.getParameter("q_no"));
				System.out.println(1);
				dto = new QuestionDTO();
				dto.setQ_no(Q_no);
				System.out.println(Q_no);
				questionDAO = new QuestionDAO();
				dto = questionDAO.getQuestion(dto);
				System.out.println(3);
				request.setAttribute("question", dto);
				System.out.println(4);
				dispatcher = request.getRequestDispatcher("/pages/question/questionUpdate.jsp");
				dispatcher.forward(request, response);
			} else {
				String q_no;
				if (PATH.equals("/getListQuestion.do6")) {
					System.out.println("문의 검색 처리");
					q_no = request.getParameter("searchCondition");
					searchKeyword = request.getParameter("searchKeyword");
					HttpSession session = request.getSession();
					session.setAttribute("condition", q_no);
					session.setAttribute("keyword", searchKeyword);
					dto = new QuestionDTO();
					QuestionDAO dao = new QuestionDAO();
					List<QuestionDTO> questionList = dao.getQuestionList(dto);
					request.setAttribute("questionList", questionList);
					request.getRequestDispatcher("/pages/question/question.jsp").forward(request, response);
				} else if (PATH.equals("/deleteQuestion.do6")) {
					System.out.println("문의 삭제 처리");
					q_no = request.getParameter("q_no");
					dto = new QuestionDTO();
					dto.setQ_no(Integer.parseInt(q_no));
					questionDAO = new QuestionDAO();
					questionDAO.deleteQuestion(dto);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/question/question.jsp");
					dispatcher.forward(request, response);
				}
			}
		}

	}
}