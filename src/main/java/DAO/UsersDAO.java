package DAO;

import DTO.UsersDTO;
import dbconnection.MyDBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsersDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String USER_GET = "select * from users where id=?";
	private String USER_GET2 = "select * from users where no=?";
	private String USER_LIST = "select * from users";
	private String USER_INSERT = "INSERT INTO users (id, pw, name, phone, birth, region) values(?,?,?,?,?,?)";
	private String USER_UPDATE = "update users set name=?, phone=?, birth=?, region=?, role=?, f_count=?, accountlock=? where id=?";
	private String USER_DELETE = "delete from users where no=?";
	private String FAIL_COUNT_UPDATE = "UPDATE users SET f_count = f_count + 1 WHERE id = ?";
	private String FAIL_COUNT_RESET = "UPDATE users SET f_count = 0 WHERE id = ?";
	private String LOCK_ACCOUNT = "UPDATE users SET accountlock = 1 WHERE id = ?";
	private String PW_RESET = "UPDATE users SET pw = 'qwe123!@#' WHERE no = ?";
	private String USER_LIST_T = "select * from users where id like ? order by no desc";
	private String USER_LIST_C = "select * from users where name like ? order by no desc";
	private String ALL_usercount = "SELECT COUNT(*) AS total FROM users;";
	private String today_usercount = "SELECT COUNT(*) AS today_count FROM users WHERE DATE(regdate) = CURDATE();";
	private String ALL_agentcount = "SELECT COUNT(*) AS total FROM ea_users;";
	private String today_agentcount = "SELECT COUNT(*) AS today_count FROM ea_users WHERE DATE(regdate) = CURDATE();";
	private String ALL_estatecount = "SELECT COUNT(*) AS total FROM estate;";
	private String today_estatecount = "SELECT COUNT(*) AS today_count FROM estate WHERE DATE(regdate) = CURDATE();";
	private static final int ROWS_PER_PAGE = 10;

	public UsersDTO getUser(String id) {
		UsersDTO user = null;

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.USER_GET);
			this.pstmt.setString(1, id);
			this.rs = this.pstmt.executeQuery();
			if (this.rs.next()) {
				user = new UsersDTO();
				user.setId(this.rs.getString("id"));
				user.setPw(this.rs.getString("pw"));
				user.setName(this.rs.getString("name"));
				user.setPhone(this.rs.getLong("phone"));
				user.setRole(this.rs.getString("role"));
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

	public UsersDTO getUser2(int no) {
		UsersDTO user = null;

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.USER_GET2);
			this.pstmt.setInt(1, no);
			this.rs = this.pstmt.executeQuery();
			if (this.rs.next()) {
				user = new UsersDTO();
				user.setNo(this.rs.getInt("no"));
				user.setId(this.rs.getString("id"));
				user.setPw(this.rs.getString("pw"));
				user.setRegdate(this.rs.getDate("regdate"));
				user.setName(this.rs.getString("name"));
				user.setPhone(this.rs.getLong("phone"));
				user.setBirth(this.rs.getInt("birth"));
				user.setRegion(this.rs.getString("region"));
				user.setRole(this.rs.getString("role"));
				user.setF_count(this.rs.getInt("f_count"));
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

	public int registerCheck(String id) {
		UsersDTO user = null;

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.USER_GET);
			this.pstmt.setString(1, id);
			this.rs = this.pstmt.executeQuery();
			if (!this.rs.next() && !id.equals("")) {
				return 1;
			}

			return 0;
		} catch (SQLException var8) {
			var8.printStackTrace();
		} catch (Exception var9) {
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return -1;
	}

	public void deleteUser(int no) {
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.USER_DELETE);
			this.pstmt.setInt(1, no);
			this.pstmt.executeUpdate();
		} catch (SQLException var7) {
			var7.printStackTrace();
		} catch (Exception var8) {
			var8.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

	}

	public void updateUser(UsersDTO dto) {
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.USER_UPDATE);
			this.pstmt.setString(1, dto.getName());
			this.pstmt.setLong(2, dto.getPhone());
			this.pstmt.setInt(3, dto.getBirth());
			this.pstmt.setString(4, dto.getRegion());
			this.pstmt.setString(5, dto.getRole());
			this.pstmt.setInt(6, dto.getF_count());
			this.pstmt.setInt(7, dto.getAccountlock());
			this.pstmt.setString(8, dto.getId());
			this.pstmt.executeUpdate();
		} catch (SQLException var7) {
			var7.printStackTrace();
		} catch (Exception var8) {
			var8.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

	}

	public int insertUser(UsersDTO dto) {
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.USER_INSERT);
			this.pstmt.setString(1, dto.getId());
			this.pstmt.setString(2, dto.getPw());
			this.pstmt.setString(3, dto.getName());
			this.pstmt.setLong(4, dto.getPhone());
			this.pstmt.setInt(5, dto.getBirth());
			this.pstmt.setString(6, dto.getRegion());
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

	public void insertUser1(UsersDTO dto) {
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.USER_INSERT);
			this.pstmt.setString(1, dto.getId());
			this.pstmt.setString(2, dto.getPw());
			this.pstmt.setString(3, dto.getName());
			this.pstmt.setLong(4, dto.getPhone());
			this.pstmt.setInt(5, dto.getBirth());
			this.pstmt.setString(6, dto.getRegion());
			this.pstmt.executeUpdate();
		} catch (SQLException var7) {
			var7.printStackTrace();
		} catch (Exception var8) {
			var8.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

	}

	public List<UsersDTO> getUserList() {
		List<UsersDTO> userList = new ArrayList();

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.USER_LIST);
			this.rs = this.pstmt.executeQuery();

			while (this.rs.next()) {
				UsersDTO user = new UsersDTO();
				user.setNo(this.rs.getInt("no"));
				user.setId(this.rs.getString("id"));
				user.setName(this.rs.getString("name"));
				user.setRegion(this.rs.getString("region"));
				user.setRegdate(this.rs.getDate("regdate"));
				user.setBirth(this.rs.getInt("birth"));
				user.setRole(this.rs.getString("role"));
				userList.add(user);
			}
		} catch (SQLException var6) {
			var6.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return userList;
	}

	public List<UsersDTO> searchUser(String searchCondition, String searchKeyword) {
		List<UsersDTO> userList = new ArrayList();

		try {
			this.con = MyDBConnection.getConnection();
			if (searchCondition.equalsIgnoreCase("아이디")) {
				System.out.println("아이디로 검색");
				this.pstmt = this.con.prepareStatement(this.USER_LIST_T);
			} else if (searchCondition.equalsIgnoreCase("이름")) {
				System.out.println("이름으로 검색");
				this.pstmt = this.con.prepareStatement(this.USER_LIST_C);
			}

			this.pstmt.setString(1, "%" + searchKeyword + "%");
			this.rs = this.pstmt.executeQuery();

			while (this.rs.next()) {
				UsersDTO user = new UsersDTO();
				user.setNo(this.rs.getInt("no"));
				user.setId(this.rs.getString("id"));
				user.setName(this.rs.getString("name"));
				user.setRegion(this.rs.getString("region"));
				user.setRegdate(this.rs.getDate("regdate"));
				user.setBirth(this.rs.getInt("birth"));
				user.setRole(this.rs.getString("role"));
				userList.add(user);
			}
		} catch (SQLException var8) {
			var8.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

		return userList;
	}

	public void loginFail(String id) {
		try {
			this.con = MyDBConnection.getConnection();
			String query = "SELECT f_count FROM users WHERE id = ?";
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

	public void pwreset(int no) {
		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.PW_RESET);
			this.pstmt.setInt(1, no);
			this.pstmt.executeUpdate();
		} catch (SQLException var6) {
			var6.printStackTrace();
		} finally {
			MyDBConnection.close(this.rs, this.pstmt, this.con);
		}

	}

	public int all_user() {
		int count = 0;

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.ALL_usercount);
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

	public int today_user() {
		int count = 0;

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.today_usercount);
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

	public int today_agent() {
		int count = 0;

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.today_agentcount);
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

	public int all_estate() {
		int count = 0;

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.ALL_estatecount);
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

	public int today_estate() {
		int count = 0;

		try {
			this.con = MyDBConnection.getConnection();
			this.pstmt = this.con.prepareStatement(this.today_estatecount);
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
}