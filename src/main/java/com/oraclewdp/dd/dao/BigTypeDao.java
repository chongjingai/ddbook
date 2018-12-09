package com.oraclewdp.dd.dao;

import java.util.List;

import com.oraclewdp.dd.model.BigType;

public interface BigTypeDao {

	Boolean save(String name);

	List<BigType> findAll();

}
