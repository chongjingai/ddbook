package com.oraclewdp.dd.biz.impl;

import com.oraclewdp.dd.biz.AdminBiz;
import com.oraclewdp.dd.dao.AdminDao;
import com.oraclewdp.dd.dao.impl.AdminDaoJdbcImpl;
import com.oraclewdp.dd.model.Admin;

public class AdminBizImpl implements AdminBiz {
    @Override
    public boolean findAdmin(Admin admin) {
        AdminDao adminDao = new AdminDaoJdbcImpl();
        return adminDao.adminNameAndPwd(admin);
    }
}
