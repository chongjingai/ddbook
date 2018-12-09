package com.oraclewdp.dd.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.*;

import com.oraclewdp.dd.biz.AdminBiz;
import com.oraclewdp.dd.biz.impl.AdminBizImpl;
import com.oraclewdp.dd.model.Admin;
import com.oraclewdp.dd.util.MyBeanUtils;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取参数值
		Admin admin = new Admin();
		MyBeanUtils.populate(admin, request.getParameterMap());
		String vcode = request.getParameter("vcode");
		String serverVcode = (String) request.getSession().getAttribute("validateCode");
		/* if (!serverVcode.equalsIgnoreCase(vcode)){
			request.setAttribute("msg","验证码错误");
			request.setAttribute("admin", admin);
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
//		进行校验
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		Validator validator=factory.getValidator();
//		违反的约束
		Set<ConstraintViolation<Admin>> validatResult=validator.validate(admin);
		if (validatResult.size()>0){//验证没有通过
			Map<String,String> errors=new HashMap<>();
			for (ConstraintViolation<Admin> cv:
				 validatResult) {
				errors.put(cv.getPropertyPath().toString(),cv.getMessage());
			}
			request.setAttribute("errors",errors);
			request.setAttribute("admin", admin);
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}  */
		Map<String,String> errors=new HashMap<>();
		if (!serverVcode.equalsIgnoreCase(vcode)){
			errors.put("vcode","验证码错误");
		}
		//		进行校验
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		Validator validator=factory.getValidator();
//		违反的约束
		Set<ConstraintViolation<Admin>> validatResult=validator.validate(admin);
		if (validatResult.size()>0){//验证没有通过
			for (ConstraintViolation<Admin> cv: validatResult) {
				errors.put(cv.getPropertyPath().toString(),cv.getMessage());
			}
		}
		if (errors.size()>0){
			request.setAttribute("errors",errors);
			request.setAttribute("admin", admin);
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}

		//到数据库比对
		AdminBiz adminBiz=new AdminBizImpl();
		boolean ret=adminBiz.findAdmin(admin);
		//根据比对数据给用户返回一个界面
		if (ret) {
		    //在session范围中记录登录成功
			request.getSession().setAttribute("haslogined",true);
			request.getRequestDispatcher("main.jsp").forward(request, response);
		} else {
			request.setAttribute("admin", admin);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
	}

}
