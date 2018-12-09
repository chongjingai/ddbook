package com.oraclewdp.dd.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.oraclewdp.dd.biz.BigTypeBiz;
import com.oraclewdp.dd.biz.impl.BigTypeBizImpl;
import com.oraclewdp.dd.model.BigType;


@WebServlet("/findAllBigType")
public class FindAllBigTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public FindAllBigTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		找到所有type然后传给客户端
		
		String callBack=request.getParameter("callback");
		
//		调业务层
		BigTypeBiz bigTypeBiz=new BigTypeBizImpl();
		List<BigType> ls=bigTypeBiz.findAllBigType();
//		js
//		告诉客户端发送js
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
//		把java的List转为js的数组
		JSONArray jsonArray = new JSONArray(ls);
		out.println(callBack+"("+jsonArray.toString()+")");
		out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
