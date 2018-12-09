package com.oraclewdp.dd.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.oraclewdp.dd.dao.BigTypeDao;
import com.oraclewdp.dd.model.BigType;
import com.oraclewdp.dd.util.DBUtils;

public class BigTypeDaoImpl implements BigTypeDao {

	@Override
	public Boolean save(String name) {
		Connection conn= null;
		PreparedStatement stmt = null;
		try {
			conn = DBUtils.getConnection();
			String sql="insert into t_big_type values(default,?)";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, name);
			int ret=stmt.executeUpdate();
			if (ret>0) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBUtils.free(stmt,conn);
		}
		return false;
	}

	@Override
	public List<BigType> findAll() {
		Connection conn = null;
		Statement stmt =null;
		ResultSet rs = null;
		try {
			conn = DBUtils.getConnection();
			stmt=conn.createStatement();
			String sql="Select * from t_big_type";
			rs=stmt.executeQuery(sql);
			List<BigType> ls = new ArrayList<>();
			while(rs.next()) {
				BigType bigType=new BigType();
				bigType.setId(rs.getInt("id"));
				bigType.setName(rs.getString("name"));
				ls.add(bigType);
			}
			return ls;
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBUtils.free(rs, stmt, conn);
		}
		return null;
	}

}
