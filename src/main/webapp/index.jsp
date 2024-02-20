<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>PONI 성형외과</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/theme.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700,400italic,700italic" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
<!-- Navigation -->
<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
<div class="container">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
		<i class="fa fa-bars"></i>
		</button>
		<a class="navbar-brand page-scroll" href="index.jsp">
		PONI </a>
	</div>
	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse navbar-right navbar-main-collapse">
		<ul class="nav navbar-nav">
			<li>
			<a href="index.jsp">메인</a>
			</li>
			<li>
			<a href="WayToComeView.jsp">#찾아오는 길</a>
			</li>
			<li>
			<a href="page-sample.html">
				#시술 종류</a>
			</li>
			<li>
			<a href="contact.html">#시술 예약</a>
			</li>
			<li>
				<a href="/ReviewBoard/BoardMain.jsp">#시술 후기</a>
			</li>
			<c:if test="${not empty sessionScope.UserName}">
				<li>
					<a>${sessionScope.UserName} 님</a>
				</li>
				<li>
					<a href="logout">로그아웃</a>
				</li>
			</c:if>
			<!-- 세션에 사용자 정보가 없으면 로그인 버튼을 표시 -->
			<c:if test="${empty sessionScope.UserName}">
				<li>
					<a href="LoginModal.jsp">로그인</a>
				</li>
			</c:if>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</div>
<!-- /.container -->
</nav>
<!-- Intro Header -->
<header class="intro">
<div class="intro-body">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<h1 class="brand-heading">PONI </h1>
				<p class="intro-text">
					JSP-PROJECT BY 민석 수빈 지호
				</p>
				<a href="#about" class="btn btn-circle page-scroll">
				<i class="fa fa-angle-double-down animated"></i>
				</a>
			</div>
		</div>
	</div>
</div>
</header>
<!-- About Section -->
<section id="about">
<div class="container content-section text-center">
	<div class="row">
		<h2>병원 관리 프로그램</h2>
		<div class="col-lg-8 col-lg-offset-2">
			<p>
				Praesent ac dignissim diam. Aliquam lobortis elit et sapien eleifend, at sollicitudin metus elementum. Morbi imperdiet id ipsum at tristique. Nam suscipit tristique sem, <a href="#">quis</a> laoreet leo. Maecenas eget ante ipsum.
			</p>
			<p>
				<a href="#" class="btnghost"><i class="fa fa-download"></i> Curriculum Vitae</a>
			</p>
		</div>
	</div>
</div>
</section>
<section id="portfolio">
<div class="gallery">
	<ul>
		<li class="col-md-3">
		<a href="portfolio-item.html">
		<img src="http://unsplash.it/680/380?random=1" alt="">
		</a>
		</li>
		<li class="col-md-3">
		<a href="portfolio-item.html">
		<img src="http://unsplash.it/680/380?random=2" alt="">
		</a>
		</li>
		<li class="col-md-3">
		<a href="portfolio-item.html">
		<img src="http://unsplash.it/680/380?random=3" alt="">
		</a>
		</li>
		<li class="col-md-3">
		<a class="image" href="portfolio-item.html">
		<img src="http://unsplash.it/680/380?random=4" alt="">
		</a>
		</li>
		<li class="col-md-3">
		<a href="portfolio-item.html">
		<img src="http://unsplash.it/680/380?random=5" alt="">
		</a>
		</li>
		<li class="col-md-3">
		<a href="portfolio-item.html">
		<img src="http://unsplash.it/680/380?random=6" alt="">
		</a>
		</li>
		<li class="col-md-3">
		<a href="portfolio-item.html">
		<img src="http://unsplash.it/680/380?random=7" alt="">
		</a>
		</li>
		<li class="col-md-3">
		<a href="portfolio-item.html">
		<img src="http://unsplash.it/680/380?random=8" alt="">
		</a>
		</li>
				<li class="col-md-3">
		<a href="portfolio-item.html">
		<img src="http://unsplash.it/680/380?random=10" alt="">
		</a>
		</li>
		<li class="col-md-3">
		<a href="portfolio-item.html">
		<img src="http://unsplash.it/680/380?random=11" alt="">
		</a>
		</li>
		<li class="col-md-3">
		<a href="portfolio-item.html">
		<img src="http://unsplash.it/680/380?random=12" alt="">
		</a>
		</li>
		<li class="col-md-3">
		<a href="portfolio-item.html">
		<img src="http://unsplash.it/680/380?random=13" alt="">
		</a>
		</li>
	</ul>
</div>
</section>
<!-- Contact Section -->
<section id="contact">
<div class="container content-section text-center">
	<div class="row">
		<div class="col-lg-8 col-lg-offset-2">
			<h2>Manager's Message</h2>
			<p>
				문의 사항 아래 메일로 남겨주세요.
			</p>
			<p>
				<i><a href="mailto:minzino4825@gmail.com" style="border-bottom:1px dashed #ccc;">minzino4825@gmail.com</a></i>
			</p>
			<p>
				<i><a href="mailto:jiho7213@gmail.com" style="border-bottom:1px dashed #ccc;">jiho7213@gmail.com</a></i>
			</p>
			<p>
				<i><a href="#" style="border-bottom:1px dashed #ccc;">#</a></i>
			</p>
			<ul class="list-inline banner-social-buttons">
				<li>
				<a href="https://www.instagram.com/aderminddo?igsh=YWh4cDRoN3Vqc2tj&utm_source=qr" class="btn btnghost btn-lg"><i class="fa fa-instagram fa-fw"></i><span class="network-name">INSTA</span></a>
				</li>
				<li>
				<a href="https://www.youtube.com/@poni-ul5bi" class="btn btnghost btn-lg"><i class="fa fa-youtube-play fa-fw"></i><span class="network-name">YOUTUBE</span></a>
				</li>
				<li>
				<a href="https://github.com/HeoMinSeok/" class="btn btnghost btn-lg"><i class="fa fa-github fa-fw"></i><span class="network-name">GITHUB</span></a>
				</li>
			</ul>
		</div>
	</div>
</div>
</section>
<!-- Footer -->
<footer>
<div class="container text-center">
	<p class="credits">
		Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>

	</p>
</div>
</footer>
<!-- jQuery -->
<script src="js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<!-- Plugin JavaScript -->
<script src="js/jquery.easing.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="js/theme.js"></script>
</body>
</html>