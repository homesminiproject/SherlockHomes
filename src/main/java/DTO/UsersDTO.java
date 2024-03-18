package DTO;

import javax.xml.crypto.Data;

public class UsersDTO {
	private int no;
	private String id;
	private String pw;
	private String name;
	private int phone;
	private int birth;
	private String region;
	private String role;
	private Data registration_date;
	private int f_count;
	private int accountlock;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Data getRegistration_date() {
		return registration_date;
	}
	public void setRegistration_date(Data registration_date) {
		this.registration_date = registration_date;
	}
	public int getF_count() {
		return f_count;
	}
	public void setF_count(int f_count) {
		this.f_count = f_count;
	}
	public int getAccountlock() {
		return accountlock;
	}
	public void setAccountlock(int accountlock) {
		this.accountlock = accountlock;
	}
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	@Override
	public String toString() {
		return "UsersDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", birth=" + birth
				+ ", region=" + region + ", role=" + role + ", registration_date=" + registration_date + ", f_count="
				+ f_count + ", accountlock=" + accountlock + "]";
	}
	

	
	
	
}
