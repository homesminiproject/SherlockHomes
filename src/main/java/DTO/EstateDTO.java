package DTO;

import java.util.Arrays;
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
	private double lat;
	private double lng;
	private String fileName;
	private byte[] fileData;
	private String filePath;
	private String searchCondition;
	private String searchKeyword;

	public int getE_no() {
		return this.e_no;
	}

	public void setE_no(int e_no) {
		this.e_no = e_no;
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

	public String getE_type() {
		return this.e_type;
	}

	public void setE_type(String e_type) {
		this.e_type = e_type;
	}

	public String getP_type() {
		return this.p_type;
	}

	public void setP_type(String p_type) {
		this.p_type = p_type;
	}

	public String getPrice() {
		return this.price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getEa_no() {
		return this.ea_no;
	}

	public void setEa_no(int ea_no) {
		this.ea_no = ea_no;
	}

	public String getEa_name() {
		return this.ea_name;
	}

	public void setEa_name(String ea_name) {
		this.ea_name = ea_name;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return this.regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getRisk() {
		return this.risk;
	}

	public void setRisk(String risk) {
		this.risk = risk;
	}

	public int getArea() {
		return this.area;
	}

	public void setArea(int area) {
		this.area = area;
	}

	public int getRoom() {
		return this.room;
	}

	public void setRoom(int room) {
		this.room = room;
	}

	public String getE_date() {
		return this.e_date;
	}

	public void setE_date(String e_date) {
		this.e_date = e_date;
	}

	public int getMax_floor() {
		return this.max_floor;
	}

	public void setMax_floor(int max_floor) {
		this.max_floor = max_floor;
	}

	public int getE_floor() {
		return this.e_floor;
	}

	public void setE_floor(int e_floor) {
		this.e_floor = e_floor;
	}

	public double getLat() {
		return this.lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return this.lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public byte[] getFileData() {
		return this.fileData;
	}

	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}

	public String getFilePath() {
		return this.filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
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
		return "EstateDTO [e_no=" + this.e_no + ", postcode=" + this.postcode + ", roadaddress=" + this.roadaddress
				+ ", jibunaddress=" + this.jibunaddress + ", detailaddress=" + this.detailaddress + ", e_type="
				+ this.e_type + ", p_type=" + this.p_type + ", price=" + this.price + ", ea_no=" + this.ea_no
				+ ", ea_name=" + this.ea_name + ", content=" + this.content + ", regDate=" + this.regDate + ", risk="
				+ this.risk + ", area=" + this.area + ", room=" + this.room + ", e_date=" + this.e_date + ", max_floor="
				+ this.max_floor + ", e_floor=" + this.e_floor + ", lat=" + this.lat + ", lng=" + this.lng
				+ ", fileName=" + this.fileName + ", fileData=" + Arrays.toString(this.fileData) + ", filePath="
				+ this.filePath + ", searchCondition=" + this.searchCondition + ", searchKeyword=" + this.searchKeyword
				+ "]";
	}
}