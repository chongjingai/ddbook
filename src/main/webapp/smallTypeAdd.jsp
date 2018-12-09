<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 告诉浏览器不要缩放 -->
<!-- css控制样式 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="bower_components/bootswatch/dist/sketchy/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container-fluid" style="width: 80%">
		<div class="row">
			<div class="col-md-12">
				<div class="card bg-light mb-3">
					<div class="card-body">
						<form method="post" autocomplete="off" action="smallTypeAdd">

							<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">大类名</label>
								<div class="col-sm-10">
									<select name="bid" class="form-control" id="inputBid">

									</select>
								</div>
							</div>

							<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">小类名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="小类名" name="name">
								</div>
							</div>

							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">添加</button>
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
			}
		console.dir($);
			$.ajax({
					url:"findAllBigType",
					dataType:"jsonp",
					jsonpCallback:"fillSel"
				});
	</script>
</body>
</html>