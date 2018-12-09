package com.oraclewdp.dd.biz.impl;

import java.util.List;

import com.oraclewdp.dd.biz.BookBiz;
import com.oraclewdp.dd.dao.BookDao;
import com.oraclewdp.dd.dao.impl.BookDaoJdbcImplOld;
import com.oraclewdp.dd.model.Book;

public class BookBizImpl implements BookBiz {
	@Override
	public boolean saveBook(Book book) {
		BookDao bookDao = new BookDaoJdbcImplOld();
		return bookDao.save(book);
	}

	@Override
	public List<Book> findAll(int currentPage,String name,int sid) {
		BookDao bookDao = new BookDaoJdbcImplOld();
		return bookDao.findAll(currentPage,name,sid);
	}

	@Override
	public int totalRow(String name,int sid) {
		BookDao bookDao = new BookDaoJdbcImplOld();
		return bookDao.total(name,sid);
	}

	@Override
	public int delById(int id) {
		BookDao bookDao = new BookDaoJdbcImplOld();
		return bookDao.del(id);
	}

    @Override
    public Book findById(int id) {
        BookDao bookDao = new BookDaoJdbcImplOld();
        return bookDao.find(id);
    }

	@Override
	public boolean update(Book book) {
		BookDao bookDao = new BookDaoJdbcImplOld();
		return bookDao.update(book);
	}

}
