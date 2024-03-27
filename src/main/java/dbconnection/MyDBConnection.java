package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MyDBConnection {
	public static Connection getConnection() throws SQLException {
		Connection con = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException var2) {
			System.out.println("예외 발생");
		}

		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SherlockHomes?serverTimezone=UTC", "root",
				"my1234");
		System.out.println("접속 성공");
		return con;
	}

	public static void close(ResultSet rs, PreparedStatement pstmt, Connection con) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException var6) {
				var6.printStackTrace();
			}
		}

		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException var5) {
				var5.printStackTrace();
			}
		}

		if (con != null) {
			try {
				con.close();
			} catch (SQLException var4) {
				var4.printStackTrace();
			}
		}

	}
}