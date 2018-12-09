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

import com.oraclewdp.dd.biz.SmallTypeBiz;
import com.oraclewdp.dd.biz.impl.SmallTypeBizImpl;
import com.oraclewdp.dd.model.SmallType;


@WebServlet("/findAllSmallType")
public class FindAllSmallTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public FindAllSmallTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		找到所有type然后传给客户端
		
		String callBack=request.getParameter("callback");
		String strBid = request.getParameter("bid");
		int bid = Integer.parseInt(strBid);
//		调业务层
		SmallTypeBiz smallTypeBiz=new SmallTypeBizImpl();
		List<SmallType> ls = smallTypeBiz.findAllByBid(bid);
		
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
