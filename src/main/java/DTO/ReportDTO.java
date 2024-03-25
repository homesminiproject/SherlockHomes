package DTO;

import java.util.Date;

public class ReportDTO {
	private int r_no;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private String status;
	private String r_type;
	private String r_name;
	private int r_count;
	private String searchCondition;  // 검색 조건
	private String searchKeyword; // 검색 키워드
	private String selectStatus;
	
	

	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
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


	public String getSelectStatus() {
		return selectStatus;
	}


	public void setSelectStatus(String selectStatus) {
		this.selectStatus = selectStatus;
	}


	@Override
	public String toString() {
		return "ReportDTO [r_no=" + r_no + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regDate=" + regDate + ", status=" + status + ", r_type=" + r_type + ", r_name=" + r_name
				+ ", r_count=" + r_count + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword
				+ ", selectStatus=" + selectStatus + "]";
	}




}
