package com.oraclewdp.dd.biz.impl;

import java.util.List;

import com.oraclewdp.dd.biz.SmallTypeBiz;
import com.oraclewdp.dd.dao.SmallTypeDao;
import com.oraclewdp.dd.dao.impl.SmallTypeDaoImpl;
import com.oraclewdp.dd.model.SmallType;

public class SmallTypeBizImpl implements SmallTypeBiz {

	@Override
	public Boolean save(SmallType smallType) {
		SmallTypeDao smallTypeDao=new SmallTypeDaoImpl();
		return smallTypeDao.save(smallType);
	}

	@Override
	public List<SmallType> findAllByBid(int bid) {
		SmallTypeDao smallTypeDao=new SmallTypeDaoImpl();
		return smallTypeDao.findAllByBid(bid);
	}

	@Override
	public int findBidById(int sid) {
		SmallTypeDao smallTypeDao=new SmallTypeDaoImpl();
		return smallTypeDao.findBidById(sid);
	}

}
