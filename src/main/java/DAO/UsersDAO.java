package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.UsersDTO;
import dbconnection.MyDBConnection;

public class UsersDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	
	//검색 - 상세(개별)
	private String USER_GET = "select * from users where id=?";
	//검색 - 모든 데이터
	private String USER_LIST = "select * from users";
	
	//삽입
	private String USER_INSERT = "INSERT INTO users (id, pw, name, phone, birth, region) values(?,?,?,?,?,?)";
	
	//수정
	private String USER_UPDATE = "update users set pw=?, name=?, role=?, address=?, phone=? where id=?";

	//삭제
	private String USER_DELETE = "delete from users where id=?";
	
	
	//회원 관련 CRUD(create, read, update, delete )
	
	//1. 회원 상세 조회   // private String USER_GET = "select * from users where id=?";
	public UsersDTO getUser(String id) { //DispacherServlet 수정
		UsersDTO user = null;
		
	     try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(USER_GET);
			// 매개변수에 값 담기 - >
			pstmt.setString(1, id);
			
			
			// sql 실행
			rs=pstmt.executeQuery();
			         
			   if(rs.next()){
					user = new UsersDTO();
					user.setId(rs.getString("id"));
					user.setPw(rs.getString("pw"));
					user.setName(rs.getString("name"));
					user.setPhone(rs.getInt("phone"));
					user.setRole(rs.getString("role"));
			   }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch(Exception e) {
			
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}

	    return user;
	}
	//회원 체크
	public int registerCheck(String id) { 
		UsersDTO user = null;
		
	     try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(USER_GET);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			         
			   if(rs.next()|| id.equals("")){
					return 0; //이미 존재하는 회원 아이디
			   }else {
				   return 1; // 가입 가능한 회원 아이디
			   }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch(Exception e) {
			
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}

	    return -1; //데이터 베이스 오류 알려주기
	}
	//2. 회원 삭제 	private String USER_DELETE = "delete from users where id=?";
	public void deleteUser(String id) {
		
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(USER_DELETE);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
	}
//		private String USER_UPDATE = "update users set pw=?, name=?, role=?, address=?, phone=? where id=?";
	// 3. 회원 수정
	public void updateUser(UsersDTO dto) {

		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(USER_UPDATE);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getRole());
			pstmt.setInt(5, dto.getPhone());
			pstmt.setString(6, dto.getId());

			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
	}
	//3. 삽입
	//private String USER_INSERT="insert into users values(?, ?, ?, ?, ?, ?)";
	//public void insertUser(UsetDTO dto) {
	//	
	//}

	//private String USER_INSERT = "insert into users values(?,?,?,?,?,?)";
	// 4. 회원 등록
	/*
	    id char(10) primary key,
    	pw char(20) not null,
    	name varchar(50) not null,
    	addresss varchar(200),
    	phone char(15) not null,
    	role char(20) default "user"
	 * 
	 */
	
//	public int insertUser(String id, String pw, String name, String address, String phone, String role) {
	
	//삽입하고 처리 결과를 넘겨 주기
	//성공하면 1, 삽입이 실패되면 -1이 리턴
	public int insertUser(UsersDTO dto) {
		
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(USER_INSERT);
			pstmt.setString(1,dto.getId() );
			pstmt.setString(2,dto.getPw() );
			pstmt.setString(3,dto.getName());
			pstmt.setInt(4,dto.getPhone());
			pstmt.setInt(5,dto.getBirth());
			pstmt.setString(6,dto.getRegion());
//			pstmt.setString(1,id );
//			pstmt.setString(2,pw );
//			pstmt.setString(3,name);
//			pstmt.setString(4,address);
//			pstmt.setString(5,phone);
//			pstmt.setString(6,role);

			return pstmt.executeUpdate(); //insert 성공하면 1 반환
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return -1; //db오류
	}
	
	//회원 등록 
	public void insertUser1(UsersDTO dto) {
		
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(USER_INSERT);
			pstmt.setString(1,dto.getId() );
			pstmt.setString(2,dto.getPw() );
			pstmt.setString(3,dto.getName());
			pstmt.setInt(5,dto.getPhone());
			pstmt.setString(6,dto.getRole());

			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
	
	}
	
	
	
//	private String USER_LIST = "select * from users";
	//5. 회원 목록 조회
	public List<UsersDTO> getUserList(){
		List<UsersDTO> userList = new ArrayList<UsersDTO>();
		
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(USER_LIST);			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				UsersDTO user = new UsersDTO();
				
				user.setId(rs.getString("id"));
				user.setPw(rs.getString("pw"));
				user.setName(rs.getString("name"));
				user.setPhone(rs.getInt("phone"));
				user.setRole(rs.getString("role"));
				
				userList.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}	
		return userList;
	}	
}
