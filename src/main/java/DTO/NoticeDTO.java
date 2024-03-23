package DTO;

import java.util.Date;

public class NoticeDTO {
	private int n_no;
	private String title;
	private String content;
	private Date regDate;
	private String searchCondition;  // 검색 조건
	private String searchKeyword; // 검색 키워드
	
	   public NoticeDTO() {
		super();
	}
	   
	   

	public NoticeDTO(int n_no, String title, String content, Date regDate, 
			String searchCondition, String searchKeyword) {
		super();
		this.n_no = n_no;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.searchCondition = searchCondition;
		this.searchKeyword = searchKeyword;
	}



	public int getN_no() {
		return n_no;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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
		return "NoticeDTO [n_no=" + n_no + ", title=" + title + ", content=" + content + ", regDate=" + regDate
				+ ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + "]";
	}

	
	
}
