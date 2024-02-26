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
	<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"><link
				rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
				integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw=="
				crossorigin="anonymous" />
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
				<a href="Treatment/TypeList.jsp">
				#시술 종류</a>
			</li>
			<li>
				<a href="../mvcboard/list.do">#시술 후기</a>
			</li>
			<li>
				<a href="#" onclick="checkLoginAndRedirect()">#시술 예약</a>
			</li>
		</ul>
		<ul class="nav navbar-nav">
			<c:if test="${not empty sessionScope.UserName}">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">${sessionScope.UserName} 님 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="MyProfile/MyPage.jsp">My profile</a></li>
						<li><a href="logout">Logout</a></li>
					</ul>
				</li>
			</c:if>
			<c:if test="${empty sessionScope.UserName}">
				<li>
					<a href="#" data-toggle="modal" data-target="#loginModal">LOGIN</a> <!-- 로그인 버튼 클릭 시 모달 띄우기 -->
				</li>
			</c:if>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</div>
<!-- /.container -->
</nav>
<div class="modal fade" tabindex="-1" id="loginModal">
	<div class="modal-dialog" role="document" style="position: absolute; left: 50%; top: 40%; transform: translate(-50%, -50%); width: 20% ">
		<div class="modal-content" style="padding: 20px; height: 100%">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" style="color: black; font-size: 30px; text-align: center;">로그인</h4>
			</div>
			<form action="../login" class="form" method="post" onsubmit="return validateForm(this);">
				<div class="modal-body" style="padding: 20px">
					<div class="form-group" style="padding-bottom: 20px">
						<label style="color: black; font-size: 18px">아이디</label>
						<input type="text" class="form-control" name="user_id" id="user_id">
					</div>
					<div class="form-group">
						<label style="color: black; font-size: 18px">비밀번호</label>
						<input type="password" class="form-control" name="password" id="password">
					</div>
					<span class="forgot-password" style="color: black"><a href="#">아이디/비밀번호 찾기</a></span>
				</div>
				<div class="modal-footer" style="padding: 30px">
					<button type="submit" class="btn btn-primary btn-lg btn-block" style="background-color: darkgray; color: white; border: none; border-radius: 10px;">로그인</button>
					<button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='modal.jsp'" style="background-color: dodgerblue; color: white; border: none; border-radius: 10px;">회원가입</button>
				</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->
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
				<a href="Treatment/TypeList.jsp">
					<img src="img/eyes.png" alt="">
				</a>
			</li>
			<li class="col-md-3">
				<a href="Treatment/TypeList.jsp">
					<img src="img/lip3.png" alt="">
				</a>
			</li>
			<li class="col-md-3">
				<a href="Treatment/TypeList.jsp">
					<img src="img/lip.png" alt="">
				</a>
			</li>
			<li class="col-md-3">
				<a href="Treatment/TypeList.jsp">
					<img src="img/lip2.png" alt="">
				</a>
			</li>
			<li class="col-md-3">
				<a href="Treatment/TypeList.jsp">
					<img src="img/nose1.png" alt="">
				</a>
			</li>
			<li class="col-md-3">
				<a href="Treatment/TypeList.jsp">
					<img src="img/nose2.png" alt="">
				</a>
			</li>
			<li class="col-md-3">
				<a href="Treatment/TypeList.jsp">
					<img src="img/nose3.png" alt="">
				</a>
			</li>
			<li class="col-md-3">
				<a href="Treatment/TypeList.jsp">
					<img src="img/breast1.png" alt="">
				</a>
			</li>
			<li class="col-md-3">
				<a href="Treatment/TypeList.jsp">
					<img src="img/total.png" alt="">
				</a>
			</li>
			<li class="col-md-3">
				<a href="Treatment/TypeList.jsp">
					<img src="img/total2.png" alt="">
				</a>
			</li>
			<li class="col-md-3">
				<a href="Treatment/TypeList.jsp">
					<img src="img/total3.png" alt="">
				</a>
			</li>
			<li class="col-md-3">
				<a href="Treatment/TypeList.jsp">
					<img src="img/breast2.png" alt="">
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
<script>
	$(document).ready(function (){
		let errMsg = "${LoginErrMsg}";

		console.log("err확인",errMsg);
		if(errMsg != ""){
			$('#loginModal').modal('show')
		}
	})

	function validateForm(form) {
		var id = form.id.value;
		var password = form.password.value;

		if (id == "" || password == "") {
			alert("ID와 비밀번호를 입력해주세요.");
			return false;
		}
		return true; // 유효성 검사 통과
	}
</script>
<%-- 에러 메시지를 표시하는 부분 --%>
<% String loginErrMsg = (String) request.getAttribute("LoginErrMsg"); %>
<% if (loginErrMsg != null) { %>
<script>
	alert('<%= loginErrMsg %>');
</script>
<% } %>
<script>
	function checkLoginAndRedirect() {
		var isLoggedIn = <%= session.getAttribute("UserName") != null %>;
		if (!isLoggedIn) {
			alert("로그인 후에 예약 가능합니다.");
		} else {
			location.href = '../Reservation/Appoint.do';
		}
	}
</script>
</body>
</html>