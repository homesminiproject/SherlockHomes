package DTO;

import java.util.Date;

public class NoticeDTO {
	private int n_no;
	private String title;
	private String content;
	private Date regDate;
	private String searchCondition;
	private String searchKeyword;

	public NoticeDTO() {
	}

	public NoticeDTO(int n_no, String title, String content, Date regDate, String searchCondition,
			String searchKeyword) {
		this.n_no = n_no;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.searchCondition = searchCondition;
		this.searchKeyword = searchKeyword;
	}

	public int getN_no() {
		return this.n_no;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return this.regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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
		return "NoticeDTO [n_no=" + this.n_no + ", title=" + this.title + ", content=" + this.content + ", regDate="
				+ this.regDate + ", searchCondition=" + this.searchCondition + ", searchKeyword=" + this.searchKeyword
				+ "]";
	}
}