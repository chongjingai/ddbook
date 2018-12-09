package com.oraclewdp.dd.web;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.oraclewdp.dd.biz.BookBiz;
import com.oraclewdp.dd.biz.impl.BookBizImpl;
import com.oraclewdp.dd.model.Book;
import com.oraclewdp.dd.util.MyBeanUtils;
import com.oraclewdp.dd.util.StringEscapeUtils;

@WebServlet("/bookType")
@MultipartConfig
public class BookTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookTypeServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Book book=new Book();
		MyBeanUtils.populate(book, request.getParameterMap(), "yyyy-MM-dd");
		Part part=request.getPart("photo");
		String newfile=null;
		if (part.getHeader("Content-Disposition").contains("; filename=")) {
			if (part.getSubmittedFileName()!=null&&!part.getSubmittedFileName().equals("")) {
				String seg = part.getSubmittedFileName().substring(part.getSubmittedFileName().lastIndexOf(".")+1);
				 newfile = UUID.randomUUID()+"."+seg;
				part.write(request.getServletContext().getRealPath("/upload/"+newfile));
			}
		}
		book.setPhoto(newfile);
		//进行转义避免xll攻击
		book.setDescri(StringEscapeUtils.htmlEncode(book.getDescri()));
		System.out.println("-----------"+book);
		BookBiz bookBiz=new BookBizImpl();
		boolean ret=bookBiz.saveBook(book);
		
		if (ret) {
			response.sendRedirect("main.jsp");
		} else {
			 request.setAttribute("book", book);
			 request.getRequestDispatcher("bookAdd.jsp").forward(request, response);
		}
	}

}
