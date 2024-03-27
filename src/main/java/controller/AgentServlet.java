package controller;

import DAO.AgentDAO;
import DTO.AgentDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({"*.do2"})
public class AgentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String URI = request.getRequestURI();
		String PATH = URI.substring(URI.lastIndexOf("/"));
		String searchCondition;
		String searchKeyword;
		if (PATH.equals("/loginAgent.do2")) {
			System.out.println("공인중개사 로그인 처리");
			searchCondition = request.getParameter("agentid");
			searchKeyword = request.getParameter("pw");
			AgentDAO dao = new AgentDAO();
			AgentDTO user = dao.getAgent(searchCondition);
			HttpSession session = request.getSession();
			PrintWriter writer;
			if (user != null && user.getStatus().equalsIgnoreCase("승인대기")) {
				response.setContentType("text/html; charset=UTF-8");
				writer = response.getWriter();
				writer.println("<script>alert('승인대기 상태입니다. 관리자에게 문의하세요');location.href='" + request.getContextPath()
						+ "/pages/company/companyLogin.jsp';</script>");
				writer.close();
			}

			if (user != null && user.getAccountlock() == 1) {
				response.setContentType("text/html; charset=UTF-8");
				writer = response.getWriter();
				writer.println("<script>alert('패스워드5회실패로 인해 계정이 잠겼습니다. 관리자에게 문의하세요');location.href='"
						+ request.getContextPath() + "/pages/company/companyLogin.jsp';</script>");
				writer.close();
			} else if (user != null && user.getPw().equals(searchKeyword)) {
				System.out.println("로그인 성공");
				session.setAttribute("user", user);
				dao.loginreset(searchCondition);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/mainView.do3");
				dispatcher.forward(request, response);
			} else if (user == null) {
				response.setContentType("text/html; charset=UTF-8");
				writer = response.getWriter();
				writer.println("<script>alert('존재하지 않는 아이디입니다.');location.href='" + request.getContextPath()
						+ "/pages/company/companyLogin.jsp';</script>");
				writer.close();
			} else {
				dao.loginFail(searchCondition);
				response.setContentType("text/html; charset=UTF-8");
				writer = response.getWriter();
				writer.println("<script>alert('비밀번호가 일치하지 않습니다.');location.href='" + request.getContextPath()
						+ "/pages/company/companyLogin.jsp';</script>");
				writer.close();
			}
		} else {
			String jibunaddress;
			String detailaddress;
			String reportStr;
			String rep_name;
			String roadaddress;
			if (PATH.equals("/membershipAgent.do2")) {
				System.out.println("공인중개사 회원가입 처리");
				searchCondition = request.getParameter("id");
				searchKeyword = request.getParameter("pw1");
				rep_name = request.getParameter("rep_name");
				String postcodestr = request.getParameter("postcode");
				int postcode = Integer.parseInt(postcodestr);
				roadaddress = request.getParameter("roadaddress");
				jibunaddress = request.getParameter("jibunaddress");
				detailaddress = request.getParameter("detailaddress");
				String phone1 = request.getParameter("phone1");
				String phone2 = request.getParameter("phone2");
				reportStr = request.getParameter("phone3");
				String phoneStr = phone1 + phone2 + reportStr;
				long phone = Long.parseLong(phoneStr);
				long license_number = 0L;
				long regi_number = 0L;
				String agency_name = request.getParameter("agency_name");
				String license_numberStr = request.getParameter("license_number");

				try {
					license_number = Long.parseLong(license_numberStr);
				} catch (NumberFormatException var31) {
					var31.printStackTrace();
				}

				System.out.println(license_number);
				String regi_numberStr = request.getParameter("regi_number");

				try {
					regi_number = Long.parseLong(regi_numberStr);
				} catch (NumberFormatException var30) {
					var30.printStackTrace();
				}

				AgentDTO dto = new AgentDTO();
				dto.setId(searchCondition);
				dto.setPw(searchKeyword);
				dto.setRep_name(rep_name);
				dto.setPostcode(postcode);
				dto.setRoadaddress(roadaddress);
				dto.setJibunaddress(jibunaddress);
				dto.setDetailaddress(detailaddress);
				dto.setPhone(phone);
				dto.setAgency_name(agency_name);
				dto.setLicense_number(license_number);
				dto.setRegi_number(regi_number);
				AgentDAO agent = new AgentDAO();
				int result = agent.insertUser(dto);
				RequestDispatcher dispatcher;
				if (result == 1) {
					request.getSession().setAttribute("messageType", "입력 성공 메시지");
					request.getSession().setAttribute("messageContent", "회원 가입 완료");
					dispatcher = request.getRequestDispatcher("/loginViewAgent.do2");
					dispatcher.forward(request, response);
				} else {
					request.getSession().setAttribute("messageType", "입력 오류 메시지");
					request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
					dispatcher = request.getRequestDispatcher("/loginViewAgent.do2");
					dispatcher.forward(request, response);
				}
			} else {
				AgentDAO AgentDAO;
				if (PATH.equals("/RegisterCheckAgent.do2")) {
					System.out.println("공인중개사 아이디 중복 체크 처리");
					searchCondition = request.getParameter("id");
					AgentDAO = new AgentDAO();
					response.getWriter().write(String.valueOf(AgentDAO.registerCheck(searchCondition)));
				} else {
					int ea_no;
					if (PATH.equals("/getAgent.do2")) {
						System.out.println("공인중개사 조회 처리");
						ea_no = Integer.parseInt(request.getParameter("ea_no"));
						AgentDAO = new AgentDAO();
						AgentDTO agent = AgentDAO.getAgent2(ea_no);
						request.setAttribute("agent", agent);
						RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/company/companyUpdate.jsp");
						dispatcher.forward(request, response);
					} else {
						int currentPages;
						if (PATH.equals("/updateAgent.do2")) {
							System.out.println("공인중개사 수정 처리");
							searchCondition = request.getParameter("rep_name");
							searchKeyword = request.getParameter("agency_name");
							rep_name = request.getParameter("postcode");
							currentPages = Integer.parseInt(rep_name);
							String roadaddress = request.getParameter("roadaddress");
							roadaddress = request.getParameter("jibunaddress");
							jibunaddress = request.getParameter("detailaddress");
							detailaddress = request.getParameter("phone");
							long phone = Long.parseLong(detailaddress);
							reportStr = request.getParameter("report");
							int report = Integer.parseInt(reportStr);
							String status = request.getParameter("status");
							String f_countStr = request.getParameter("f_count");
							int f_count = Integer.parseInt(f_countStr);
							String accountlockStr = request.getParameter("accountlock");
							int accountlock = Integer.parseInt(accountlockStr);
							String id = request.getParameter("id");
							AgentDTO dto = new AgentDTO();
							dto.setRep_name(searchCondition);
							dto.setAgency_name(searchKeyword);
							dto.setPostcode(currentPages);
							dto.setRoadaddress(roadaddress);
							dto.setJibunaddress(roadaddress);
							dto.setDetailaddress(jibunaddress);
							dto.setPhone(phone);
							dto.setReport(report);
							dto.setStatus(status);
							dto.setF_count(f_count);
							dto.setAccountlock(accountlock);
							dto.setId(id);
							AgentDAO dao = new AgentDAO();
							dao.updateAgent(dto);
							RequestDispatcher dispatcher = request.getRequestDispatcher("/listAgent.do2");
							dispatcher.forward(request, response);
						} else if (PATH.equals("/deleteAgent.do2")) {
							System.out.println("공인중개사 삭제");
							ea_no = Integer.parseInt(request.getParameter("ea_no"));
							AgentDAO = new AgentDAO();
							AgentDAO.deleteAgent(ea_no);
							RequestDispatcher dispatcher = request.getRequestDispatcher("/listAgent.do2");
							dispatcher.forward(request, response);
						} else {
							int startAgentIndex;
							int totalPage;
							int endAgentIndex;
							if (PATH.equals("/SearchAgent.do2")) {
								System.out.println("공인중개사 검색");
								searchCondition = request.getParameter("searchCondition");
								searchKeyword = request.getParameter("searchKeyword");
								HttpSession session = request.getSession();
								session.setAttribute("condition", searchCondition);
								session.setAttribute("keyword", searchKeyword);
								AgentDAO AgentDAO = new AgentDAO();
								List<AgentDTO> agentList = AgentDAO.searchAgent(searchCondition, searchKeyword);
								totalPage = AgentDAO.all_agent();
								startAgentIndex = request.getParameter("page") != null
										? Integer.parseInt(request.getParameter("page"))
										: 1;
								endAgentIndex = 10;
								int totalPages = (totalPage + endAgentIndex - 1) / endAgentIndex;
								int startUserIndex = (startAgentIndex - 1) * endAgentIndex;
								int endUserIndex = Math.min(startUserIndex + endAgentIndex - 1, totalPage);
								boolean hasPreviousPage = startAgentIndex > 1;
								boolean hasNextPage = totalPage > endUserIndex;
								request.setAttribute("agentList", agentList);
								request.setAttribute("total", totalPage);
								request.setAttribute("startUserIndex", startUserIndex);
								request.setAttribute("endUserIndex", endUserIndex);
								request.setAttribute("hasPreviousPage", hasPreviousPage);
								request.setAttribute("hasNextPage", hasNextPage);
								request.setAttribute("currentPage", startAgentIndex);
								request.setAttribute("totalPages", totalPages);
								request.getRequestDispatcher("/pages/company/companyList.jsp").forward(request,
										response);
							} else {
								AgentDAO AgentDAO;
								if (PATH.equals("/listAgent.do2")) {
									AgentDAO = new AgentDAO();
									List<AgentDTO> agentList = AgentDAO.getAgentList();
									int total = AgentDAO.all_agent();
									currentPages = request.getParameter("page") != null
											? Integer.parseInt(request.getParameter("page"))
											: 1;
									int agentPerPage = 10;
									totalPage = (total + agentPerPage - 1) / agentPerPage;
									startAgentIndex = (currentPages - 1) * agentPerPage;
									endAgentIndex = Math.min(startAgentIndex + agentPerPage - 1, total);
									boolean hasPreviousPage = currentPages > 1;
									boolean hasNextPage = total > endAgentIndex;
									request.setAttribute("agentList", agentList);
									request.setAttribute("total", total);
									request.setAttribute("startAgentIndex", startAgentIndex);
									request.setAttribute("endAgentIndex", endAgentIndex);
									request.setAttribute("hasPreviousPage", hasPreviousPage);
									request.setAttribute("hasNextPage", hasNextPage);
									request.setAttribute("currentPages", currentPages);
									request.setAttribute("totalPage", totalPage);
									request.getRequestDispatcher("/pages/company/companyList.jsp").forward(request,
											response);
								} else if (PATH.equals("/loginViewAgent.do2")) {
									System.out.println("공인중개사 로그인 화면으로 이동");
									RequestDispatcher dispatcher = request
											.getRequestDispatcher("/pages/company/companyLogin.jsp");
									dispatcher.forward(request, response);
								} else if (PATH.equals("/pwresetAgent.do2")) {
									AgentDAO = new AgentDAO();
									int ea_no = Integer.parseInt(request.getParameter("ea_no"));
									System.out.println(ea_no);
									AgentDAO.pwreset(ea_no);
									request.getRequestDispatcher("/listAgent.do2").forward(request, response);
								}
							}
						}
					}
				}
			}
		}

	}
}