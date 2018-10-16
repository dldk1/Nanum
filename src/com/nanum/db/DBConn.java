package com.nanum.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	public static Connection getConnection() throws Exception {

		String url = "jdbc:mysql://localhost:3306/nanum?useUnicode=true&characterEncoding=UTF-8";
		//String url = "jdbc:mysql://localhost:3306/nanum";
		String driver = "com.mysql.jdbc.Driver";
		String user = "root";
		String pw = "apmsetup";

		// 드라이버 로딩(jar 파일 로드)
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, user, pw);
		
		System.out.println("Database에 연결되었습니다.\n");
		return conn;
	}
}