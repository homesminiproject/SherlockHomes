package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import DTO.NoticeDTO;
import dbconnection.MyDBConnection;

public class NoticeDAO {
	public Connection con = null;
	public PreparedStatement pstmt = null;
	public ResultSet rs = null;

	private String NOTICE_INSERT = "insert into notice(title,content)values(?,?)";
	private String NOTICE_UPDATE = "update notice set title=? ,content=?, updateDate=? where n_no=?";
	private String NOTICE_DELETE = "delete from notice where n_no=?";
	private String NOTICE_GET = "select * from notice where n_no=?";
	private String NOTICE_GETALL = "select * from notice order by n_no desc";
	
	 //검색 관련
	   private String NOTICE_LIST_T ="select * from notice where title like ? order by n_no desc";
	   private String NOTICE_LIST_C ="select * from notice where content like ? order by n_no desc";


	
	//글 등록
	   public void insertNotice(NoticeDTO dto) {
	      
	      try {
	         con = MyDBConnection.getConnection();
	         pstmt = con.prepareStatement(NOTICE_INSERT);
	         pstmt.setString(1,dto.getTitle());
	         pstmt.setString(2,dto.getContent());
	         
	         pstmt.executeUpdate();
	      
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         MyDBConnection.close(rs, pstmt, con);
	      }
	   
	   }

	   
	   //글 수정
	   public void updateNotice(NoticeDTO dto) {
	      
	      try {
	         con = MyDBConnection.getConnection();
	         pstmt = con.prepareStatement(NOTICE_UPDATE);
	         pstmt.setString(1,dto.getTitle());
	         pstmt.setString(2,dto.getContent());
	         pstmt.setTimestamp(3,(Timestamp) dto.getUpdateDate());
	         pstmt.setInt(4,dto.getN_no());
	         
	         pstmt.executeUpdate();
	      
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         MyDBConnection.close(rs, pstmt, con);
	      }
	   
	   }
	   
	   // 글 삭제
	   public void deleteNotice(NoticeDTO dto) {
	      
	      try {
	         con = MyDBConnection.getConnection();
	         pstmt = con.prepareStatement(NOTICE_DELETE);
	         pstmt.setInt(1, dto.getN_no());
	         
	         pstmt.executeUpdate();
	      
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         MyDBConnection.close(rs, pstmt, con);
	      }
	   
	   }
	 //글 상세 조회
	   public NoticeDTO getNotice(NoticeDTO dto) { 
	      // 번호 하나로만 검색하기에 번호를 매개값으로 받아도 되지만
	      // 결과를 이용하기 해서 상세 검색을 표현하기 위해 NoticeDTO로 받음
	      NoticeDTO Notice = null;
	      
	      try {
	         con = MyDBConnection.getConnection();
	         pstmt = con.prepareStatement(NOTICE_GET);
	         pstmt.setInt(1,dto.getN_no());
	         
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            Notice = new NoticeDTO();
	             Notice.setN_no(rs.getInt("n_no"));
	             Notice.setTitle(rs.getString("title"));
	             Notice.setContent(rs.getString("content"));
	             Notice.setRegDate(rs.getTimestamp("regDate"));
	             Notice.setUpdateDate(rs.getTimestamp("updateDate"));         
	         }         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         MyDBConnection.close(rs, pstmt, con);
	      }
	      return Notice;
	   }
	   
	   //글 리스트 검색
	   public List<NoticeDTO> getNoticeList(NoticeDTO dto){
	      List<NoticeDTO> NoticeList = new ArrayList<>();
	      
	      try {
	         con = MyDBConnection.getConnection();
	         
	         if(dto.getSearchCondition().equalsIgnoreCase("TITLE")) {
	            pstmt = con.prepareStatement(NOTICE_LIST_T);
	         } else if(dto.getSearchCondition().equalsIgnoreCase("CONTENT")) {
	            pstmt = con.prepareStatement(NOTICE_LIST_C);
	         }
	         
	         String searchKeyword ="%" + dto.getSearchKeyword() + "%";
	         
	         //pstmt.setString(1, dto.getSearchKeyword());
	         pstmt.setString(1, searchKeyword);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            NoticeDTO notice = new NoticeDTO();
	            
	            notice = new NoticeDTO();
	            notice.setN_no(rs.getInt("n_no"));
	            notice.setTitle(rs.getString("title"));
	            notice.setContent(rs.getString("content"));
	            notice.setRegDate(rs.getTimestamp("regDate"));
	            notice.setUpdateDate(rs.getTimestamp("updateDate"));
	             
	             NoticeList.add(notice);
	         }         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         MyDBConnection.close(rs, pstmt, con);
	      }
	   
	      return NoticeList;
	      
	   }
	   
	   //전부 리스트화
	   public List<NoticeDTO> getNoticeAll(NoticeDTO dto){
		      List<NoticeDTO> noticeList = new ArrayList<>();
		      
		      try {
		         con = MyDBConnection.getConnection();
		         pstmt = con.prepareStatement(NOTICE_GETALL);
		         rs = pstmt.executeQuery();
		         
		         while(rs.next()) {
		        	 NoticeDTO notice = new NoticeDTO();
		            
		        	 notice = new NoticeDTO();
		        	 notice.setN_no(rs.getInt("n_no"));
		        	 notice.setTitle(rs.getString("title"));
		        	 notice.setContent(rs.getString("content"));
		        	 notice.setRegDate(rs.getTimestamp("regDate"));
		        	 notice.setUpdateDate(rs.getTimestamp("updateDate"));
		             
		             noticeList.add(notice);
		         }         
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }finally {
		         MyDBConnection.close(rs, pstmt, con);
		      }
		   
		      return noticeList;
		      
		   }
		   
		}