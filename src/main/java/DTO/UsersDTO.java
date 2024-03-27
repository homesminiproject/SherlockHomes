package DTO;

import java.util.Date;

public class UsersDTO {
	private int no;
	private String id;
	private String pw;
	private String name;
	private long phone;
	private int birth;
	private String region;
	private String role;
	private Date regdate;
	private int f_count;
	private int accountlock;
	private String searchCondition;
	private String searchKeyword;

	public int getNo() {
		return this.no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return this.pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getPhone() {
		return this.phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public int getBirth() {
		return this.birth;
	}

	public void setBirth(int birth) {
		this.birth = birth;
	}

	public String getRegion() {
		return this.region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Date getRegdate() {
		return this.regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getF_count() {
		return this.f_count;
	}

	public void setF_count(int f_count) {
		this.f_count = f_count;
	}

	public int getAccountlock() {
		return this.accountlock;
	}

	public void setAccountlock(int accountlock) {
		this.accountlock = accountlock;
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
		return "UsersDTO [no=" + this.no + ", id=" + this.id + ", pw=" + this.pw + ", name=" + this.name + ", phone="
				+ this.phone + ", birth=" + this.birth + ", region=" + this.region + ", role=" + this.role
				+ ", regdate=" + this.regdate + ", f_count=" + this.f_count + ", accountlock=" + this.accountlock
				+ ", searchCondition=" + this.searchCondition + ", searchKeyword=" + this.searchKeyword + "]";
	}
}