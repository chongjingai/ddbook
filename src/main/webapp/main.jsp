<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 告诉浏览器不要缩放 -->
<!-- css控制样式 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 控制主题 -->
<link rel="stylesheet" type="text/css" id="cs" />
<!-- jquery -->
<script type="text/javascript" src="bower_components/jquery/dist/jquery.slim.js"></script>
<!-- 不要忘记要用jquery.cookie就要导入他 -->
<script type="text/javascript" src="bower_components/jquery.cookie/jquery.cookie.js"></script>
<script type="text/javascript">
//这里切记不要等文档加载完毕，如果你等到文档加载完毕还是两次绘制，不要$(function(){})
		if ($.cookie("selectTheme")) {//如果用户之前设置过主题，就还是用用户设置的主题
			$("#cs").attr("href","bower_components/bootswatch/dist/"+$.cookie("selectTheme")+"/bootstrap.css");
			
		}else{//如果没有设置主题，就用默认主题
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
							<li class="nav-item active"><a class="nav-link" href="#">
							<a class="nav-link" href="javascript:void(0)">
							 <select id="select_Opt">
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
							<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown
									link</a>
								<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else
										here</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Separated link</a>
								</div></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="carousel slide" id="carousel-900273">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-900273" class="active"></li>
						<li data-slide-to="1" data-target="#carousel-900273"></li>
						<li data-slide-to="2" data-target="#carousel-900273"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" alt="Carousel Bootstrap First" src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
							<div class="carousel-caption">
								<h4>First Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies
									vehicula ut id elit.</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Second" src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies
									vehicula ut id elit.</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Third" src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
							<div class="carousel-caption">
								<h4>Third Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies
									vehicula ut id elit.</p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carousel-900273" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a>
					<a class="carousel-control-next" href="#carousel-900273" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div id="card-625528">
					<div class="card">
						<div class="card-header">
							<a class="card-link" data-toggle="collapse" data-parent="#card-625528" href="#card-element-48000">Collapsible Group Item #1</a>
						</div>
						<div id="card-element-48000" class="collapse show">
							<div class="card-body">Anim pariatur cliche...</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<a class="collapsed card-link" data-toggle="collapse" data-parent="#card-625528" href="#card-element-352537">Collapsible Group Item #2</a>
						</div>
						<div id="card-element-352537" class="collapse">
							<div class="card-body">Anim pariatur cliche...</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script type="text/javascript">
	$(function() {
		$("#select_Opt").change(function(evt) {
			//var a=evt.target.options[evt.target.selectedIndex];
			//console.dir(a);
			//$("#cs").attr("href","bower_components/bootswatch/dist/"+a.value+"/bootstrap.css");
			$("#cs").attr("href","bower_components/bootswatch/dist/"+$(evt.target).val()+"/bootstrap.css");
			//把用户之前设置的主题存到cookie中
			$.cookie("selectTheme", $(evt.target).val(),{ expires: 7 });
			});
		$("#select_Opt").val($.cookie("selectTheme"));
		
	});
</script>
</body>
</html>