package com.oraclewdp.dd.biz;

import java.util.List;

import com.oraclewdp.dd.model.Book;

public interface BookBiz {

	boolean saveBook(Book book);

	List<Book> findAll(int currentPage, String name, int sid);

	int totalRow(String name, int sid);

	int delById(int id);

    Book findById(int id);

    boolean update(Book book);
}
