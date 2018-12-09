package com.oraclewdp.dd.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
//因为有许多重复的代码所以把重复的代码放到一个工具类中
public class DBUtils {
	private static Properties pro;
	static {
		 pro = new Properties();
		try {
			pro.load(DBUtils.class.getResourceAsStream("pro.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
static {
	try {//注册驱动
		Class.forName(pro.getProperty("driverClass"));
	} catch (ClassNotFoundException e1) {
		e1.printStackTrace();
	}
}
public static Connection getConnection() {
	try {
		return DriverManager.getConnection(pro.getProperty("url"),pro.getProperty("user"),pro.getProperty("pwd"));
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return null;
	
}
public static void free(ResultSet rs, Statement stmt, Connection conn) {
	if (rs!=null) {
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	if (stmt!=null) {
		try {
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	if (conn!=null) {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
//重写free方法
public static void free(Statement stmt, Connection conn) {
	if (stmt!=null) {
		try {
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	if (conn!=null) {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

}
