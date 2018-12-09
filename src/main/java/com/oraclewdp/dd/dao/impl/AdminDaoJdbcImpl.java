package com.oraclewdp.dd.dao.impl;

import com.oraclewdp.dd.dao.AdminDao;
import com.oraclewdp.dd.model.Admin;
import com.oraclewdp.dd.model.BigType;
import com.oraclewdp.dd.util.DBUtils;
import com.oraclewdp.dd.util.MD5Util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AdminDaoJdbcImpl implements AdminDao {
    @Override
    public boolean adminNameAndPwd(Admin admin) {
        Connection conn = null;
        PreparedStatement stmt =null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
           /* String sql="Select * from t_admin where name=? and pwd=?";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1,admin.getName());
//            对数据库的值比对加密，用户输的值加密后和数据库比对
            stmt.setString(2, MD5Util.getEncryptedPwd(admin.getPwd()));
            rs=stmt.executeQuery();
            if(rs.next()) {
              return true;
            }*/
            String sql="Select pwd from t_admin where name=?";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1,admin.getName());

            rs=stmt.executeQuery();
            if(rs.next()) {
                String stPwd=rs.getString(1);
                return MD5Util.validPasswd(admin.getPwd(),stPwd);
            }
            } catch (Exception e) {
            // TODO: handle exception
        }finally {
            DBUtils.free(rs, stmt, conn);
        }
        return false;
    }
}
