package com.oraclewdp.dd.biz.impl;

import java.util.List;

import com.oraclewdp.dd.biz.BigTypeBiz;
import com.oraclewdp.dd.dao.BigTypeDao;
import com.oraclewdp.dd.dao.impl.BigTypeDaoImpl;
import com.oraclewdp.dd.model.BigType;

public class BigTypeBizImpl implements BigTypeBiz {

	@Override
	public Boolean save(String name) {
		BigTypeDao bigTypeDao=new BigTypeDaoImpl();
		return bigTypeDao.save(name);
	}

	@Override
	public List<BigType> findAllBigType() {
		BigTypeDao bigTypeDao=new BigTypeDaoImpl();
		return bigTypeDao.findAll();
	}

}
