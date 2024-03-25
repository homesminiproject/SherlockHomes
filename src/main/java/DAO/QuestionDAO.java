package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import DTO.QuestionDTO;
import dbconnection.MyDBConnection;

public class QuestionDAO {
   public Connection con = null;
   public PreparedStatement pstmt = null;
   public ResultSet rs = null;

   private String QUESTION_UPDATE = "update question set replyornot=? ,reply=? where q_no=?";
   private String QUESTION_DELETE = "delete from question where q_no=?";
   private String QUESTION_GET = "select * from question where q_no=?";
   private String QUESTION_GETALL = "select * from question order by q_no desc";

   // 검색 관련
   private String QUESTION_LIST_T = "select * from question where title like ? order by q_no desc";
   private String QUESTION_LIST_C = "select * from question where content like ? order by q_no desc";

   // 글 수정
   public void updateQuestion(QuestionDTO dto) {
      try {
         con = MyDBConnection.getConnection();
         pstmt = con.prepareStatement(QUESTION_UPDATE);
         pstmt.setString(1, "답변완료");
         pstmt.setString(2, dto.getReply());
         pstmt.setInt(3, dto.getQ_no());

         pstmt.executeUpdate();

      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         MyDBConnection.close(rs, pstmt, con);
      }

   }

   // 글 삭제
   public void deleteQuestion(QuestionDTO dto) {

      try {
         con = MyDBConnection.getConnection();
         pstmt = con.prepareStatement(QUESTION_DELETE);
         pstmt.setInt(1, dto.getQ_no());

         pstmt.executeUpdate();

      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         MyDBConnection.close(rs, pstmt, con);
      }

   }

   // 글 상세 조회
   public QuestionDTO getQuestion(QuestionDTO dto) {
      // 번호 하나로만 검색하기에 번호를 매개값으로 받아도 되지만
      // 결과를 이용하기 해서 상세 검색을 표현하기 위해 NoticeDTO로 받음
      QuestionDTO question = null;

      try {
         con = MyDBConnection.getConnection();
         pstmt = con.prepareStatement(QUESTION_GET);
         pstmt.setInt(1, dto.getQ_no());

         rs = pstmt.executeQuery();

         if (rs.next()) {
            question = new QuestionDTO();
            question.setQ_no(rs.getInt("q_no"));
            question.setQ_title(rs.getString("q_title"));
            question.setQ_sort(rs.getString("q_sort"));
            question.setQ_writer(rs.getString("q_writer"));
            question.setContent(rs.getString("content"));
            question.setRegDate(rs.getTimestamp("regDate"));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         MyDBConnection.close(rs, pstmt, con);
      }
      return question;
   }

//    글 리스트 검색
   public List<QuestionDTO> getQuestionList(QuestionDTO dto) {
      List<QuestionDTO> QuestionList = new ArrayList<>();

      try {
         con = MyDBConnection.getConnection();

         if (dto.getSearchCondition().equalsIgnoreCase("TITLE")) {
            pstmt = con.prepareStatement(QUESTION_LIST_T);
         } else if (dto.getSearchCondition().equalsIgnoreCase("CONTENT")) {
            pstmt = con.prepareStatement(QUESTION_LIST_C);
         }

         String searchKeyword = "%" + dto.getSearchKeyword() + "%";

         // pstmt.setString(1, dto.getSearchKeyword());
         pstmt.setString(1, searchKeyword);
         rs = pstmt.executeQuery();

         while (rs.next()) {
            QuestionDTO question = new QuestionDTO();

            question = new QuestionDTO();
            question.setQ_no(rs.getInt("q_no"));
            question.setQ_title(rs.getString("q_title"));
            question.setQ_sort(rs.getString("q_sort"));
            question.setQ_writer(rs.getString("q_writer"));
            question.setContent(rs.getString("content"));
            question.setReplyornot(rs.getString("replyornot"));
            question.setReply(rs.getString("reply"));
            question.setRegDate(rs.getTimestamp("regDate"));

            QuestionList.add(question);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         MyDBConnection.close(rs, pstmt, con);
      }

      return QuestionList;

   }

   // 전부 리스트화
   public List<QuestionDTO> getQuestionAll(QuestionDTO dto) {
      List<QuestionDTO> questionList = new ArrayList<>();

      try {
         con = MyDBConnection.getConnection();
         pstmt = con.prepareStatement(QUESTION_GETALL);
         rs = pstmt.executeQuery();

         while (rs.next()) {
            QuestionDTO question = new QuestionDTO();

            question = new QuestionDTO();
            question.setQ_no(rs.getInt("q_no"));
            question.setQ_title(rs.getString("q_title"));
            question.setQ_sort(rs.getString("q_sort"));
            question.setQ_writer(rs.getString("q_writer"));
            question.setContent(rs.getString("content"));
            question.setReplyornot(rs.getString("replyornot"));
            question.setReply(rs.getString("reply"));
            question.setRegDate(rs.getTimestamp("regDate"));

            questionList.add(question);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         MyDBConnection.close(rs, pstmt, con);
      }
      return questionList;

   }
}