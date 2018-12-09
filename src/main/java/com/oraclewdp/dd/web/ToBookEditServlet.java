package com.oraclewdp.dd.web;

import com.oraclewdp.dd.biz.BookBiz;
import com.oraclewdp.dd.biz.SmallTypeBiz;
import com.oraclewdp.dd.biz.impl.BookBizImpl;
import com.oraclewdp.dd.biz.impl.SmallTypeBizImpl;
import com.oraclewdp.dd.model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ToBookEditServlet",value="/toBookEdit")
@MultipartConfig
public class ToBookEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //获取参数
        String strId = request.getParameter("id");
        int id = Integer.parseInt(strId);
      /*  String strBid = request.getParameter("bid");
        int bid = Integer.parseInt(strBid); */
//        调取业务层
        BookBiz bookBiz = new BookBizImpl();
        Book book = bookBiz.findById(id);
        SmallTypeBiz smallTypeBiz = new SmallTypeBizImpl();
       int bid = smallTypeBiz.findBidById(book.getSid());

        request.setAttribute("book",book);
        request.setAttribute("bid",bid);
        request.getRequestDispatcher("/bookEdit.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
