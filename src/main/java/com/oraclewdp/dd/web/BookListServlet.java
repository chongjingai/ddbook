package com.oraclewdp.dd.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oraclewdp.dd.biz.BookBiz;
import com.oraclewdp.dd.biz.impl.BookBizImpl;
import com.oraclewdp.dd.model.Book;
import com.oraclewdp.dd.util.PageConstant;


@WebServlet("/bookList")
public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BookListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1
		String strCurrentPage=request.getParameter("currentPage");
		if (strCurrentPage==null) {//判断用户第一次有没有看哪一页没有就默认第一页
			strCurrentPage="1";
		} 
		int currentPage=Integer.parseInt(strCurrentPage);
		//获取name，sid
		String name=request.getParameter("name");
		String strSid = request.getParameter("sid")==null?"-1":request.getParameter("sid");
		int sid=Integer.parseInt(strSid);
		System.out.println("------------sid"+sid);
		
		String strBid = request.getParameter("bid")==null?"-1":request.getParameter("bid");
		int bid=Integer.parseInt(strBid);
		System.out.println("-------------bid"+bid);
		//2
		BookBiz bookBiz= new BookBizImpl();
		List<Book> ls = bookBiz.findAll(currentPage,name,sid);
		//查出总行数，然后算出总页数
		int totalRow = bookBiz.totalRow(name,sid);
		System.out.println("----------------totalRow"+totalRow);
		int totalPage = totalRow%PageConstant.PAGE_SIZE==0?totalRow/PageConstant.PAGE_SIZE:totalRow/PageConstant.PAGE_SIZE+1;
		
		//3
		request.setAttribute("currentPage",currentPage);
		request.setAttribute("totalPage",totalPage);
		request.setAttribute("ls",ls);
		request.setAttribute("bid", bid);
		request.setAttribute("sid", sid);
		request.setAttribute("name", name);
		request.getRequestDispatcher("bookList.jsp").forward(request, response);
		
		
		
	}

}
