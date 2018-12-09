<%@ page import="com.oraclewdp.dd.model.Book" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书籍编辑</title>
<!-- 告诉浏览器不要缩放 -->
<!-- css控制样式 -->
<!-- 告诉浏览器不要缩放 --><!-- css控制样式 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" type="text/css" />
<link href="bower_components/bootswatch/dist/sketchy/bootstrap.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.custom-file-label::after {
	content: "浏览";
}
</style>
</head>
<body>
	<div class="container-fluid" style="width: 80%">
		<div class="row">
			<div class="col-md-12">
				<div class="card bg-light mb-3">
					<div class="card-body">
						<form method="post" autocomplete="off" action="doBookEdit" enctype="multipart/form-data">
							<%
								Book book = (Book) request.getAttribute("book");
							%>
							<input type="hidden" name="id" value="<%=book.getId()%>">
							<div class="form-group row">
								<label for="inputBid" class="col-sm-2 col-form-label text-right">大类名</label>
								<div class="col-sm-10">
									<select name="bid" class="form-control" id="inputBid">
									<option value="-1">--请选择大类--</option>
									</select>
								</div>
							</div>
									<div class="form-group row">
								<label for="inputSid" class="col-sm-2 col-form-label text-right">小类名</label>
								<div class="col-sm-10">
									<select name="sid" class="form-control" id="inputSid">

									</select>
								</div>
							</div>

							<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">书名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="书名" name="name" value="<%=book.getName()%>">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPrice" class="col-sm-2 col-form-label text-right" >价格</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputPrice" placeholder="价格" name="price" value="<%=book.getPrice()%>" >
								</div>
							</div>
							<div class="form-group row">
								<label for="inputAuthor" class="col-sm-2 col-form-label text-right">作者</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputAuthor" placeholder="作者" name="author" value="<%=book.getAuthor()%>" >
								</div>
							</div>
							<div class="form-group row">
								<label for="inputCbs" class="col-sm-2 col-form-label text-right" >出版社</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputCbs" placeholder="出版社" name="cbs" value="<%=book.getCbs()%>" >
								</div>
							</div>
							<div class="form-group row">
								<label for="inputCbDate" class="col-sm-2 col-form-label text-right">出版日期</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputCbDate" placeholder="出版日期" name="cbDate" value="<%=book.getCbDate()%>" >
								</div>
							</div>
							<div class="form-group row">
								<label for="inputDescri" class="col-sm-2 col-form-label text-right" >简介</label>
								<div class="col-sm-10">
									<textarea class="form-control" id="inputDescri" placeholder="简介" name="descri" ><%=book.getDescri()%></textarea>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPhoto" class="col-sm-2 col-form-label text-right">图片</label>
								<div class="col-sm-10">
									<!-- 让所有浏览器样式一致 -->
									<div class="custom-file">
										<input type="file" class="custom-file-input" id="inputPhoto" name="photo" aria-describedby="inputGroupFileAddon04" >
										 <label class="custom-file-label" for="inputPhoto">请选择文件</label>
									</div>
									<img src="upload/<%=book.getPhoto()%>" style="height: 200px">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">修改</button>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
	<!-- js提供行为 -->
	<script type="text/javascript" src="bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
	<script type="text/javascript">
	/*	var xhr = new XMLHttpRequest();//得先有一个对象
		xhr.open("GET", "findAllBigType");//初始化HTTP请求参数，类似开始拨号
		xhr.send();//发送一个HTTP请求
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {//请求完全接收到了，类似电话打通
				if (xhr.status == 200) {//请求成功了，类似有人接电话
					//console.dir(xhr.responseText);//是string字符串
					eval(xhr.responseText);
				}
			}
		}*/
		function fillSel(types){
			for (var i = 0; i < types.length; i++) {
				var op = new Option(types[i].name,types[i].id);
				document.getElementById("inputBid").appendChild(op);
			}
            $("#inputBid").val('<%=request.getAttribute("bid")%>');
            $("#inputBid").trigger("change");
			}
		function fillSmallSel(types){
			document.getElementById("inputSid").innerHTML="";
			for (var i = 0; i < types.length; i++) {
				var op = new Option(types[i].name,types[i].id);
				document.getElementById("inputSid").appendChild(op);
			}
            $("#inputSid").val('<%=book.getSid()%>');
			}
		console.dir($);
			$.ajax({
					url:"findAllBigType",
					dataType:"jsonp",
					jsonpCallback:"fillSel"
				});
			$("#inputBid").change(function(){
				$.ajax({
					data:"bid="+$(this).val(),
					url:"findAllSmallType",
					dataType:"jsonp",
					jsonpCallback:"fillSmallSel"
				});
				})
	</script>
	<script type="text/javascript">
	//对那个日历框添加日历控件
	$("#inputCbDate").datepicker({
	    format: 'yyyy-mm-dd',//修改日期格式
	    language: 'zh-CN',//修改界面语言
	    autoclose: true,//让自动关闭
	    defaultViewDate:{
		year:new Date().getFullYear()-18
		    }
	});
	</script>
</body>
</html>