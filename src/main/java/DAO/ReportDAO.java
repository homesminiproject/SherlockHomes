package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.ReportDTO;
import dbconnection.MyDBConnection;

public class ReportDAO {
	public Connection con = null;
	public PreparedStatement pstmt = null;
	public ResultSet rs = null;
	
	private String REPORT_CHECK = "update report set status=? ,r_count=r_count+1 where r_no=?";
	private String REPORT_RETURN = "update report set status=? where r_no=?";
	private String REPORT_GET = "select * from report where r_no=?";
	private String REPORT_GETALL = "select * from report order by r_no desc";
	
	 //검색 관련
	   private String REPORT_LIST_T ="select * from report where title like ? order by r_no desc";
	   private String REPORT_LIST_S ="select * from report where status like ? order by r_no desc";
	   private String REPORT_LIST_R ="select * from report where r_type like ? order by r_no desc";
	   
	   public void updateReport(ReportDTO dto) {
			
			try {
				con = MyDBConnection.getConnection();
				
				if(dto.getSelectStatus().equalsIgnoreCase("CHECK")) {
					pstmt = con.prepareStatement(REPORT_CHECK);
				} else if(dto.getSelectStatus().equalsIgnoreCase("RETURN")) {
					pstmt = con.prepareStatement(REPORT_RETURN);
				}
				
				pstmt.setString(1,"처리 완료");
				pstmt.setInt(2,dto.getR_no());
				
				pstmt.executeUpdate();
			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				MyDBConnection.close(rs, pstmt, con);
			}
		
		}
	   
	   public ReportDTO getReport(ReportDTO dto) { 
			// 번호 하나로만 검색하기에 번호를 매개값으로 받아도 되지만
			// 결과를 이용하기 해서 상세 검색을 표현하기 위해 BoardDTO로 받음
		   ReportDTO board = null;
			
			try {
				con = MyDBConnection.getConnection();
				pstmt = con.prepareStatement(REPORT_GET);
				pstmt.setInt(1,dto.getR_no());
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					board = new ReportDTO();
				    board.setR_no(rs.getInt("r_no"));
				    board.setTitle(rs.getString("title"));
				    board.setWriter(rs.getString("writer"));
				    board.setRegDate(rs.getTimestamp("regDate"));
				    board.setStatus(rs.getString("status"));			
				    board.setR_type(rs.getString("r_type"));			
				    board.setR_name(rs.getString("r_name"));			
				    board.setR_count(rs.getInt("r_count"));			
				}			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				MyDBConnection.close(rs, pstmt, con);
			}
			return board;
		}
		
		//글 리스트 검색
		public List<ReportDTO> getReportList(ReportDTO dto){
			List<ReportDTO> reportList = new ArrayList<>();
			
			try {
				con = MyDBConnection.getConnection();
				
				if(dto.getSearchCondition().equalsIgnoreCase("TITLE")) {
					pstmt = con.prepareStatement(REPORT_LIST_T);
				} else if(dto.getSearchCondition().equalsIgnoreCase("STATUS")) {
					pstmt = con.prepareStatement(REPORT_LIST_S);
				}else if(dto.getSearchCondition().equalsIgnoreCase("R_TYPE")) {
					pstmt = con.prepareStatement(REPORT_LIST_R);
				}
				
				String searchKeyword ="%" + dto.getSearchKeyword() + "%";
				
				pstmt.setString(1, searchKeyword);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ReportDTO report = new ReportDTO();
					
					report = new ReportDTO();
					report.setR_no(rs.getInt("r_no"));
					report.setTitle(rs.getString("title"));
					report.setWriter(rs.getString("writer"));
					report.setRegDate(rs.getTimestamp("regDate"));
					report.setR_count(rs.getInt("r_count"));	
					report.setStatus(rs.getString("status"));
					report.setR_type(rs.getString("r_type"));
					report.setR_name(rs.getString("r_name"));
				    
				    reportList.add(report);
				}			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				MyDBConnection.close(rs, pstmt, con);
			}
		
			return reportList;
			
		}
		
		
		public List<ReportDTO> getReportAll(ReportDTO dto){
			List<ReportDTO> reportList = new ArrayList<>();
			
			try {
				con = MyDBConnection.getConnection();
				pstmt = con.prepareStatement(REPORT_GETALL);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ReportDTO report = new ReportDTO();
					
					report = new ReportDTO();
					report.setR_no(rs.getInt("r_no"));
					report.setTitle(rs.getString("title"));
					report.setWriter(rs.getString("writer"));
					report.setRegDate(rs.getTimestamp("regDate"));
					report.setR_count(rs.getInt("r_count"));	
					report.setStatus(rs.getString("status"));
					report.setR_type(rs.getString("r_type"));
					report.setR_name(rs.getString("r_name"));
				    
				    reportList.add(report);
				}			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				MyDBConnection.close(rs, pstmt, con);
			}
		
			return reportList;
			
		}
}
