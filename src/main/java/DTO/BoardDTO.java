package DTO;

import java.util.Date;

public class BoardDTO {
	private int seq;
	private String title;
	private String writer;
	private String content;
	private Date regDate;
	private int count;
	
	private String searchCondition;  // 검색 조건
	private String searchKeyword; // 검색 키워드
	
	
	public BoardDTO() {
		super();
	}


	public BoardDTO(int seq, String title, String writer, String content, Date regDate, int count,
			String searchCondition, String searchKeyword) {
		super();
		this.seq = seq;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
		this.count = count;
		this.searchCondition = searchCondition;
		this.searchKeyword = searchKeyword;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
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


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
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
		return "BoardDTO [seq=" + seq + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", regDate=" + regDate + ", count=" + count + ", searchCondition=" + searchCondition
				+ ", searchKeyword=" + searchKeyword + "]";
	}



	
}
