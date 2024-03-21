package controller;

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

import DAO.BoardDAO;
import DAO.UsersDAO;
import DTO.BoardDTO;
import DTO.UsersDTO;

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet("*.do") //모든 서블릿을 받은 다음에 이름에 따라서 넘겨준다.
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//먼저 한글 필터 처리 부터 하기   22

    public DispatcherServlet() {
        super();
      
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//#1. 사용자 요청이 들어오면 요청 경로(path)를 추출
		final String URI = request.getRequestURI();
		final String PATH =	URI.substring(URI.lastIndexOf("/"));
		
		//요청에 따라 처리하기
		//login.jsp 파일에서 form action의 login.do가 여기로 들어오게 된다.
		if(PATH.equals("/login.do")) {
			System.out.println("로그인 처리");
			
			String id = request.getParameter("id");//문자열로 받아 옴.
			String pw = request.getParameter("pw");//문자열로 받아 옴.
			
			UsersDAO dao = new UsersDAO();//db와 접속
			UsersDTO user = dao.getUser(id);//id를 USER DAO로 넘겨줘서 처리하게 할거임
			
			HttpSession session = request.getSession();
			
			if(user != null && user.getAccountlock() == 1) {
		        // 계정이 잠긴 경우의 처리
		        response.setContentType("text/html; charset=UTF-8");
		        PrintWriter writer = response.getWriter();
		        writer.println("<script>alert('패스워드5회실패로 인해 계정이 잠겼습니다. 관리자에게 문의하세요');location.href='" + request.getContextPath() + "/pages/user/userLogin.jsp';</script>");
		        writer.close();
			}
			
			else {
			if(user != null && user.getPw().equals(pw)) {
				System.out.println("로그인 성공");
				session.setAttribute("user", user);
				dao.loginreset(id);
				//if(user.getRole().equals("admin")) {
					// return "forward:/가야할곳"
					RequestDispatcher dispatcher = request.getRequestDispatcher("/mainView.do");
					///메인 페이지로 넘어가고 싶다면 getBoardList.do가 아니라 index.jsp로 넘기기.
					dispatcher.forward(request, response);
					//} else {
					//	RequestDispatcher dispatcher = request.getRequestDispatcher("/mainuserView.do");
						///메인 페이지로 넘어가고 싶다면 getBoardList.do가 아니라 index.jsp로 넘기기.
					//	dispatcher.forward(request, response);
					
				//	}
			} else if(user == null) {
			        // 아이디가 없는 경우 처리
			        response.setContentType("text/html; charset=UTF-8");
			        PrintWriter writer = response.getWriter();
			        writer.println("<script>alert('존재하지 않는 아이디입니다.');location.href='" + request.getContextPath() + "/pages/user/userLogin.jsp';</script>");
			        writer.close();
			    
			
			} else {
				dao.loginFail(id);
		        // 비밀번호가 일치하지 않는 경우의 처리
		        response.setContentType("text/html; charset=UTF-8");
		        PrintWriter writer = response.getWriter();
		        writer.println("<script>alert('비밀번호가 일치하지 않습니다.');location.href='" + request.getContextPath() + "/pages/user/userLogin.jsp';</script>");
		        writer.close();
		    
		
				}
			}
		}else if(PATH.equals("/membership.do")) {
			System.out.println("회원가입 처리");
			
			//입력(요청) 값 받아 오기
			String id = request.getParameter("id");
			String pw1 = request.getParameter("pw1");
			String pw2 = request.getParameter("pw2");
			String name = request.getParameter("name");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String phone = phone1 + phone2 + phone3;
			String birthStr  = request.getParameter("birth");
			int birth = Integer.parseInt(birthStr);
			String region = request.getParameter("region");
			
			String zipcode = request.getParameter("zipcode");
			String address1 =request.getParameter("address1");
			String address2 =request.getParameter("address2");
			String address =   zipcode + "  "+ address1 + " " + address2;
			
			String role = request.getParameter("role");
		
			//체크
			
			if(id==null || id.equals("")||pw1==null || pw1.equals("")||
					pw2==null || pw2.equals("")||name==null || name.equals("")||	
					phone==null || phone.equals("")||birthStr==null || birthStr.equals("") ) {
				request.getSession().setAttribute("messageType","오류 메시지");
				request.getSession().setAttribute("messageContent", "필수 입력란은 모두 입력해주세요.");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/loginView.do");
				dispatcher.forward(request, response);;			
				return;
			}
			

			
			UsersDTO dto = new UsersDTO();
			dto.setId(id);
			dto.setPw(pw1);
			dto.setName(name);
			dto.setPhone(phone);
			dto.setBirth(birth);
			dto.setRegion(region);
			
			UsersDAO user = new UsersDAO();
			int result = user.insertUser(dto);
			
			if(result == 1) {
				request.getSession().setAttribute("messageType","입력 성공 메시지");
				request.getSession().setAttribute("messageContent","회원 가입 완료");
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/loginView.do");
				dispatcher.forward(request, response);
			}else {
				request.getSession().setAttribute("messageType","입력 오류 메시지");
				request.getSession().setAttribute("messageContent","이미 존재하는 회원입니다.");
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/loginView.do");
				dispatcher.forward(request, response);
			}
			
			
			
		}else if(PATH.equals("/UserRegisterCheck.do")) {
			//아이디 중복 체크  
			System.out.println("아이디 중복 체크 처리");
			String id = request.getParameter("id");
			 
			UsersDAO user = new UsersDAO();
	
			response.getWriter().write(user.registerCheck(id) + "");
	
	    }else if(PATH.equals("/logout.do")) {
			System.out.println("로그아웃 처리");
			
			HttpSession session = request.getSession();
			session.invalidate();
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/user/userLogin.jsp");
			dispatcher.forward(request, response);	
			
		}else if(PATH.equals("/insertBoard.do")) {
			System.out.println("글 등록 처리");
			
			String title  = request.getParameter("title");
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			
			BoardDTO dto = new BoardDTO();
			dto.setTitle(title);
			dto.setWriter(writer);
			dto.setContent(content);
			
			BoardDAO dao = new BoardDAO();
			dao.insertBoard(dto);
			
			request.getRequestDispatcher("/getBoardList.do")
		    .forward(request, response);	
			
			
			
			
		}else if(PATH.equals("/updateBoard.do")) {
			System.out.println("글 수정 처리");
			
			String title  = request.getParameter("title");
			int seq = Integer.parseInt(request.getParameter("seq"));
			String content = request.getParameter("content");
////			String writer = request.getParameter("writer");
			
			BoardDTO dto = new BoardDTO();
			dto.setTitle(title);
			dto.setContent(content);
//			dto.setWriter(writer);
			dto.setSeq(seq);
			
			BoardDAO dao = new BoardDAO();
			dao.insertBoard(dto);
			
			//업데이트 후에는 글 목록으로 이동
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/getBoardList.do");
			dispatcher.forward(request, response);	
//		
			
		}else if(PATH.equals("/deleteBoard.do")) {
			System.out.println("글 삭제 처리");
			
			String seq = request.getParameter("seq");
			
			// 2. DB 연동 처리
			BoardDTO dto = new BoardDTO();
			dto.setSeq(Integer.parseInt(seq));
			
			BoardDAO boardDAO = new BoardDAO();
			boardDAO.deleteBoard(dto);
			
			// 3. 페이지 네비게이션
			RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/getBoardList.do");
			dispatcher.forward(request, response);

			
			
		}else if(PATH.equals("/getBoard.do")) {
			System.out.println("글 상세 조회 처리");
			//타이틀 누르면 상세 조회되게
			
			//사용자 입력 정보
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			BoardDTO dto = new BoardDTO();
			dto.setSeq(seq);
			
			BoardDAO dao = new BoardDAO();
			BoardDTO board = dao.getBoard(dto);
			
			request.setAttribute("board", board);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/board/getBoard.jsp");
			dispatcher.forward(request, response);	
			
			
		}else if(PATH.equals("/getBoardList.do")) {
			System.out.println("글 목록 검색 처리");
			
			//검색을 사용자가 입력하였을 경우
			String searchCondition = request.getParameter("searchCondition");//검색과 관련된 부분
			String searchKeyword = request.getParameter("searchKeyword");
			
			//null인지 체크
			if(searchCondition == null) {
				searchCondition = "TITLE";
			}
			if(searchKeyword == null) {
				searchKeyword = "";
			}
			
			//세션에 검색 관련 정보 저장
			HttpSession session = request.getSession();
			//key, value 값으로 저장된다.
			session.setAttribute("condition", searchCondition);
			session.setAttribute("keyword", searchKeyword);
			
			//db연동 처리
			BoardDTO dto = new BoardDTO();
			dto.setSearchCondition("TITLE");
			dto.setSearchKeyword("");
			
			//db 데이터 가져오기
			BoardDAO dao = new BoardDAO();
			
			List<BoardDTO> boardList = dao.getBoardList(dto);
			//boardList.add(board);를 넘겨 받음
			
			//화면 이동
			request.setAttribute("boardList", boardList);
			request.getRequestDispatcher("/board/getBoardList.jsp").forward(request, response);
			
			
//			// 1. 사용자 입력정보 추출
//			String searchCondition = 
//				request.getParameter("searchCondition");//제목인지 내용인지 선택하는 창
//			String searchKeyword = request.getParameter("searchKeyword");//직접 검색해보는 창
//			
//			// Null Check
//			//넘겨 받은 것이 아무것도 없다면
//			if(searchCondition == null) {searchCondition = "TITLE";}
//			if(searchKeyword == null) {searchKeyword = "";}
//			
//			// 세션에 검색 관련 정보를 저장한다. 
//			HttpSession session = request.getSession();
//			session.setAttribute("condition", searchCondition);
//			session.setAttribute("keyword", searchKeyword);	
//
//			// 2. DB 연동 처리
//			BoardDTO dto = new BoardDTO();
//			dto.setSearchCondition("TITLE");
//			dto.setSearchKeyword("");
//			
//			BoardDAO dao = new BoardDAO();
//			List<BoardDTO> boardList = dao.getBoardList(dto);
//			
//			// 3. 화면 이동
//			request.setAttribute("boardList", boardList);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/board/getBoardList.jsp");
//			dispatcher.forward(request, response);	
	
			
			
		}else if(PATH.equals("/loginView.do")) {
			System.out.println("로그인 화면으로 이동");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/user/userLogin.jsp");
			dispatcher.forward(request, response);	
				
		}else if(PATH.equals("/insertBoardView.do")) {
			System.out.println("글 등록 화면으로 이동");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/user/userLogin.jsp");
			dispatcher.forward(request, response);	
	
			
		}else if(PATH.equals("/insertUserView.do")) {
			System.out.println("회원 가입 화면으로 이동");
	
			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/general/main.jsp");
			dispatcher.forward(request, response);	
	
		} else if(PATH.equals("/mainView.do")) {
			System.out.println("메인 페이지로 이동");
	
			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/general/main.jsp");
			dispatcher.forward(request, response);	
	
		} else if(PATH.equals("/mainuserView.do")) {
			System.out.println("사용자 메인 페이지로 이동");
	
			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/general/usermain.jsp");
			dispatcher.forward(request, response);	
	
		} else {
			System.out.println("에러");
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('에러 발생');location.href='" + request.getContextPath() + "/pages/etc/error.jsp';</script>");
			writer.close();
		
		
	}



//	public String getJSON(String id) {
//		if(id == null) { id="";}
//		StringBuffer result = new StringBuffer("");
//		result.append("{\"result\":[");
//		
//		UsersDAO UsersDAO = new UsersDAO();
//		ArrayList<UsersDTO> userList = UsersDAO.getUser(id);
//		for(int i=0; i<userList.size(); i++) {
//			result.append("{\"result\":\"" + userList.get(i).getId() + "\"}, ");
//			result.append("{\"result\":\"" + userList.get(i).getName() + "\"}, ");
//			result.append("{\"result\":\"" + userList.get(i).getPhone() + "\"}, ");
//			result.append("{\"result\":\"" + userList.get(i).getAddress() + "\"}, ");
//
//		}
//		result.append("]}");
//		
//		return result.toString();
//		
//	}
//	
}
}
