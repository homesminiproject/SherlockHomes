package controller;

import DAO.UsersDAO;
import DTO.UsersDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({"*.do1"})
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String URI = request.getRequestURI();
		String PATH = URI.substring(URI.lastIndexOf("/"));
		if (PATH.equals("/loginAdmin.do1")) {
			System.out.println("관리자 로그인 처리");
			String id = request.getParameter("adminid");
			String pw = request.getParameter("pw");
			UsersDAO dao = new UsersDAO();
			UsersDTO user = dao.getUser(id);
			HttpSession session = request.getSession();
			PrintWriter writer;
			if (user != null && user.getRole().equals("user")) {
				response.setContentType("text/html; charset=UTF-8");
				writer = response.getWriter();
				writer.println("<script>alert('관리자 아이디가 아닙니다. 다시 이용해 주세요');location.href='" + request.getContextPath()
						+ "/pages/general/adminLogin.jsp';</script>");
				writer.close();
			}

			if (user != null && user.getAccountlock() == 1) {
				response.setContentType("text/html; charset=UTF-8");
				writer = response.getWriter();
				writer.println("<script>alert('패스워드5회실패로 인해 계정이 잠겼습니다. 관리자에게 문의하세요');location.href='"
						+ request.getContextPath() + "/pages/general/adminLogin.jsp';</script>");
				writer.close();
			} else if (user != null && user.getPw().equals(pw)) {
				System.out.println("로그인 성공");
				session.setAttribute("user", user);
				dao.loginreset(id);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/mainView.do3");
				dispatcher.forward(request, response);
			} else if (user == null) {
				response.setContentType("text/html; charset=UTF-8");
				writer = response.getWriter();
				writer.println("<script>alert('존재하지 않는 아이디입니다.');location.href='" + request.getContextPath()
						+ "/pages/general/adminLogin.jsp';</script>");
				writer.close();
			} else {
				dao.loginFail(id);
				response.setContentType("text/html; charset=UTF-8");
				writer = response.getWriter();
				writer.println("<script>alert('비밀번호가 일치하지 않습니다.');location.href='" + request.getContextPath()
						+ "/pages/general/adminLogin.jsp';</script>");
				writer.close();
			}
		}

	}
}