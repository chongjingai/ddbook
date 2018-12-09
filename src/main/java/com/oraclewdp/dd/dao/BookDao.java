package com.oraclewdp.dd.dao;

import java.util.List;

import com.oraclewdp.dd.model.Book;

public interface BookDao {

	boolean save(Book book);

	List<Book> findAll(int currentPage, String name, int sid);

	int total(String name, int sid);

	int del(int id);


    Book find(int id);

    boolean update(Book book);
}
