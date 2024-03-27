package controller;

import DAO.ReportDAO;
import DTO.ReportDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({"*.do7"})
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String URI = request.getRequestURI();
		String PATH = URI.substring(URI.lastIndexOf("/"));
		String searchCondition;
		RequestDispatcher dispatcher;
		if (PATH.equals("/updateReport.do7")) {
			System.out.println("신고 수정");
			searchCondition = request.getParameter("selectStatus");
			int r_no = Integer.parseInt(request.getParameter("r_no"));
			ReportDTO dto = new ReportDTO();
			dto.setR_no(r_no);
			dto.setSelectStatus(searchCondition);
			ReportDAO dao = new ReportDAO();
			dao.updateReport(dto);
			dispatcher = request.getRequestDispatcher("/pages/report/report.jsp");
			dispatcher.forward(request, response);
		} else {
			ReportDTO dto;
			ReportDAO ReportDAO;
			ReportDTO dto;
			if (PATH.equals("/getReport.do7")) {
				System.out.println("신고 상세 조회 처리");
				int R_no = Integer.parseInt(request.getParameter("r_no"));
				dto = new ReportDTO();
				dto.setR_no(R_no);
				ReportDAO = new ReportDAO();
				dto = ReportDAO.getReport(dto);
				request.setAttribute("report", dto);
				dispatcher = request.getRequestDispatcher("/pages/report/reportUpdate.jsp");
				dispatcher.forward(request, response);
			} else if (PATH.equals("/getListReport.do7")) {
				System.out.println("신고 목록 검색 처리");
				searchCondition = request.getParameter("searchCondition");
				String searchKeyword = request.getParameter("searchKeyword");
				if (searchCondition == null) {
					searchCondition = "TITLE";
				}

				if (searchKeyword == null) {
					searchKeyword = "";
				}

				HttpSession session = request.getSession();
				session.setAttribute("condition", searchCondition);
				session.setAttribute("keyword", searchKeyword);
				dto = new ReportDTO();
				dto.setSearchCondition("TITLE");
				dto.setSearchKeyword("");
				ReportDAO dao = new ReportDAO();
				List<ReportDTO> reportList = dao.getReportList(dto);
				request.setAttribute("reportList", reportList);
				request.getRequestDispatcher("/pages/report/report.jsp").forward(request, response);
			} else if (PATH.equals("/deleteReport.do7")) {
				System.out.println("신고 삭제 처리");
				searchCondition = request.getParameter("r_no");
				dto = new ReportDTO();
				dto.setR_no(Integer.parseInt(searchCondition));
				ReportDAO = new ReportDAO();
				ReportDAO.deleteReport(dto);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/report/report.jsp");
				dispatcher.forward(request, response);
			}
		}

	}
}