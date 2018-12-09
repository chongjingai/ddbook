<%@page import="java.util.List"%>
<%@page import="com.oraclewdp.dd.model.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书籍列表</title>
<!-- 告诉浏览器不要缩放 -->
<!-- css控制样式 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 控制主题 -->
<link rel="stylesheet" type="text/css" id="cs" />
	<!--导入小图标-->
	<link rel="stylesheet" type="text/css" href="bower_components/fontawesome/web-fonts-with-css/css/fontawesome-all.css">
<!-- jquery -->
<script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
<!-- 不要忘记要用jquery.cookie就要导入他 -->
<script type="text/javascript" src="bower_components/jquery.cookie/jquery.cookie.js"></script>
<script type="text/javascript">
	//这里切记不要等文档加载完毕，如果你等到文档加载完毕还是两次绘制，不要$(function(){})
	if ($.cookie("selectTheme")) {//如果用户之前设置过主题，就还是用用户设置的主题
		$("#cs").attr("href","bower_components/bootswatch/dist/" + $.cookie("selectTheme")+ "/bootstrap.css");

	} else {//如果没有设置主题，就用默认主题
		$("#cs").attr("href","bower_components/bootswatch/dist/sketchy/bootstrap.css");
	}
</script>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">

					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="navbar-toggler-icon"></span>
					</button>
					<a class="navbar-brand" href="#">Brand</a>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="navbar-nav">
							<li class="nav-item active"><a class="nav-link" href="#">Link <span class="sr-only">(current)</span></a></li>
							<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
							<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown
									link</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else
										here</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Separated link</a>
								</div></li>
						</ul>
						<form class="form-inline">
							<input class="form-control mr-sm-2" type="text" />
							<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
						</form>
						<ul class="navbar-nav ml-md-auto">
							<li class="nav-item active"><a class="nav-link" href="#"> <a class="nav-link" href="javascript:void(0)"> <select id="select_Opt">
											<option>sketchy</option>
											<option>cerulean</option>
											<option>cosmo</option>
											<option>cyborg</option>
											<option>darkly</option>
											<option>flatly</option>
											<option>journal</option>
									</select>
								</a>
							</a></li>
							<li class="nav-item dropdown"><a class="nav-link fa fa-window-close fa-2x " href="exit.jsp" id="navbarDropdownMenuLink">

							</a>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card border-success">
				
				<!-- card-header -->
				<div class="card-header">
					<form class="form-inline" action="bookList" method="post" id="searchFrm">
						  <label class="sr-only" for="inlineFormInputName2">书名</label>
						  <input type="text" class="form-control mb-2 mr-sm-2" id="inputName" placeholder="书名" name="name" value="<%=request.getParameter("name")==null?"":request.getParameter("name") %>">
						<label class="sr-only" for="inlineFormInputGroupUsername2">大类</label>
						  <div class="input-group mb-2 mr-sm-2">
						    <select class="form-control" id="inputBid" name="bid">
						    <option value="-1">--请选择--</option>
						    </select>
						  </div>
						  
						  <label class="sr-only" for="inlineFormInputGroupUsername2">小类</label>
						  <div class="input-group mb-2 mr-sm-2">
						    <select class="form-control" id="inputSid" name="sid">
						    <option value="-1">--请选择--</option>
						    </select>
						  </div>
						
						  <button type="submit" class="btn btn-primary mb-2">搜索</button>
						</form>
				</div>
				
					<!-- card body -->
					<div class="card_body" style="padding: 0px">
						<div class="col-md-12" style="padding: 0px">
							<table class="table table-sm table-hover" style="margin-bottom: 0px">
								<thead>
									<tr>
										<th>#</th>
										<th>书名</th>
										<th>价格</th>
										<th>作者</th>
										<th>出版社</th>
										<th>出版日期</th>
										<th>简介</th>
										<th>小类</th>
										<th>图片</th>
										<th>修改</th>
									</tr>
								</thead>
								<tbody>
									<%
										List<Book> ls=(List<Book>)request.getAttribute("ls");
										for(Book book:ls) {
									%>
									<tr>
										<td><%=book.getId()%></td>
										<td><%=book.getName()%></td>
										<td><%=book.getPrice()%></td>
										<td><%=book.getAuthor()%></td>
										<td><%=book.getCbs()%></td>
										<td><%=book.getCbDate()%></td>
										<td><%=book.getDescri()%></td>
										<td><%=book.getSid()%></td>
										<td><img style="height: 200px" src="upload/<%=book.getPhoto()%>"></td>
										<td>
										<a href="#modal-container-638535" data-toggle="modal" onclick="window.delId='<%=book.getId()%>'" class="fa fa-trash fa-1x" title="删除"></a>
										<a class="fa fa-edit fa-1x" title="修改" href="toBookEdit?id=<%=book.getId()%>"></a>
										</td>
									</tr>
									<%
										}
									%>
									
								</tbody>
							</table>
						</div>
					</div>
					
					<!-- card-footer -->
					<div class="card-footer" style="padding:0px">
					<nav>
												<ul class="pagination" style="margin-bottom:0px">
													
													<%
													//获取总页数
													int totalPage=(Integer)request.getAttribute("totalPage");
													//获取当前页
													int currentPage=(Integer)request.getAttribute("currentPage");
													if(currentPage==1){
														%>
														<li class="page-item disabled"><a class="page-link" href="#">前一页</a></li>	
													<%
													}else{
														%>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage-1%>">前一页</a></li>
													<% 
													}
													%>
													<!-- 
													1.如果总页<=5
														有几页就显示几页
													2.否则
														2.1如果当前页P<=3
															1 2 3 4 ...t
														2.2否则如果p<=t-3
															1... p-1 p p+1 ...t
														2.3否则
															1... t-3 t-2 t-1 t
													 -->
													<%
													
													if(totalPage<=5){//总页数小于等于5
														for(int i=1;i<=totalPage;i++){
													%>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=i%>"><%=i%></a></li>
														<% 
														}
													}else if(currentPage<=3){//当前页小于等于3
														%>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=1">1</a></li>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=2">2</a></li>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=3">3</a></li>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=4">4</a></li>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage%>">...<%=totalPage%></a></li>
														<% 
													}else if(currentPage<=totalPage-3){//当前页小于等于总页数-3
														%>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=1">1...</a></li>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage-1%>"><%=currentPage-1%></a></li>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage%>"><%=currentPage%></a></li>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage+1%>"><%=currentPage+1%></a></li>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage%>">...<%=totalPage%></a></li>
														<% 
													}else{
														%>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=1">1...</a></li>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage-3%>"><%=totalPage-3%></a></li>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage-2%>"><%=totalPage-2%></a></li>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage-1%>"><%=totalPage-1%></a></li>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage%>"><%=totalPage%></a></li>
														<% 
													}
													%>
													
													<!-- 如果是最后一页，点击无效，否则当前页加1 -->
													<% 
													if(currentPage==totalPage){
														%>
														<li class="page-item disabled"><a class="page-link" href="#">下一页</a></li>
													<%
													}else{
														%>
														<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage+1%>">下一页</a></li>
													<% 
													}
													%>
													
												</ul>
											</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		<!-- 删除 -->
					<div class="modal fade" id="modal-container-638535" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								确认删除
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							你想明白生命的意义吗，你想真正的活着吗？
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary" onclick="exeDel(event)">
								Yes
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								No
							</button>
						</div>
					</div>
					
				</div>
			</div>
					<!-- end -->
	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#select_Opt").change(
					function(evt) {
						//var a=evt.target.options[evt.target.selectedIndex];
						//console.dir(a);
						//$("#cs").attr("href","bower_components/bootswatch/dist/"+a.value+"/bootstrap.css");
						$("#cs").attr("href","bower_components/bootswatch/dist/"+ $(evt.target).val()+ "/bootstrap.css");
						//把用户之前设置的主题存到cookie中
						$.cookie("selectTheme", $(evt.target).val(), {
							expires : 7
						});
					});
			$("#select_Opt").val($.cookie("selectTheme"));
			$('a[href="bookList?currentPage=<%=currentPage%>"]').parent("li").addClass("active");

			});
		function fillSel(types){
			for (var i = 0; i < types.length; i++) {
				var op = new Option(types[i].name,types[i].id);
				document.getElementById("inputBid").appendChild(op);
			}
			$("#inputBid").val('<%=request.getAttribute("bid")%>');
			$("#inputBid").trigger("change");
			}
		function fillSmallSel(types){
			document.getElementById("inputSid").innerHTML='<option value="-1">--请选择--</option>';
			for (var i = 0; i < types.length; i++) {
				var op = new Option(types[i].name,types[i].id);
				document.getElementById("inputSid").appendChild(op);
			}
			$("#inputSid").val('<%=request.getAttribute("sid")%>');
				}
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
				});
			//分页链接不带值解决
			$('a[class="page-link"][href^="bookList?currentPage="]').click(function() {
				$(this).attr("href",$(this).attr("href")+"&"+$("#searchFrm").serialize());
			});
			function exeDel(event){
				window.location.href="bookDel?id="+window.delId;
				}
	</script>
</body>
</html>