package DAO;

import DTO.NoticeDTO;
import dbconnection.MyDBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoticeDAO {
	public Connection con = null;
	public PreparedStatement pstmt = null;
	public ResultSet rs = null;
	private String NOTICE_INSERT = "insert into notice(title,content) values(?,?)";
	private String NOTICE_UPDATE = "update notice set title=? ,content=? where n_no=?";
	private String NOTICE_DELETE = "delete from notice where n_no=?";
	private String NOTICE_GET = "select * from notice where n_no=?";
	private String NOTICE_GETALL = "select * from notice order by n_no desc";
	private String NOTICE_COUNT = "select count(*) from notice";
	private String NOTICE_GET_RANGE = "SELECT * FROM notice ORDER BY n_no DESC LIMIT ?, ?";
	
	private String NOTICE_LIST_T = "select * from notice where title like ? order by n_no desc";
	private String NOTICE_LIST_C = "select * from notice where content like ? order by n_no desc";

	public void insertNotice(NoticeDTO dto) {
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.NOTICE_INSERT);
			this.pstmt.setString(1, dto.getTitle());
			this.pstmt.setString(2, dto.getContent());
			this.pstmt.executeUpdate();
		} catch (SQLException var6) {
			var6.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

	}

	public void updateNotice(NoticeDTO dto) {
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.NOTICE_UPDATE);
			this.pstmt.setString(1, dto.getTitle());
			this.pstmt.setString(2, dto.getContent());
			this.pstmt.setInt(3, dto.getN_no());
			this.pstmt.executeUpdate();
		} catch (SQLException var6) {
			var6.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

	}

	public void deleteNotice(NoticeDTO dto) {
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.NOTICE_DELETE);
			this.pstmt.setInt(1, dto.getN_no());
			this.pstmt.executeUpdate();
		} catch (SQLException var6) {
			var6.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

	}

	public NoticeDTO getNotice(NoticeDTO dto) {
		NoticeDTO Notice = null;

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.NOTICE_GET);
			this.pstmt.setInt(1, dto.getN_no());
			this.rs = this.pstmt.executeQuery();
			if (this.rs.next()) {
				Notice = new NoticeDTO();
				Notice.setN_no(this.rs.getInt("n_no"));
				Notice.setTitle(this.rs.getString("title"));
				Notice.setContent(this.rs.getString("content"));
				Notice.setRegDate(this.rs.getTimestamp("regDate"));
			}
		} catch (SQLException var7) {
			var7.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return Notice;
	}

	public List<NoticeDTO> searchNotice(String searchCondition, String searchKeyword) {
		List<NoticeDTO> noticeList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			this.con = MyDBConnection.getConnection();
			if (searchCondition.equalsIgnoreCase("TITLE")) {
				System.out.println("title");
				pstmt = this.con.prepareStatement(this.NOTICE_LIST_T);
			} else if (searchCondition.equalsIgnoreCase("CONTENT")) {
				System.out.println("content");
				pstmt = this.con.prepareStatement(this.NOTICE_LIST_C);
			}

			System.out.println("에러");
			pstmt.setString(1, "%" + searchKeyword + "%");
			System.out.println(searchKeyword);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				notice.setN_no(rs.getInt("n_no"));
				notice.setTitle(rs.getString("title"));
				notice.setRegDate(rs.getTimestamp("regDate"));
				noticeList.add(notice);
			}
		} catch (SQLException var11) {
			var11.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, this.con);
		}

		return noticeList;
	}

	public List<NoticeDTO> getNoticeAll(NoticeDTO dto) {
		List<NoticeDTO> noticeList = new ArrayList<>();

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.NOTICE_GETALL);
			this.rs = this.pstmt.executeQuery();

			while (this.rs.next()) {
				new NoticeDTO();
				NoticeDTO notice = new NoticeDTO();
				notice.setN_no(this.rs.getInt("n_no"));
				notice.setTitle(this.rs.getString("title"));
				notice.setContent(this.rs.getString("content"));
				notice.setRegDate(this.rs.getTimestamp("regDate"));
				noticeList.add(notice);
			}
		} catch (SQLException var7) {
			var7.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return noticeList;
	}

	public List<NoticeDTO> getNoticePage(int start, int count) {
		List<NoticeDTO> noticeList = new ArrayList<>();
		
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.NOTICE_GET_RANGE);
			pstmt.setInt(1, start);
	        pstmt.setInt(2, count);
			this.rs = this.pstmt.executeQuery();
			
			while (this.rs.next()) {
				new NoticeDTO();
				NoticeDTO notice = new NoticeDTO();
				notice.setN_no(this.rs.getInt("n_no"));
				notice.setTitle(this.rs.getString("title"));
				notice.setContent(this.rs.getString("content"));
				notice.setRegDate(this.rs.getTimestamp("regDate"));
				noticeList.add(notice);
			}
		} catch (SQLException var7) {
			var7.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}
		
		return noticeList;
	}
	
	public int getTotalRecords() {
		   int totalCount = 0;
		   try {
			   con = MyDBConnection.getConnection();
			   pstmt = con.prepareStatement(NOTICE_COUNT);
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