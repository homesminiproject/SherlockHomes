package controller;

import DAO.UsersDAO;
import DTO.UsersDTO;
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

@WebServlet({"*.do8"})
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String URI = request.getRequestURI();
		String PATH = URI.substring(URI.lastIndexOf("/"));
		String searchCondition;
		String searchKeyword;
		if (PATH.equals("/loginUser.do8")) {
			System.out.println("사용자 로그인 처리");
			searchCondition = request.getParameter("id");
			searchKeyword = request.getParameter("pw");
			UsersDAO dao = new UsersDAO();
			UsersDTO user = dao.getUser(searchCondition);
			HttpSession session = request.getSession();
			PrintWriter writer;
			if (user != null && user.getRole().equals("admin")) {
				response.setContentType("text/html; charset=UTF-8");
				writer = response.getWriter();
				writer.println("<script>alert('사용자 아이디가 아닙니다. 다시 이용해 주세요');location.href='" + request.getContextPath()
						+ "/pages/user/userLogin.jsp';</script>");
				writer.close();
			}

			if (user != null && user.getAccountlock() == 1) {
				response.setContentType("text/html; charset=UTF-8");
				writer = response.getWriter();
				writer.println("<script>alert('패스워드5회실패로 인해 계정이 잠겼습니다. 관리자에게 문의하세요');location.href='"
						+ request.getContextPath() + "/pages/user/userLogin.jsp';</script>");
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
						+ "/pages/user/userLogin.jsp';</script>");
				writer.close();
			} else {
				dao.loginFail(searchCondition);
				response.setContentType("text/html; charset=UTF-8");
				writer = response.getWriter();
				writer.println("<script>alert('비밀번호가 일치하지 않습니다.');location.href='" + request.getContextPath()
						+ "/pages/user/userLogin.jsp';</script>");
				writer.close();
			}
		} else {
			String birthStr;
			String region;
			String role;
			RequestDispatcher dispatcher;
			int totalPages;
			int endUserIndex;
			if (PATH.equals("/membershipUser.do8")) {
				System.out.println("사용자 회원가입 처리");
				searchCondition = request.getParameter("id");
				searchKeyword = request.getParameter("pw1");
				String pw2 = request.getParameter("pw2");
				String name = request.getParameter("name");
				birthStr = request.getParameter("phone1");
				String phone2 = request.getParameter("phone2");
				region = request.getParameter("phone3");
				role = birthStr + phone2 + region;
				totalPages = Integer.parseInt(role);
				String birthStr = request.getParameter("birth");
				endUserIndex = Integer.parseInt(birthStr);
				String region = request.getParameter("region");
				if (searchCondition == null || searchCondition.equals("") || searchKeyword == null
						|| searchKeyword.equals("") || pw2 == null || pw2.equals("") || name == null || name.equals("")
						|| role == null || role.equals("") || birthStr == null || birthStr.equals("") || region == null
						|| region.equals("")) {
					request.getSession().setAttribute("messageType", "오류 메시지");
					request.getSession().setAttribute("messageContent", "필수 입력란은 모두 입력해주세요.");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/loginViewUser.do8");
					dispatcher.forward(request, response);
					return;
				}

				UsersDTO dto = new UsersDTO();
				dto.setId(searchCondition);
				dto.setPw(searchKeyword);
				dto.setName(name);
				dto.setPhone((long) totalPages);
				dto.setBirth(endUserIndex);
				dto.setRegion(region);
				UsersDAO user = new UsersDAO();
				int result = user.insertUser(dto);
				if (result == 1) {
					request.getSession().setAttribute("messageType", "입력 성공 메시지");
					request.getSession().setAttribute("messageContent", "회원 가입 완료");
					dispatcher = request.getRequestDispatcher("/loginViewUser.do8");
					dispatcher.forward(request, response);
				} else {
					request.getSession().setAttribute("messageType", "입력 오류 메시지");
					request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
					dispatcher = request.getRequestDispatcher("/loginViewUser.do8");
					dispatcher.forward(request, response);
				}
			} else {
				UsersDAO UsersDAO;
				if (PATH.equals("/RegisterCheckUser.do8")) {
					System.out.println("사용자 아이디 중복 체크 처리");
					searchCondition = request.getParameter("id");
					UsersDAO = new UsersDAO();
					response.getWriter().write(String.valueOf(UsersDAO.registerCheck(searchCondition)));
				} else {
					int no;
					if (PATH.equals("/getUser.do8")) {
						System.out.println("사용자 조회 처리");
						no = Integer.parseInt(request.getParameter("no"));
						UsersDAO = new UsersDAO();
						UsersDTO user = UsersDAO.getUser2(no);
						request.setAttribute("user", user);
						RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/user/userUpdate.jsp");
						dispatcher.forward(request, response);
					} else {
						int totalPages;
						int startUserIndex;
						if (PATH.equals("/updateUser.do8")) {
							System.out.println("사용자 수정 처리");
							searchCondition = request.getParameter("name");
							searchKeyword = request.getParameter("phone");
							long phone = Long.parseLong(searchKeyword);
							birthStr = request.getParameter("birth");
							totalPages = Integer.parseInt(birthStr);
							region = request.getParameter("region");
							role = request.getParameter("role");
							String f_countStr = request.getParameter("f_count");
							startUserIndex = Integer.parseInt(f_countStr);
							String accountlockStr = request.getParameter("accountlock");
							int accountlock = Integer.parseInt(accountlockStr);
							String id = request.getParameter("id");
							UsersDTO dto = new UsersDTO();
							dto.setName(searchCondition);
							dto.setPhone(phone);
							dto.setBirth(totalPages);
							dto.setRegion(region);
							dto.setRole(role);
							dto.setF_count(startUserIndex);
							dto.setAccountlock(accountlock);
							dto.setId(id);
							UsersDAO dao = new UsersDAO();
							dao.updateUser(dto);
							dispatcher = request.getRequestDispatcher("/listUser.do8");
							dispatcher.forward(request, response);
						} else if (PATH.equals("/deleteUsers.do8")) {
							System.out.println("사용자 삭제");
							no = Integer.parseInt(request.getParameter("no"));
							System.out.println(no);
							UsersDAO = new UsersDAO();
							UsersDAO.deleteUser(no);
							RequestDispatcher dispatcher = request.getRequestDispatcher("/listUser.do8");
							dispatcher.forward(request, response);
						} else {
							int startUserIndex;
							int endUserIndex;
							if (PATH.equals("/SearchUser.do8")) {
								System.out.println("사용자 검색");
								searchCondition = request.getParameter("searchCondition");
								searchKeyword = request.getParameter("searchKeyword");
								HttpSession session = request.getSession();
								session.setAttribute("condition", searchCondition);
								session.setAttribute("keyword", searchKeyword);
								UsersDAO usersDAO = new UsersDAO();
								List<UsersDTO> userList = usersDAO.searchUser(searchCondition, searchKeyword);
								totalPages = userList.size();
								startUserIndex = request.getParameter("page") != null
										? Integer.parseInt(request.getParameter("page"))
										: 1;
								endUserIndex = 10;
								totalPages = (totalPages + endUserIndex - 1) / endUserIndex;
								startUserIndex = (startUserIndex - 1) * endUserIndex;
								endUserIndex = Math.min(startUserIndex + endUserIndex, totalPages);
								boolean hasPreviousPage = startUserIndex > 1;
								boolean hasNextPage = totalPages > endUserIndex;
								request.setAttribute("usersList", userList);
								request.setAttribute("total", totalPages);
								request.setAttribute("startUserIndex", startUserIndex);
								request.setAttribute("endUserIndex", endUserIndex);
								request.setAttribute("hasPreviousPage", hasPreviousPage);
								request.setAttribute("hasNextPage", hasNextPage);
								request.setAttribute("currentPage", startUserIndex);
								request.setAttribute("totalPages", totalPages);
								RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/user/userList.jsp");
								dispatcher.forward(request, response);
							} else if (PATH.equals("/listUser.do8")) {
								UsersDAO usersDAO = new UsersDAO();
								List<UsersDTO> usersList = usersDAO.getUserList();
								int total = usersDAO.all_user();
								int currentPage = request.getParameter("page") != null
										? Integer.parseInt(request.getParameter("page"))
										: 1;
								int usersPerPage = 10;
								totalPages = (total + usersPerPage - 1) / usersPerPage;
								startUserIndex = (currentPage - 1) * usersPerPage;
								endUserIndex = Math.min(startUserIndex + usersPerPage - 1, total);
								boolean hasPreviousPage = currentPage > 1;
								boolean hasNextPage = total > endUserIndex;
								request.setAttribute("usersList", usersList);
								request.setAttribute("total", total);
								request.setAttribute("startUserIndex", startUserIndex);
								request.setAttribute("endUserIndex", endUserIndex);
								request.setAttribute("hasPreviousPage", hasPreviousPage);
								request.setAttribute("hasNextPage", hasNextPage);
								request.setAttribute("currentPage", currentPage);
								request.setAttribute("totalPages", totalPages);
								request.getRequestDispatcher("/pages/user/userList.jsp").forward(request, response);
							} else {
								RequestDispatcher dispatcher;
								if (PATH.equals("/loginViewUser.do8")) {
									System.out.println("사용자 로그인 화면으로 이동");
									dispatcher = request.getRequestDispatcher("/pages/user/userLogin.jsp");
									dispatcher.forward(request, response);
								} else if (PATH.equals("/mainVIewUser.do8")) {
									System.out.println("사용자 메인 페이지로 이동");
									dispatcher = request.getRequestDispatcher("/pages/general/usermain.jsp");
									dispatcher.forward(request, response);
								} else if (PATH.equals("/pwresetUser.do8")) {
									System.out.println("패스워드 초기화");
									no = Integer.parseInt(request.getParameter("no"));
									System.out.println(no);
									UsersDAO = new UsersDAO();
									UsersDAO.pwreset(no);
									request.getRequestDispatcher("/listUser.do8").forward(request, response);
								}
							}
						}
					}
				}
			}
		}

	}
}