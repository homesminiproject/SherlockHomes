package DAO;

import DTO.QuestionDTO;
import dbconnection.MyDBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {
	public Connection con = null;
	public PreparedStatement pstmt = null;
	public ResultSet rs = null;
	private String QUESTION_UPDATE = "update question set replyornot=? ,reply=? where q_no=?";
	private String QUESTION_DELETE = "delete from question where q_no=?";
	private String QUESTION_GET = "select * from question where q_no=?";
	private String QUESTION_GETALL = "select * from question order by q_no desc";
	private String QUESTION_COUNT = "select count(*) from question";
	private String QUESTION_GET_RANGE = "SELECT * FROM question ORDER BY q_no DESC LIMIT ?, ?";
	
	private String QUESTION_LIST_T = "select * from question where title like ? order by q_no desc";
	private String QUESTION_LIST_C = "select * from question where content like ? order by q_no desc";

	public void updateQuestion(QuestionDTO dto) {
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.QUESTION_UPDATE);
			this.pstmt.setString(1, "답변완료");
			this.pstmt.setString(2, dto.getReply());
			this.pstmt.setInt(3, dto.getQ_no());
			this.pstmt.executeUpdate();
		} catch (SQLException var6) {
			var6.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

	}

	public void deleteQuestion(QuestionDTO dto) {
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.QUESTION_DELETE);
			this.pstmt.setInt(1, dto.getQ_no());
			this.pstmt.executeUpdate();
		} catch (SQLException var6) {
			var6.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

	}

	public QuestionDTO getQuestion(QuestionDTO dto) {
		QuestionDTO question = null;

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.QUESTION_GET);
			this.pstmt.setInt(1, dto.getQ_no());
			this.rs = this.pstmt.executeQuery();
			if (this.rs.next()) {
				question = new QuestionDTO();
				question.setQ_no(this.rs.getInt("q_no"));
				question.setQ_title(this.rs.getString("q_title"));
				question.setContent(this.rs.getString("content"));
				question.setRegDate(this.rs.getTimestamp("regDate"));
			}
		} catch (SQLException var7) {
			var7.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return question;
	}

	public List<QuestionDTO> getQuestionList(QuestionDTO dto) {
		List<QuestionDTO> QuestionList = new ArrayList<>();

		try {
			this.con = MyDBConnection.getConnection();
			if (dto.getSearchCondition().equalsIgnoreCase("TITLE")) {
				this.pstmt = this.con.prepareStatement(this.QUESTION_LIST_T);
			} else if (dto.getSearchCondition().equalsIgnoreCase("CONTENT")) {
				this.pstmt = this.con.prepareStatement(this.QUESTION_LIST_C);
			}

			String searchKeyword = "%" + dto.getSearchKeyword() + "%";
			this.pstmt.setString(1, searchKeyword);
			this.rs = this.pstmt.executeQuery();

			while (this.rs.next()) {
				new QuestionDTO();
				QuestionDTO question = new QuestionDTO();
				question.setQ_no(this.rs.getInt("q_no"));
				question.setQ_title(this.rs.getString("q_title"));
				question.setQ_sort(this.rs.getString("q_sort"));
				question.setQ_writer(this.rs.getString("q_writer"));
				question.setContent(this.rs.getString("content"));
				question.setReplyornot(this.rs.getString("replyornot"));
				question.setReply(this.rs.getString("reply"));
				question.setRegDate(this.rs.getTimestamp("regDate"));
				QuestionList.add(question);
			}
		} catch (SQLException var8) {
			var8.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return QuestionList;
	}

	public List<QuestionDTO> getQuestionAll(QuestionDTO dto) {
		List<QuestionDTO> questionList = new ArrayList<>();

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.QUESTION_GETALL);
			this.rs = this.pstmt.executeQuery();

			while (this.rs.next()) {
				new QuestionDTO();
				QuestionDTO question = new QuestionDTO();
				question.setQ_no(this.rs.getInt("q_no"));
				question.setQ_title(this.rs.getString("q_title"));
				question.setQ_sort(this.rs.getString("q_sort"));
				question.setQ_writer(this.rs.getString("q_writer"));
				question.setContent(this.rs.getString("content"));
				question.setReplyornot(this.rs.getString("replyornot"));
				question.setReply(this.rs.getString("reply"));
				question.setRegDate(this.rs.getTimestamp("regDate"));
				questionList.add(question);
			}
		} catch (SQLException var7) {
			var7.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return questionList;
	}

	public List<QuestionDTO> getQuestionPage(int start, int count) {
		List<QuestionDTO> questionList = new ArrayList<>();
		
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.QUESTION_GET_RANGE);
			pstmt.setInt(1, start);
	        pstmt.setInt(2, count);
			this.rs = this.pstmt.executeQuery();
			
			while (this.rs.next()) {
				new QuestionDTO();
				QuestionDTO question = new QuestionDTO();
				question.setQ_no(this.rs.getInt("q_no"));
				question.setQ_title(this.rs.getString("q_title"));
				question.setQ_sort(this.rs.getString("q_sort"));
				question.setQ_writer(this.rs.getString("q_writer"));
				question.setContent(this.rs.getString("content"));
				question.setReplyornot(this.rs.getString("replyornot"));
				question.setReply(this.rs.getString("reply"));
				question.setRegDate(this.rs.getTimestamp("regDate"));
				questionList.add(question);
			}
		} catch (SQLException var7) {
			var7.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}
		
		return questionList;
	}
	
	public int getTotalRecords() {
		   int totalCount = 0;
		   try {
			   con = MyDBConnection.getConnection();
			   pstmt = con.prepareStatement(QUESTION_COUNT);
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