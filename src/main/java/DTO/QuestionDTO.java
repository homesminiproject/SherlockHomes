package DTO;

import java.util.Date;

public class QuestionDTO {
    private int q_no;
    private String q_title;
    private String q_sort;
    private String q_writer;
    private Date regDate;
    private String content;
    private String replyornot;
    private String reply;


	private String searchCondition;  // 검색 조건
	private String searchKeyword; // 검색 키워드
	
    // 생성자
    public QuestionDTO(int q_no, String q_title, String q_sort, String q_writer, Date regDate, String content, String replyornot, String reply) {
        this.q_no = q_no;
        this.q_title = q_title;
        this.q_sort = q_sort;
        this.q_writer = q_writer;
        this.regDate = new Date(regDate.getTime());
        this.content = content;
        this.replyornot = replyornot;
        this.reply = reply;
    }
    

    public QuestionDTO() {
      super();
   }


   // Getter 및 Setter 메소드들
    public int getQ_no() {
        return q_no;
    }

    public void setQ_no(int q_no) {
        this.q_no = q_no;
    }

    public String getQ_title() {
        return q_title;
    }

    public void setQ_title(String q_title) {
        this.q_title = q_title;
    }

    public String getQ_sort() {
        return q_sort;
    }

    public void setQ_sort(String q_sort) {
        this.q_sort = q_sort;
    }

    public String getQ_writer() {
        return q_writer;
    }

    public void setQ_writer(String q_writer) {
        this.q_writer = q_writer;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReplyornot() {
        return replyornot;
    }

    public void setReplyornot(String replyornot) {
        this.replyornot = replyornot;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }


	public String getSearchCondition() {
		return searchCondition;
	}


	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}


	public String getSearchKeyword() {
		return searchKeyword;
	}


	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}


	@Override
	public String toString() {
		return "QuestionDTO [q_no=" + q_no + ", q_title=" + q_title + ", q_sort=" + q_sort + ", q_writer=" + q_writer
				+ ", regDate=" + regDate + ", content=" + content + ", replyornot=" + replyornot + ", reply=" + reply
				+ ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + "]";
	}

}
