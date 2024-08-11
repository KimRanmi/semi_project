package com.cm.common.sql;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {

	public static Connection getConnection() {
		Connection conn = null;
		Properties prop = new Properties();
		try {
			String path = JDBCTemplate.class.getResource("driver.properties").getPath();
			prop.load(new FileReader(path));
			Class.forName(prop.getProperty("driver"));
			String url = prop.getProperty("url");
			String user = prop.getProperty("username");
			String pw = prop.getProperty("userpw");
			conn = DriverManager.getConnection(url,user,pw);
			// conn.setAutoCommit(false);
            System.out.println("Connection established and auto-commit disabled.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
				System.out.println("Transaction committed.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}public static void rollback(Connection conn){
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
				System.out.println("Transaction rolled back.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection conn) {
		try {
			if(conn != null && conn.isClosed() == false) {
				conn.close();
				System.out.println("Connection closed.");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	// Statement와 PreparedStatement 모두 사용 가능(다형성)
	public static void close(Statement stmt) {
		try {
			if(stmt != null && stmt.isClosed() == false) {
				stmt.close();
			      System.out.println("Statement closed.");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			if(rs!= null && rs.isClosed() == false) {
				rs.close();
				System.out.println("ResultSet closed.");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}



