package DTO;

import java.util.Date;

public class ReportDTO {
	private int r_no;
	private String title;
	private String writer;
	private Date regDate;
	private String status;
	private String r_type;
	private String r_name;
	private int r_count;
	private String searchCondition;  // 검색 조건
	private String searchKeyword; // 검색 키워드
	
	
	public ReportDTO() {
		super();
	}
	
	public ReportDTO(int r_no, String title, String writer, Date regDate, String status, String r_type, String r_name,
			int r_count, String searchCondition, String searchKeyword) {
		super();
		this.r_no = r_no;
		this.title = title;
		this.writer = writer;
		this.regDate = regDate;
		this.status = status;
		this.r_type = r_type;
		this.r_name = r_name;
		this.r_count = r_count;
		this.searchCondition = searchCondition;
		this.searchKeyword = searchKeyword;
	}

	public int getR_no() {
		return r_no;
	}


	public void setR_no(int r_no) {
		this.r_no = r_no;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getR_type() {
		return r_type;
	}


	public void setR_type(String r_type) {
		this.r_type = r_type;
	}


	public String getR_name() {
		return r_name;
	}


	public void setR_name(String r_name) {
		this.r_name = r_name;
	}


	public int getR_count() {
		return r_count;
	}


	public void setR_count(int r_count) {
		this.r_count = r_count;
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
		return "ReportDTO [r_no=" + r_no + ", title=" + title + ", writer=" + writer + ", regDate=" + regDate
				+ ", status=" + status + ", r_type=" + r_type + ", r_name=" + r_name + ", r_count=" + r_count
				+ ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + "]";
	}
	
	
}
