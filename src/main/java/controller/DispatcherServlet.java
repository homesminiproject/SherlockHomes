package controller;

import DAO.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({"*.do3"})
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String URI = request.getRequestURI();
		String PATH = URI.substring(URI.lastIndexOf("/"));
		if (PATH.equals("/logout.do3")) {
			System.out.println("로그아웃 처리");
			HttpSession session = request.getSession();
			session.invalidate();
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		} else if (PATH.equals("/mainView.do3")) {
			System.out.println("메인 페이지로 이동");
			UsersDAO usersDAO = new UsersDAO();
			List<Integer> userData = new ArrayList();
			userData.add(usersDAO.all_user());
			userData.add(usersDAO.today_user());
			userData.add(usersDAO.all_agent());
			userData.add(usersDAO.today_agent());
			userData.add(usersDAO.all_estate());
			userData.add(usersDAO.today_estate());
			request.setAttribute("userData", userData);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/general/main.jsp");
			dispatcher.forward(request, response);
		} else if (PATH.equals("/kakaomainView.do3")) {
			System.out.println("카카오 로그인");
			String userId = request.getParameter("userId");
			System.out.println(userId);
			UsersDAO usersDAO = new UsersDAO();
			List<Integer> userData = new ArrayList();
			userData.add(usersDAO.all_user());
			userData.add(usersDAO.today_user());
			userData.add(usersDAO.all_agent());
			userData.add(usersDAO.today_agent());
			userData.add(usersDAO.all_estate());
			userData.add(usersDAO.today_estate());
			request.setAttribute("userData", userData);
			request.setAttribute("userId", userId);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/general/main.jsp");
			dispatcher.forward(request, response);
		} else {
			System.out.println("에러");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('에러 발생');location.href='" + request.getContextPath()
					+ "/pages/etc/error.jsp';</script>");
			writer.close();
		}

	}
}