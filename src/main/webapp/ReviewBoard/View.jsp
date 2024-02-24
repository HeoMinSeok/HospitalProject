<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>PONI</title>
<!-- Bootstrap Core CSS -->
	<link href="../css/view.css" rel="stylesheet" type="text/css" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
		  integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
	<script src="../js/passModal.js"></script>
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
<nav> <!--최상단의 배너-->
	<div class="menu">
		<a href="../index.jsp" style="margin-left: 15px">PONI</a>
		<ul class="homeMenu">
			<c:if test="${not empty sessionScope.UserName and sessionScope.UserId eq dto.patIdFk}">
				<li><a href="#" class="li">수정하기</a></li>
				<li><a href="../pass?mode=delete&rbNum=${ param.rbNum }" class="li">삭제하기</a></li>
				<li><a href="#" class="li">#</a></li>
			</c:if>
		</ul>
	</div>
</nav>
<section>
	<div class="container" id="one">
		<div class="first">
			<p class="viewNum">NO. ${ dto.rbNum }</p>
			<img src="../uploads/${ dto.rbSfile }" alt="이미지">
		</div>

		<div class="second">
			<br>
			<p class="gray viewSection">
				<a href="../index.jsp">홈</a> &gt;
				<a href="#" onclick="goBack();">후기 게시판</a> &gt;
				상세보기
			</p>
			<script>
				function goBack() {
					window.history.back();
				}
			</script>
			<div id="fifth">
				<div class="emojiright">
					<div class="title-date-wrapper">
						<p class="viewTitle">제목 : ${ dto.rbTitle }</p>
						<p class="writeDate">작성일 : ${ dto.rbPostDate}</p>
					</div>
					<p></p>
				</div>
				<div id="heart2">
					<a href="#"><i class="far fa-heart" id="heart3"></i></a>
					&nbsp;<span class="rec_count"></span>
				</div>
			</div>
			<div class="productdetail">
				<span>작성자 : ${ dto.patNameFk }</span>
			</div>

			<div class="card" style="width: auto">
				<div class="tools">
					<div class="circle">
						<span class="red box"></span>
					</div>
					<div class="circle">
						<span class="yellow box"></span>
					</div>
					<div class="circle">
						<span class="green box"></span>
					</div>
				</div>
				<div class="tools">${ dto.rbContents }</div>
				<div class="card__content">
				</div>
			</div>

			<p class="reviewnav">리뷰</p>

			<div class="Allcomment"> <!--모든 댓글 내용을 담아내는 div 태그-->
				<div class="comment"> <!-- comment class는 각각 하나의 댓글을 담아냄 -->
					<span class="id">coffee_lover</span>
					<span class="ment">너무 맛있어요!</span>
					<button class="deletebutton">삭제</button>
					<a href="#" class="commentheart"><i class="far fa-heart"></i></a>
				</div>

				<div class="comment">
					<span class="id">CHOCO7</span>
					<span class="ment">오늘도 화이트 초콜릿 모카를 마시러 갑니다</span>
					<button class="deletebutton">삭제</button>
					<a href="#" class="commentheart"><i class="far fa-heart hearts"></i></a>
				</div>

				<div class="comment">
					<span class="id">legend_dev</span>
					<span class="ment">진짜 화이트 초콜릿 모카는 전설이다.
                        진짜 화이트 초콜릿 모카는 전설이다.
                        진짜 화이트 초콜릿 모카는 전설이다.
                    </span>
					<button class="deletebutton">삭제</button>
					<a href="#" class="commentheart"><i class="far fa-heart"></i></a>
				</div>
			</div>
			<input text="" placeholder="리뷰를 입력해주세요" class="reviewcomment" onkeyup="if(window.event.keyCode===13){test()}"> <!--후반부에 구현할 댓글 입력을 위한 input 태그-->
		</div>
	</div>
</section>

<!-- Footer -->
<!-- jQuery -->
<script src="../js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>
<!-- Plugin JavaScript -->
<script src="../js/jquery.easing.min.js"></script>
<!-- Contact JavaScript -->
<script src="../js/validate.js"></script>
<!-- Custom Theme JavaScript -->
<script src="../js/theme.js"></script>
<%-- passModal JS--%>
<script src="../js/passModal.js"></script>
</body>
</html>