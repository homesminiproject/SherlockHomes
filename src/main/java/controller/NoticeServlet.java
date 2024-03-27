package controller;

import DAO.NoticeDAO;
import DTO.NoticeDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({"*.do5"})
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String URI = request.getRequestURI();
		String PATH = URI.substring(URI.lastIndexOf("/"));
		String searchCondition;
		String searchKeyword;
		NoticeDAO dao;
		if (PATH.equals("/insertNotice.do5")) {
			System.out.println("공지사항 등록 처리");
			searchCondition = request.getParameter("title");
			searchKeyword = request.getParameter("content");
			NoticeDTO dto = new NoticeDTO();
			dto.setTitle(searchCondition);
			dto.setContent(searchKeyword);
			dao = new NoticeDAO();
			dao.insertNotice(dto);
			request.getRequestDispatcher("/pages/notice/notice.jsp").forward(request, response);
		} else {
			NoticeDTO notice;
			if (PATH.equals("/updateNotice.do5")) {
				System.out.println("공지사항 수정 처리");
				searchCondition = request.getParameter("title");
				int n_no = Integer.parseInt(request.getParameter("n_no"));
				String content = request.getParameter("content");
				notice = new NoticeDTO();
				notice.setTitle(searchCondition);
				notice.setContent(content);
				notice.setN_no(n_no);
				NoticeDAO dao = new NoticeDAO();
				dao.updateNotice(notice);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/notice/notice.jsp");
				dispatcher.forward(request, response);
			} else {
				NoticeDTO dto;
				NoticeDAO dao;
				if (PATH.equals("/deleteNotice.do5")) {
					System.out.println("공지사항 삭제 처리");
					searchCondition = request.getParameter("n_no");
					dto = new NoticeDTO();
					dto.setN_no(Integer.parseInt(searchCondition));
					dao = new NoticeDAO();
					dao.deleteNotice(dto);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/notice/notice.jsp");
					dispatcher.forward(request, response);
				} else if (PATH.equals("/getNotice.do5")) {
					System.out.println("공지사항 상세 조회 처리");
					int n_no = Integer.parseInt(request.getParameter("n_no"));
					dto = new NoticeDTO();
					dto.setN_no(n_no);
					dao = new NoticeDAO();
					notice = dao.getNotice(dto);
					request.setAttribute("notice", notice);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/notice/noticeUpdate.jsp");
					dispatcher.forward(request, response);
				} else if (PATH.equals("/getListNotice.do5")) {
					System.out.println("공지사항 목록 검색 처리");
					searchCondition = request.getParameter("searchCondition");
					searchKeyword = request.getParameter("searchKeyword");
					HttpSession session = request.getSession();
					session.setAttribute("condition", searchCondition);
					session.setAttribute("keyword", searchKeyword);
					dao = new NoticeDAO();
					List<NoticeDTO> noticeList = dao.searchNotice(searchCondition, searchKeyword);
					request.setAttribute("noticeList", noticeList);
					request.getRequestDispatcher("/pages/general/notice_data.jsp").forward(request, response);
				}
			}
		}

	}
}