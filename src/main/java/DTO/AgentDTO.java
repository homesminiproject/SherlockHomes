package DTO;

import java.util.Date;

public class AgentDTO {
	private int ea_no;
	private String id;
	private String pw;
	private String rep_name;
	private int postcode;
	private String roadaddress;
	private String jibunaddress;
	private String detailaddress;
	private long phone;
	private String agency_name;
	private long license_number;
	private long regi_number;
	private Date regdate;
	private int report;
	private String status;
	private int f_count;
	private int accountlock;

	public int getEa_no() {
		return this.ea_no;
	}

	public void setEa_no(int ea_no) {
		this.ea_no = ea_no;
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

	public String getRep_name() {
		return this.rep_name;
	}

	public void setRep_name(String rep_name) {
		this.rep_name = rep_name;
	}

	public int getPostcode() {
		return this.postcode;
	}

	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}

	public String getRoadaddress() {
		return this.roadaddress;
	}

	public void setRoadaddress(String roadaddress) {
		this.roadaddress = roadaddress;
	}

	public String getJibunaddress() {
		return this.jibunaddress;
	}

	public void setJibunaddress(String jibunaddress) {
		this.jibunaddress = jibunaddress;
	}

	public String getDetailaddress() {
		return this.detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}

	public long getPhone() {
		return this.phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getAgency_name() {
		return this.agency_name;
	}

	public void setAgency_name(String agency_name) {
		this.agency_name = agency_name;
	}

	public long getLicense_number() {
		return this.license_number;
	}

	public void setLicense_number(long license_number) {
		this.license_number = license_number;
	}

	public long getRegi_number() {
		return this.regi_number;
	}

	public void setRegi_number(long regi_number) {
		this.regi_number = regi_number;
	}

	public Date getRegdate() {
		return this.regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getReport() {
		return this.report;
	}

	public void setReport(int report) {
		this.report = report;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public String toString() {
		return "AgentDTO [ea_no=" + this.ea_no + ", id=" + this.id + ", pw=" + this.pw + ", rep_name=" + this.rep_name
				+ ", postcode=" + this.postcode + ", roadaddress=" + this.roadaddress + ", jibunaddress="
				+ this.jibunaddress + ", detailaddress=" + this.detailaddress + ", phone=" + this.phone
				+ ", agency_name=" + this.agency_name + ", license_number=" + this.license_number + ", regi_number="
				+ this.regi_number + ", regdate=" + this.regdate + ", report=" + this.report + ", status=" + this.status
				+ ", f_count=" + this.f_count + ", accountlock=" + this.accountlock + "]";
	}
}