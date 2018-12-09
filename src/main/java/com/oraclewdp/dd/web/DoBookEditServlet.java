package com.oraclewdp.dd.web;

import com.oraclewdp.dd.biz.BookBiz;
import com.oraclewdp.dd.biz.impl.BookBizImpl;
import com.oraclewdp.dd.model.Book;
import com.oraclewdp.dd.util.MyBeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "DoBookEditServlet",value = "/doBookEdit")
@MultipartConfig
public class DoBookEditServlet extends HttpServlet {
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
        BookBiz bookBiz=new BookBizImpl();
        boolean ret=bookBiz.update(book);

if(ret){
    response.sendRedirect("bookList");
}else{
    request.setAttribute("book", book);
    //失败回填
    request.setAttribute("bid",request.getParameter("bid"));
    request.getRequestDispatcher("/bookEdit.jsp").forward(request, response);
}

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
