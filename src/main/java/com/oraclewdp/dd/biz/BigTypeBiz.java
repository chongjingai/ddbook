package com.oraclewdp.dd.biz;

import java.util.List;

import com.oraclewdp.dd.model.BigType;

public interface BigTypeBiz {

	Boolean save(String name);

	List<BigType> findAllBigType();

}
