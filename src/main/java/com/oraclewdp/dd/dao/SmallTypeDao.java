package com.oraclewdp.dd.dao;

import java.util.List;

import com.oraclewdp.dd.model.SmallType;

public interface SmallTypeDao {

	Boolean save(SmallType smallType);

	List<SmallType> findAllByBid(int bid);

	int findBidById(int sid);
}
