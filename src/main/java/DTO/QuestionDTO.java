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
	private String searchCondition;
	private String searchKeyword;

	public QuestionDTO(int q_no, String q_title, String q_sort, String q_writer, Date regDate, String content,
			String replyornot, String reply) {
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
	}

	public int getQ_no() {
		return this.q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public String getQ_title() {
		return this.q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_sort() {
		return this.q_sort;
	}

	public void setQ_sort(String q_sort) {
		this.q_sort = q_sort;
	}

	public String getQ_writer() {
		return this.q_writer;
	}

	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}

	public Date getRegDate() {
		return this.regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReplyornot() {
		return this.replyornot;
	}

	public void setReplyornot(String replyornot) {
		this.replyornot = replyornot;
	}

	public String getReply() {
		return this.reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getSearchCondition() {
		return this.searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return this.searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String toString() {
		return "QuestionDTO [q_no=" + this.q_no + ", q_title=" + this.q_title + ", q_sort=" + this.q_sort
				+ ", q_writer=" + this.q_writer + ", regDate=" + this.regDate + ", content=" + this.content
				+ ", replyornot=" + this.replyornot + ", reply=" + this.reply + ", searchCondition="
				+ this.searchCondition + ", searchKeyword=" + this.searchKeyword + "]";
	}
}