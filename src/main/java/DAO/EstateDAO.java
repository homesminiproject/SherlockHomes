package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.EstateDTO;
import dbconnection.MyDBConnection;

public class EstateDAO {
	public Connection con = null;
	public PreparedStatement pstmt = null;
	public ResultSet rs = null;

	private String ESTATE_UPDATE = "update estate set p_type=? ,price=? ,area=?, risk=? where e_no=?";
	private String ESTATE_DELETE = "delete from estate where e_no=?";
	private String ESTATE_GET = "select * from estate where e_no=?";
	private String ESTATE_GETALL = "select * from estate order by e_no desc";
	
	 //검색 관련
	   private String ESTATE_LIST_T ="select * from estate where e_type like ? order by e_no desc";
	   private String ESTATE_LIST_A ="select * from estate where roadaddress like ? order by e_no desc";
	   
	   //글 수정
	   public void updateEstate(EstateDTO dto) {
	      try {
	         con = MyDBConnection.getConnection();
	         pstmt = con.prepareStatement(ESTATE_UPDATE);
	         pstmt.setString(1,dto.getP_type());
	         pstmt.setString(2,dto.getPrice());
	         pstmt.setInt(3,dto.getArea());
	         pstmt.setString(4,dto.getRisk());
	         pstmt.setInt(5,dto.getE_no());
	         
	         pstmt.executeUpdate();
	      
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         MyDBConnection.close(rs, pstmt, con);
	      }
	   
	   }
	   
	   // 글 삭제
	   public void deleteEstate(EstateDTO dto) {
	      
	      try {
	         con = MyDBConnection.getConnection();
	         pstmt = con.prepareStatement(ESTATE_DELETE);
	         pstmt.setInt(1, dto.getE_no());
	         
	         pstmt.executeUpdate();
	      
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         MyDBConnection.close(rs, pstmt, con);
	      }
	   
	   }
	 //글 상세 조회
	   public EstateDTO getEstate(EstateDTO dto) { 
	      // 번호 하나로만 검색하기에 번호를 매개값으로 받아도 되지만
	      // 결과를 이용하기 해서 상세 검색을 표현하기 위해 NoticeDTO로 받음
		   EstateDTO Estate = null;
	      
	      try {
	         con = MyDBConnection.getConnection();
	         pstmt = con.prepareStatement(ESTATE_GET);
	         pstmt.setInt(1,dto.getE_no());
	         
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	        	 Estate = new EstateDTO();
	        	 Estate.setE_no(rs.getInt("e_no"));
	        	 Estate.setPostcode(rs.getInt("postcode"));
	        	 Estate.setRoadaddress(rs.getString("roadaddress"));
	        	 Estate.setJibunaddress(rs.getString("jibunaddress"));
	        	 Estate.setDetailaddress(rs.getString("detailaddress"));
	        	 Estate.setE_type(rs.getString("e_type"));
	        	 Estate.setP_type(rs.getString("p_type"));
	        	 Estate.setPrice(rs.getString("price"));
	        	 Estate.setEa_no(rs.getInt("ea_no"));
	        	 Estate.setEa_name(rs.getString("ea_name"));
	        	 Estate.setContent(rs.getString("content"));
	        	 Estate.setRegDate(rs.getTimestamp("regDate"));
	        	 Estate.setRisk(rs.getString("risk"));
	        	 Estate.setArea(rs.getInt("area"));
	        	 Estate.setRoom(rs.getInt("room"));
	        	 Estate.setE_date(rs.getString("e_date"));
	        	 Estate.setMax_floor(rs.getInt("max_floor"));
	        	 Estate.setE_floor(rs.getInt("e_floor"));
	         }         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         MyDBConnection.close(rs, pstmt, con);
	      }
	      return Estate;
	   }
	   
	   //글 리스트 검색
	   public List<EstateDTO> getNoticeList(EstateDTO dto){
	      List<EstateDTO> EstateList = new ArrayList<>();
	      
	      try {
	         con = MyDBConnection.getConnection();
	         
	         if(dto.getSearchCondition().equalsIgnoreCase("TYPE")) {
	            pstmt = con.prepareStatement(ESTATE_LIST_T);
	         } else if(dto.getSearchCondition().equalsIgnoreCase("ADDRESS")) {
	            pstmt = con.prepareStatement(ESTATE_LIST_A);
	         }
	         
	         String searchKeyword ="%" + dto.getSearchKeyword() + "%";
	         
	         //pstmt.setString(1, dto.getSearchKeyword());
	         pstmt.setString(1, searchKeyword);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	        	 EstateDTO estate = new EstateDTO();
	            
	            estate = new EstateDTO();
	            estate.setE_no(rs.getInt("e_no"));
	            estate.setPostcode(rs.getInt("postcode"));
	            estate.setRoadaddress(rs.getString("roadaddress"));
	            estate.setJibunaddress(rs.getString("jibunaddress"));
	            estate.setDetailaddress(rs.getString("detailaddress"));
	            estate.setE_type(rs.getString("e_type"));
	            estate.setP_type(rs.getString("p_type"));
	            estate.setPrice(rs.getString("price"));
	            estate.setE_no(rs.getInt("e_no"));
	            estate.setEa_name(rs.getString("ea_name"));
	            estate.setRegDate(rs.getTimestamp("regDate"));
	            estate.setRisk(rs.getString("risk"));
	            estate.setArea(rs.getInt("area"));
	            estate.setRoom(rs.getInt("room"));
	            estate.setE_date(rs.getString("e_date"));
	            estate.setMax_floor(rs.getInt("max_floor"));
	            estate.setE_floor(rs.getInt("e_floor"));
	             
	            EstateList.add(estate);
	         }         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         MyDBConnection.close(rs, pstmt, con);
	      }
	   
	      return EstateList;
	      
	   }
	   
	   //전부 리스트화
	   public List<EstateDTO> getEstateAll(EstateDTO dto){
		      List<EstateDTO> estateList = new ArrayList<>();
		      
		      try {
		         con = MyDBConnection.getConnection();
		         pstmt = con.prepareStatement(ESTATE_GETALL);
		         rs = pstmt.executeQuery();
		         
		         while(rs.next()) {
		        	 EstateDTO estate = new EstateDTO();
		            
		        	 estate = new EstateDTO();
		        	 estate.setE_no(rs.getInt("e_no"));
			            estate.setPostcode(rs.getInt("postcode"));
			            estate.setRoadaddress(rs.getString("roadaddress"));
			            estate.setJibunaddress(rs.getString("jibunaddress"));
			            estate.setDetailaddress(rs.getString("detailaddress"));
			            estate.setE_type(rs.getString("e_type"));
			            estate.setP_type(rs.getString("p_type"));
			            estate.setPrice(rs.getString("price"));
			            estate.setE_no(rs.getInt("e_no"));
			            estate.setEa_name(rs.getString("ea_name"));
			            estate.setRegDate(rs.getTimestamp("regDate"));
			            estate.setRisk(rs.getString("risk"));
			            estate.setArea(rs.getInt("area"));
			            estate.setRoom(rs.getInt("room"));
			            estate.setE_date(rs.getString("e_date"));
			            estate.setMax_floor(rs.getInt("max_floor"));
			            estate.setE_floor(rs.getInt("e_floor"));
			             
		             
		             estateList.add(estate);
		         }         
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }finally {
		         MyDBConnection.close(rs, pstmt, con);
		      }
		   
		      return estateList;
		      
		   }
		   
		}