package DTO;

import java.util.Date;

public class EstateDTO {
	private int e_no;
	private int postcode;
	private String roadaddress;
	private String jibunaddress;
	private String detailaddress;
	private String e_type;
	private String p_type;
	private String price;
	private int ea_no;
	private String ea_name;
	private String content;
	private Date regDate;
	private String risk;
	private int area;
	private int room;
	private String e_date;
	private int max_floor;
	private int e_floor;
	
	private String searchCondition;  // 검색 조건
	private String searchKeyword; // 검색 키워드
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public String getEa_name() {
		return ea_name;
	}
	public void setEa_name(String ea_name) {
		this.ea_name = ea_name;
	}
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
	public int getPostcode() {
		return postcode;
	}
	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}
	public String getRoadaddress() {
		return roadaddress;
	}
	public void setRoadaddress(String roadaddress) {
		this.roadaddress = roadaddress;
	}
	public String getJibunaddress() {
		return jibunaddress;
	}
	public void setJibunaddress(String jibunaddress) {
		this.jibunaddress = jibunaddress;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	public String getE_type() {
		return e_type;
	}
	public void setE_type(String e_type) {
		this.e_type = e_type;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getEa_no() {
		return ea_no;
	}
	public void setEa_no(int ea_no) {
		this.ea_no = ea_no;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getRisk() {
		return risk;
	}
	public void setRisk(String risk) {
		this.risk = risk;
	}
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public String getE_date() {
		return e_date;
	}
	public void setE_date(String e_date) {
		this.e_date = e_date;
	}
	public int getMax_floor() {
		return max_floor;
	}
	public void setMax_floor(int max_floor) {
		this.max_floor = max_floor;
	}
	public int getE_floor() {
		return e_floor;
	}
	public void setE_floor(int e_floor) {
		this.e_floor = e_floor;
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
		return "EstateDTO [e_no=" + e_no + ", postcode=" + postcode + ", roadaddress=" + roadaddress + ", jibunaddress="
				+ jibunaddress + ", detailaddress=" + detailaddress + ", e_type=" + e_type + ", p_type=" + p_type
				+ ", price=" + price + ", ea_no=" + ea_no + ", ea_name=" + ea_name + ", content=" + content
				+ ", regDate=" + regDate + ", risk=" + risk + ", area=" + area + ", room=" + room + ", e_date=" + e_date
				+ ", max_floor=" + max_floor + ", e_floor=" + e_floor + ", searchCondition=" + searchCondition
				+ ", searchKeyword=" + searchKeyword + "]";
	}
	
}
