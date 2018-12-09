package com.oraclewdp.dd.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oraclewdp.dd.biz.BigTypeBiz;
import com.oraclewdp.dd.biz.impl.BigTypeBizImpl;
@WebServlet("/bigTypeAdd")
public class BigTypeAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public BigTypeAddServlet() {
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		BigTypeBiz bigTypeBiz=new BigTypeBizImpl();
		Boolean ret=bigTypeBiz.save(name);
		if (ret) {
			response.sendRedirect("main.jsp");
		} else {
			request.setAttribute("name", name);
			request.getRequestDispatcher("bigTypeAdd.jsp").forward(request, response);
		}
	}

}
