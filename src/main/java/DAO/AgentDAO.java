package DAO;

import DTO.AgentDTO;
import dbconnection.MyDBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AgentDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String USER_GET = "select * from ea_users where id=?";
	private String USER_GET2 = "select * from ea_users where ea_no=?";
	private String USER_LIST = "select * from ea_users";
	private String USER_INSERT = "INSERT INTO ea_users (id, pw, rep_name, postcode, roadaddress, jibunaddress, detailaddress, phone, agency_name, license_number,regi_number) values(?,?,?,?,?,?,?,?,?,?,?)";
	private String AGENT_UPDATE = "UPDATE ea_users SET rep_name=?, agency_name=?, postcode=?, roadaddress=?, jibunaddress=?, detailaddress=?, phone=?, report=?, status=?, f_count=?, accountlock=? WHERE id=?";
	private String AGENT_DELETE = "delete from ea_users where ea_no=?";
	private String FAIL_COUNT_UPDATE = "UPDATE ea_users SET f_count = f_count + 1 WHERE id = ?";
	private String FAIL_COUNT_RESET = "UPDATE ea_users SET f_count = 0 WHERE id = ?";
	private String LOCK_ACCOUNT = "UPDATE ea_users SET accountlock = 1 WHERE id = ?";
	private String AGENT_LIST_N = "select * from ea_users where rep_name  like ? order by ea_no desc";
	private String AGENT_LIST_A = "select * from ea_users where status like ? order by ea_no desc";
	private String ALL_agentcount = "SELECT COUNT(*) AS total FROM ea_users;";
	private String PW_RESET = "UPDATE ea_users SET pw = 'qwe123!@#' WHERE ea_no = ?";

	public AgentDTO getAgent(String id) {
		AgentDTO user = null;

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.USER_GET);
			this.pstmt.setString(1, id);
			this.rs = this.pstmt.executeQuery();
			if (this.rs.next()) {
				user = new AgentDTO();
				user.setId(this.rs.getString("id"));
				user.setPw(this.rs.getString("pw"));
				user.setRep_name(this.rs.getString("rep_name"));
				user.setPhone((long) this.rs.getInt("phone"));
				user.setAgency_name(this.rs.getString("agency_name"));
				user.setAccountlock(this.rs.getInt("accountlock"));
			}
		} catch (SQLException var8) {
			var8.printStackTrace();
		} catch (Exception var9) {
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return user;
	}

	public AgentDTO getAgent2(int ea_no) {
		AgentDTO agent = null;

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.USER_GET2);
			this.pstmt.setInt(1, ea_no);
			this.rs = this.pstmt.executeQuery();
			if (this.rs.next()) {
				agent = new AgentDTO();
				agent.setEa_no(this.rs.getInt("ea_no"));
				agent.setId(this.rs.getString("id"));
				agent.setPw(this.rs.getString("pw"));
				agent.setRegi_number(this.rs.getLong("regi_number"));
				agent.setLicense_number(this.rs.getLong("license_number"));
				agent.setRegdate(this.rs.getDate("regdate"));
				agent.setRep_name(this.rs.getString("rep_name"));
				agent.setPostcode(this.rs.getInt("postcode"));
				agent.setAgency_name(this.rs.getString("agency_name"));
				agent.setRoadaddress(this.rs.getString("roadaddress"));
				agent.setJibunaddress(this.rs.getString("jibunaddress"));
				agent.setDetailaddress(this.rs.getString("detailaddress"));
				agent.setPhone((long) this.rs.getInt("phone"));
				agent.setReport(this.rs.getInt("report"));
				agent.setStatus(this.rs.getString("status"));
				agent.setF_count(this.rs.getInt("f_count"));
				agent.setAccountlock(this.rs.getInt("accountlock"));
			}
		} catch (SQLException var8) {
			var8.printStackTrace();
		} catch (Exception var9) {
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return agent;
	}

	public int registerCheck(String id) {
		AgentDTO user = null;

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.USER_GET);
			this.pstmt.setString(1, id);
			this.rs = this.pstmt.executeQuery();
			if (this.rs.next() || id.equals("")) {
				return 0;
			}

			return 1;
		} catch (SQLException var8) {
			var8.printStackTrace();
		} catch (Exception var9) {
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return -1;
	}

	public void deleteAgent(int ea_no) {
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.AGENT_DELETE);
			this.pstmt.setInt(1, ea_no);
			this.pstmt.executeUpdate();
		} catch (SQLException var7) {
			var7.printStackTrace();
		} catch (Exception var8) {
			var8.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

	}

	public void updateAgent(AgentDTO dto) {
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.AGENT_UPDATE);
			this.pstmt.setString(1, dto.getRep_name());
			this.pstmt.setString(2, dto.getAgency_name());
			this.pstmt.setInt(3, dto.getPostcode());
			this.pstmt.setString(4, dto.getRoadaddress());
			this.pstmt.setString(5, dto.getJibunaddress());
			this.pstmt.setString(6, dto.getDetailaddress());
			this.pstmt.setLong(7, dto.getPhone());
			this.pstmt.setInt(8, dto.getReport());
			this.pstmt.setString(9, dto.getStatus());
			this.pstmt.setInt(10, dto.getF_count());
			this.pstmt.setInt(11, dto.getAccountlock());
			this.pstmt.setString(12, dto.getId());
			this.pstmt.executeUpdate();
		} catch (SQLException var7) {
			var7.printStackTrace();
		} catch (Exception var8) {
			var8.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

	}

	public int insertUser(AgentDTO dto) {
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.USER_INSERT);
			this.pstmt.setString(1, dto.getId());
			this.pstmt.setString(2, dto.getPw());
			this.pstmt.setString(3, dto.getRep_name());
			this.pstmt.setInt(4, dto.getPostcode());
			this.pstmt.setString(5, dto.getRoadaddress());
			this.pstmt.setString(6, dto.getJibunaddress());
			this.pstmt.setString(7, dto.getDetailaddress());
			this.pstmt.setLong(8, dto.getPhone());
			this.pstmt.setString(9, dto.getAgency_name());
			this.pstmt.setLong(10, dto.getLicense_number());
			this.pstmt.setLong(11, dto.getRegi_number());
			int var4 = this.pstmt.executeUpdate();
			return var4;
		} catch (SQLException var8) {
			var8.printStackTrace();
		} catch (Exception var9) {
			var9.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return -1;
	}

	public List<AgentDTO> getAgentList() {
		List<AgentDTO> agentList = new ArrayList();

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.USER_LIST);
			this.rs = this.pstmt.executeQuery();

			while (this.rs.next()) {
				AgentDTO agent = new AgentDTO();
				agent.setEa_no(this.rs.getInt("ea_no"));
				agent.setRep_name(this.rs.getString("rep_name"));
				agent.setJibunaddress(this.rs.getString("Jibunaddress"));
				agent.setRegdate(this.rs.getDate("regdate"));
				agent.setReport(this.rs.getInt("report"));
				agent.setStatus(this.rs.getString("status"));
				agentList.add(agent);
			}
		} catch (SQLException var6) {
			var6.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return agentList;
	}

	public void loginFail(String id) {
		try {
			this.con = MyDBConnection.getConnection();
			String query = "SELECT f_count FROM ea_users WHERE id = ?";
			this.pstmt = this.con.prepareStatement(query);
			this.pstmt.setString(1, id);
			this.rs = this.pstmt.executeQuery();
			if (this.rs.next()) {
				int f_count = this.rs.getInt("f_count");
				if (f_count >= 5) {
					this.pstmt = this.con.prepareStatement(this.LOCK_ACCOUNT);
					this.pstmt.setString(1, id);
					this.pstmt.executeUpdate();
				} else {
					this.pstmt = this.con.prepareStatement(this.FAIL_COUNT_UPDATE);
					this.pstmt.setString(1, id);
					this.pstmt.executeUpdate();
				}
			}
		} catch (SQLException var7) {
			var7.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

	}

	public void loginreset(String id) {
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.FAIL_COUNT_RESET);
			this.pstmt.setString(1, id);
			this.pstmt.executeUpdate();
		} catch (SQLException var6) {
			var6.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

	}

	public List<AgentDTO> searchAgent(String searchCondition, String searchKeyword) {
		List<AgentDTO> agentList = new ArrayList();

		try {
			this.con = MyDBConnection.getConnection();
			if (searchCondition.equalsIgnoreCase("공인중개사명")) {
				System.out.println("공인중개사명");
				this.pstmt = this.con.prepareStatement(this.AGENT_LIST_N);
			} else if (searchCondition.equalsIgnoreCase("상태")) {
				System.out.println("상태");
				this.pstmt = this.con.prepareStatement(this.AGENT_LIST_A);
			}

			this.pstmt.setString(1, "%" + searchKeyword + "%");
			System.out.println(searchKeyword);
			this.rs = this.pstmt.executeQuery();

			while (this.rs.next()) {
				AgentDTO agent = new AgentDTO();
				agent.setEa_no(this.rs.getInt("ea_no"));
				agent.setRep_name(this.rs.getString("rep_name"));
				agent.setJibunaddress(this.rs.getString("Jibunaddress"));
				agent.setRegdate(this.rs.getDate("regdate"));
				agent.setReport(this.rs.getInt("report"));
				agent.setStatus(this.rs.getString("status"));
				agentList.add(agent);
			}
		} catch (SQLException var8) {
			var8.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return agentList;
	}

	public int all_agent() {
		int count = 0;

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.ALL_agentcount);
			this.rs = this.pstmt.executeQuery();
			if (this.rs.next()) {
				count = this.rs.getInt(1);
			}
		} catch (SQLException var6) {
			var6.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return count;
	}

	public void pwreset(int ea_no) {
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.PW_RESET);
			this.pstmt.setInt(1, ea_no);
			this.pstmt.executeUpdate();
		} catch (SQLException var6) {
			var6.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

	}
}