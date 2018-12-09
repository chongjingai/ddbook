<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.oraclewdp.dd.model.Admin" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 告诉浏览器不要缩放 --><!-- css控制样式 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" type="text/css" />
<link href="bower_components/bootswatch/dist/sketchy/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container-fluid" style="width: 80%">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<%--
							Map<String,String> errors= (Map<String, String>) request.getAttribute("errors");
							if (errors!=null){
								Set<String> keySet=errors.keySet();
								for (String key:
									 keySet) {
									out.print(key+"------------->"+errors.get(key));
								}
							}
						--%>

						<form method="post" autocomplete="off" action="login" id="loginForm">
							<%
								Admin admin =(Admin) request.getAttribute("admin");
												if(admin !=null){
							%>
							<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right" >用户名</label>
								<div class="col-sm-10">
									<!--如果有错误，input高亮显示-->
									<%
										Map<String,String> errors= (Map<String, String>) request.getAttribute("errors");
									if (errors!=null&&errors.get("name")!=null){
										%>
									<input type="text" class="form-control is-invalid" id="inputName" placeholder="用户名" name="name" value="<%=admin.getName()==null?"":admin.getName()==null?"":admin.getName()%>">
									<div class="invalid-feedback">
										<%=errors.get("name")%>
									</div>
									<%
									}else {
									%>
									<input type="text" class="form-control" id="inputName" placeholder="用户名" name="name" value="<%=admin.getName()==null?"":admin.getName()%>">
									<%
									}
									%>

								</div>
							</div>
							<div class="form-group row">
								<label for="inputPwd" class="col-sm-2 col-form-label text-right" >密码</label>
								<div class="col-sm-10">
									<%
									if (errors!=null&&errors.get("pwd")!=null){
									    %>
									<input type="password" class="form-control is-invalid" id="inputPwd" placeholder="密码" name="pwd" >
									<div class="invalid-feedback">
										<%=errors.get("pwd")%>
									</div>
									<%
									}else {
									    %>
									<input type="password" class="form-control " id="inputPwd" placeholder="密码" name="pwd" >
									<%
									}
									%>

								</div>
							</div>
							<div class="form-group row">
								<label for="inputPwd" class="col-sm-2 col-form-label text-right" >验证码</label>
								<div class="col-sm-5">
									<%
										if (errors!=null&&errors.get("vcode")!=null){
											%>
									<input type="text" class="form-control is-invalid" id="inputVcode" placeholder="验证码" name="vcode"  >
									<div class="invalid-feedback">
										<%=errors.get("vcode")%>
									</div>
										<%
										}else {
										   %>
									<input type="text" class="form-control" id="inputVcode" placeholder="验证码" name="vcode" >
									<%
										}
									%>

								</div>
								<div class="col-5">
									<img src="/vcode.png" id="vcodeImg" title="点击更换验证码">
								</div>
                                <div class="valid-feedback">
								<%
									if(request.getAttribute("msg")!=null){
								%>
								<%=request.getAttribute("msg")%>
								<%
									}
								%>
							</div>
							</div>

							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">登录</button>
								</div>
							</div>
							<%
							}else{
								%>
								<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">用户名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="用户名" name="name">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPwd" class="col-sm-2 col-form-label text-right">密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="inputPwd" placeholder="密码" name="pwd">
								</div>
							</div>

							<div class="form-group row">
								<label for="inputPwd" class="col-sm-2 col-form-label text-right" >验证码</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="inputVcode" placeholder="验证码" name="vcode" >
								</div>
								<div class="col-5">
									<img src="vcode.png" id="vcodeImg" title="点击更换验证码">
								</div>
                                <div class="valid-feedback">
                                    <%
                                        if(request.getAttribute("msg")!=null){
                                    %>
                                   <%=request.getAttribute("msg")%>
									<%
                                        }
                                    %>
                                </div>
							</div>
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">登录</button>
								</div>
							</div>
								<%
							}
							%>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="bower_components/jquery/dist/jquery.slim.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#vcodeImg").click(function () {
                $(this).attr("src","vcode.png?t="+Math.random());
            });
        });
    </script>
    <%--先导入js--%>
	<script type="text/javascript" src="bower_components/jquery-validation/dist/jquery.validate.js"></script>
    <%--添加文件判断--%>
    <script type="text/javascript" src="bower_components/jquery-validation/dist/additional-methods.js"></script>
    <%--中文默认--%>
    <script type="text/javascript" src="bower_components/jquery-validation/src/localization/messages_zh.js"></script>
	<script type="text/javascript">
        $(function () {
            $("#loginForm").validate({
                rules:{//验证规则
                    name:{
                        required:true,
                        maxlength:20,
						minlength:2
                    },
                    pwd:{
                        required:true,
                        maxlength:20,
                        minlength:2
                    },
                    vcode:{
                        required:true,
                        maxlength:4,
                        minlength:4
                    }
                },
                messages:{//验证不通过应该显示的消息
                    name:{
                        required:"必须填写",
                        maxlength:"最多20个字符",
                        minlength:"最少2个字符"
                    },
                    pwd:{
                        required:"必须填写",
                        maxlength:"最多20个字符",
                        minlength:"最少2个字符"
                    },
                    vcode:{
                        required:"必须填写",
                        maxlength:"最多4个字符",
                        minlength:"最少4个字符"
                    }
                },
                errorElement:"div",
                errorClass:"invalid-feedback",
                highlight: function(element, errorClass, validClass) {//高亮显示
                    $(element).addClass("is-invalid").removeClass(validClass);
                    // $(element.form).find("label[for=" + element.id + "]")
                    //     .addClass(errorClass);
                },
                unhighlight: function(element, errorClass, validClass) {//取消高亮
                    $(element).removeClass("is-invalid").addClass(validClass);
                    // $(element.form).find("label[for=" + element.id + "]")
                    //     .removeClass(errorClass);
                },
                //更改高亮样式
                validClass:"is-valid"

            });
        });
	</script>
</body>
</html>