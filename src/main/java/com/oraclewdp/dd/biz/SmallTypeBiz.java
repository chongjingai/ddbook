package com.oraclewdp.dd.biz;

import java.util.List;

import com.oraclewdp.dd.model.SmallType;

public interface SmallTypeBiz {

	Boolean save(SmallType smallType);


	List<SmallType> findAllByBid(int bid);

    int findBidById(int sid);
}
