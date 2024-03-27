package DAO;

import DTO.ReportDTO;
import dbconnection.MyDBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReportDAO {
	public Connection con = null;
	public PreparedStatement pstmt = null;
	public ResultSet rs = null;
	private String REPORT_CHECK = "update report set status=? ,r_count=r_count+1 where r_no=?";
	private String REPORT_RETURN = "update report set status=? where r_no=?";
	private String REPORT_GET = "select * from report where r_no=?";
	private String REPORT_GETALL = "select * from report order by r_no desc";
	private String REPORT_DELETE = "delete from report where r_no=?";
	private String REPORT_COUNT = "select count(*) from report";
	private String REPORT_GET_RANGE = "SELECT * FROM report ORDER BY r_no DESC LIMIT ?, ?";
	
	private String REPORT_LIST_T = "select * from report where title like ? order by r_no desc";
	private String REPORT_LIST_S = "select * from report where status like ? order by r_no desc";
	private String REPORT_LIST_R = "select * from report where r_type like ? order by r_no desc";

	public void updateReport(ReportDTO dto) {
		try {
			this.con = MyDBConnection.getConnection();
			if (dto.getSelectStatus().equalsIgnoreCase("CHECK")) {
				this.pstmt = this.con.prepareStatement(this.REPORT_CHECK);
			} else if (dto.getSelectStatus().equalsIgnoreCase("RETURN")) {
				this.pstmt = this.con.prepareStatement(this.REPORT_RETURN);
			}

			this.pstmt.setString(1, "처리 완료");
			this.pstmt.setInt(2, dto.getR_no());
			this.pstmt.executeUpdate();
		} catch (SQLException var6) {
			var6.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

	}

	public ReportDTO getReport(ReportDTO dto) {
		ReportDTO board = null;

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.REPORT_GET);
			this.pstmt.setInt(1, dto.getR_no());
			this.rs = this.pstmt.executeQuery();
			if (this.rs.next()) {
				board = new ReportDTO();
				board.setR_no(this.rs.getInt("r_no"));
				board.setTitle(this.rs.getString("title"));
				board.setWriter(this.rs.getString("writer"));
				board.setRegDate(this.rs.getTimestamp("regDate"));
				board.setStatus(this.rs.getString("status"));
				board.setR_type(this.rs.getString("r_type"));
				board.setR_name(this.rs.getString("r_name"));
				board.setR_count(this.rs.getInt("r_count"));
			}
		} catch (SQLException var7) {
			var7.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return board;
	}

	public List<ReportDTO> getReportList(ReportDTO dto) {
		List<ReportDTO> reportList = new ArrayList<>();

		try {
			this.con = MyDBConnection.getConnection();
			if (dto.getSearchCondition().equalsIgnoreCase("TITLE")) {
				this.pstmt = this.con.prepareStatement(this.REPORT_LIST_T);
			} else if (dto.getSearchCondition().equalsIgnoreCase("STATUS")) {
				this.pstmt = this.con.prepareStatement(this.REPORT_LIST_S);
			} else if (dto.getSearchCondition().equalsIgnoreCase("R_TYPE")) {
				this.pstmt = this.con.prepareStatement(this.REPORT_LIST_R);
			}

			String searchKeyword = "%" + dto.getSearchKeyword() + "%";
			this.pstmt.setString(1, searchKeyword);
			this.rs = this.pstmt.executeQuery();

			while (this.rs.next()) {
				new ReportDTO();
				ReportDTO report = new ReportDTO();
				report.setR_no(this.rs.getInt("r_no"));
				report.setTitle(this.rs.getString("title"));
				report.setWriter(this.rs.getString("writer"));
				report.setRegDate(this.rs.getTimestamp("regDate"));
				report.setR_count(this.rs.getInt("r_count"));
				report.setStatus(this.rs.getString("status"));
				report.setR_type(this.rs.getString("r_type"));
				report.setR_name(this.rs.getString("r_name"));
				reportList.add(report);
			}
		} catch (SQLException var8) {
			var8.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return reportList;
	}

	public List<ReportDTO> getReportAll(ReportDTO dto) {
		List<ReportDTO> reportList = new ArrayList<>();

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.REPORT_GETALL);
			this.rs = this.pstmt.executeQuery();

			while (this.rs.next()) {
				new ReportDTO();
				ReportDTO report = new ReportDTO();
				report.setR_no(this.rs.getInt("r_no"));
				report.setTitle(this.rs.getString("title"));
				report.setWriter(this.rs.getString("writer"));
				report.setRegDate(this.rs.getTimestamp("regDate"));
				report.setR_count(this.rs.getInt("r_count"));
				report.setStatus(this.rs.getString("status"));
				report.setR_type(this.rs.getString("r_type"));
				report.setR_name(this.rs.getString("r_name"));
				reportList.add(report);
			}
		} catch (SQLException var7) {
			var7.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return reportList;
	}

	public List<ReportDTO> getReportPage(int start, int count) {
		List<ReportDTO> reportList = new ArrayList<>();
		
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.REPORT_GET_RANGE);
			pstmt.setInt(1, start);
	        pstmt.setInt(2, count);
			this.rs = this.pstmt.executeQuery();
			
			while (this.rs.next()) {
				new ReportDTO();
				ReportDTO report = new ReportDTO();
				report.setR_no(this.rs.getInt("r_no"));
				report.setTitle(this.rs.getString("title"));
				report.setWriter(this.rs.getString("writer"));
				report.setRegDate(this.rs.getTimestamp("regDate"));
				report.setR_count(this.rs.getInt("r_count"));
				report.setStatus(this.rs.getString("status"));
				report.setR_type(this.rs.getString("r_type"));
				report.setR_name(this.rs.getString("r_name"));
				reportList.add(report);
			}
		} catch (SQLException var7) {
			var7.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}
		
		return reportList;
	}

	public void deleteReport(ReportDTO dto) {
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.REPORT_DELETE);
			this.pstmt.setInt(1, dto.getR_no());
			this.pstmt.executeUpdate();
		} catch (SQLException var6) {
			var6.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

	}
	
	public int getTotalRecords() {
		   int totalCount = 0;
		   try {
			   con = MyDBConnection.getConnection();
			   pstmt = con.prepareStatement(REPORT_COUNT);
			   rs = pstmt.executeQuery();
			   if (rs.next()) {
				   totalCount = rs.getInt(1); 
			   }
		   } catch (SQLException e) {
			   e.printStackTrace();
		   }finally {
			   MyDBConnection.close(rs, pstmt, con);
		   }
		   return totalCount;
	   }
}