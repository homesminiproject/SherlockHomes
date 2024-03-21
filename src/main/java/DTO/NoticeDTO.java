package DTO;

import java.util.Date;

public class NoticeDTO {
	private int n_no;
	private String title;
	private String content;
	private Date regDate;
	
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
	
	public String toString() {
		return "NoticeDTO [n_no=" + n_no + ", title=" + title + ", content=" + content + ", regDate=" + regDate + "]";
	}

}
