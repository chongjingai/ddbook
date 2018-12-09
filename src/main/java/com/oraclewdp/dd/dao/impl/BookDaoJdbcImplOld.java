package com.oraclewdp.dd.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.oraclewdp.dd.dao.BookDao;
import com.oraclewdp.dd.model.Book;
import com.oraclewdp.dd.util.DBUtils;
import com.oraclewdp.dd.util.PageConstant;


public class BookDaoJdbcImplOld implements BookDao {

	public BookDaoJdbcImplOld() {
		super();
	}

	@Override
	public boolean save(Book book) {
		Connection conn = null;
		PreparedStatement stmt = null;
		//注册驱动Class.forName会引起类加载，类加载会执行静态代码块，在静态代码块会执行注册
		try {//创建连接
			//1打电话要先找到对方电话号并打通、创建数据库连接
			//2.向对方说话、insert
			//3.对方给出回应、给出回应
			//4.向对方说不说了、关闭流
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement("insert into t_book values (default,?,?,?,?,?,?,?,?)");
			stmt.setString(1, book.getName());
			stmt.setDouble(2, book.getPrice());
			stmt.setString(3, book.getAuthor());
			stmt.setString(4, book.getCbs());
			stmt.setDate(5, new Date(book.getCbDate().getTime()));
			stmt.setString(6, book.getDescri());
			stmt.setInt(7, book.getSid());
			stmt.setString(8, book.getPhoto());
			//executeUpdate因为是添加数据所以是更新
			int ret = stmt.executeUpdate();
			if (ret > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.free(stmt, conn);
		}
		return false;

	}

	@Override
	public List<Book> findAll(int currentPage,String name,int sid) {
		Connection conn = null;
		Statement stmt =null;
		ResultSet rs = null;
		try {
			conn = DBUtils.getConnection();
			stmt=conn.createStatement();
//			(currentPage-1)前面多少页， *每页大小， +1当前页第一行的位置， -1索引从0开始， +PageConstant.PAGE_SIZE每页大小
//			limit后面必须有空格，必须有
//			String sql="Select * from t_book order by id desc limit ";
//			不限定name也不限定sid
//			if ((name==null||name.equals(""))&&sid==-1) {
//				//什么都不执行
//			}
////			限定name不限定sid
//			if ((name!=null&&!name.equals(""))&&sid==-1) {
//				sql+=" where name like '%"+name+"%' ";
//			}
////			不限定name限定sid
//			if ((name==null||name.equals(""))&&sid!=-1) {
//				sql+=" where sid="+sid;
//			}
////			限定name限定sid
//			if ((name!=null&&!name.equals(""))&&sid!=-1) {
//				sql+=" where name like '%"+name+"%' and sid="+sid;
//			}
			String sql="Select * from t_book where 1=1 ";
			if (name!=null&&!name.equals("")) {
				sql+=" and name like '%"+name+"%' ";
			}
			if (sid!=-1) {
				sql+=" and sid="+sid;
			}
			sql+=" order by id desc limit "+((currentPage-1)*PageConstant.PAGE_SIZE+1-1)+","+PageConstant.PAGE_SIZE;
			rs=stmt.executeQuery(sql);
			List<Book> ls = new ArrayList<>();
			while(rs.next()) {
				Book book=new Book();
				book.setId(rs.getInt("id"));
				book.setName(rs.getString("name"));
				book.setPrice(rs.getDouble("price"));
				book.setAuthor(rs.getString("author"));
				book.setCbs(rs.getString("cbs"));
				book.setCbDate(rs.getDate("cbDate"));
				book.setDescri(rs.getString("descri"));
				book.setSid(rs.getInt("sid"));
				book.setPhoto(rs.getString("photo"));
				ls.add(book);
			}
			return ls;
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBUtils.free(rs, stmt, conn);
		}
		return null;
	}

	@Override
	public int total(String name,int sid) {
		Connection conn = null;
		Statement stmt =null;
		ResultSet rs = null;
		try {
			conn = DBUtils.getConnection();
			stmt=conn.createStatement();
			String sql="Select count(*) from t_book where 1=1 ";
			if(name!=null&&!name.equals("")) {
				sql+=" and name like '%"+name+"%' ";
			}
			if (sid!=-1) {
				sql+=" and sid="+sid;
			}
			rs=stmt.executeQuery(sql);			
			if(rs.next()) {
				return rs.getInt(1);
			}		
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBUtils.free(rs, stmt, conn);
		}
		return 0;
	}

	@Override
	public int del(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		//注册驱动Class.forName会引起类加载，类加载会执行静态代码块，在静态代码块会执行注册
		try {//创建连接
			//1打电话要先找到对方电话号并打通、创建数据库连接
			//2.向对方说话、insert
			//3.对方给出回应、给出回应
			//4.向对方说不说了、关闭流
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement("Delete from t_book where id="+id);
			
			//executeUpdate因为是删除数据所以是更新
			int ret = stmt.executeUpdate();
				return ret;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.free(stmt, conn);
		}
		return 0;
	}

	@Override
	public Book find(int id) {
		Connection conn = null;
		Statement stmt =null;
		ResultSet rs = null;
		try {
			conn = DBUtils.getConnection();
			stmt=conn.createStatement();

			String sql="Select * from t_book where id= "+id;

			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				Book book=new Book();
				book.setId(rs.getInt("id"));
				book.setName(rs.getString("name"));
				book.setPrice(rs.getDouble("price"));
				book.setAuthor(rs.getString("author"));
				book.setCbs(rs.getString("cbs"));
				book.setCbDate(rs.getDate("cbDate"));
				book.setDescri(rs.getString("descri"));
				book.setSid(rs.getInt("sid"));
				book.setPhoto(rs.getString("photo"));
				return book;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBUtils.free(rs, stmt, conn);
		}
		return null;
	}

	@Override
	public boolean update(Book book) {
		Connection conn = null;
		PreparedStatement stmt = null;
		//注册驱动Class.forName会引起类加载，类加载会执行静态代码块，在静态代码块会执行注册
		try {
			if(book.getPhoto()==null){
				conn = DBUtils.getConnection();
				stmt = conn.prepareStatement("UPDATE  t_book set name=?,price=?,author=?,cbs=?,cbDate=?,descri=?,sid=? where id=?");
				stmt.setString(1, book.getName());
				stmt.setDouble(2, book.getPrice());
				stmt.setString(3, book.getAuthor());
				stmt.setString(4, book.getCbs());
				stmt.setDate(5, new Date(book.getCbDate().getTime()));
				stmt.setString(6, book.getDescri());
				stmt.setInt(7, book.getSid());
				stmt.setInt(8,book.getId());
			}else{
				conn = DBUtils.getConnection();
				stmt = conn.prepareStatement("UPDATE  t_book set name=?,price=?,author=?,cbs=?,cbDate=?,descri=?,sid=?,photo=? where id=?");
				stmt.setString(1, book.getName());
				stmt.setDouble(2, book.getPrice());
				stmt.setString(3, book.getAuthor());
				stmt.setString(4, book.getCbs());
				stmt.setDate(5, new Date(book.getCbDate().getTime()));
				stmt.setString(6, book.getDescri());
				stmt.setInt(7, book.getSid());
				stmt.setString(8, book.getPhoto());
				stmt.setInt(9,book.getId());
			}

			//executeUpdate因为是添加数据所以是更新
			int ret = stmt.executeUpdate();
			if (ret > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.free(stmt, conn);
		}
		return false;
	}


}
