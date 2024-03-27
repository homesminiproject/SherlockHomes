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
	private String searchCondition;
	private String searchKeyword;
	private String selectStatus;

	public ReportDTO() {
	}

	public ReportDTO(int r_no, String title, String writer, Date regDate, String status, String r_type, String r_name,
			int r_count, String searchCondition, String searchKeyword, String selectStatus) {
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
		this.selectStatus = selectStatus;
	}

	public int getR_no() {
		return this.r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return this.writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegDate() {
		return this.regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getR_type() {
		return this.r_type;
	}

	public void setR_type(String r_type) {
		this.r_type = r_type;
	}

	public String getR_name() {
		return this.r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public int getR_count() {
		return this.r_count;
	}

	public void setR_count(int r_count) {
		this.r_count = r_count;
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

	public String getSelectStatus() {
		return this.selectStatus;
	}

	public void setSelectStatus(String selectStatus) {
		this.selectStatus = selectStatus;
	}

	public String toString() {
		return "ReportDTO [r_no=" + this.r_no + ", title=" + this.title + ", writer=" + this.writer + ", regDate="
				+ this.regDate + ", status=" + this.status + ", r_type=" + this.r_type + ", r_name=" + this.r_name
				+ ", r_count=" + this.r_count + ", searchCondition=" + this.searchCondition + ", searchKeyword="
				+ this.searchKeyword + ", selectStatus=" + this.selectStatus + "]";
	}
}