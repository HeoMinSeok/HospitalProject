<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>찾아오는 길</title>
  <!-- Bootstrap Core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <link href="css/theme.css" rel="stylesheet">
  <!-- Custom Fonts -->
  <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700,400italic,700italic" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=426ff63ac72aefc2fdaa9b4f997c68a1&libraries=services"></script>
  <script src="https://kit.fontawesome.com/98b30ceabb.js" crossorigin="anonymous"></script>
  <style>
    .w-50{
      width: 25%;
    }
  </style>
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
          <a href="#">
            #시술 종류</a>
        </li>
        <li>
          <a href="../mvcboard/list.do">#시술 후기</a>
        </li>
      </ul>
      <ul class="nav navbar-nav">
        <c:if test="${not empty sessionScope.UserName}">
          <li>
            <a href="#">#시술 예약</a>
          </li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">${sessionScope.UserName} 님 <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="#">My profile</a></li>
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
      <input type="hidden" id="redirectURLInput" name="redirectURL" value="" />
      <form action="/login" class="form" method="post" onsubmit="return validateForm(this);">
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
          <h1 class="brand-heading">Way To Come</h1>
          <p class="intro-text">
            찾아 오는 길
          </p>
          <a href="#single-project" class="btn btn-circle page-scroll">
            <i class="fa fa-angle-double-down animated"></i>
          </a>
        </div>
      </div>
    </div>
  </div>
</header>
<!-- Project Details Section -->
<section id="single-project">

  <div class="container content-section text-center">
    <h2 align="center">CONTACT US</h2>
    <div class="row">
      <div class="col-md-6 contact-left">
        <div id="map" style="width:100%;height:421.797px;"></div>
      </div>
      <div class="col-md-6 contact-right">
        <div class="left-top">
          <h4>Contact information</h4>
          <p><i class="fa fa-calendar" aria-hidden="true"></i><strong> Monday - Friday <span class="dot">: </span></strong>9:30 AM to 6:30 PM</p>
          <p><i class="fa fa-map-marker" aria-hidden="true"></i><strong class="p"> address <span class="dot1">: </span></strong>부산광역시 부산진구 중앙대로 708 4층</p>
          <p><i class="fa fa-phone" aria-hidden="true"></i><strong class="p1"> phone <span class="dot2">: </span></strong>+040 2345 6789</p>
          <p><i class="fa fa-envelope" aria-hidden="true"></i><strong class="p2"> email <span class="dot3">: </span></strong><a href="mailto:minzino4825@gmail.com">minzino4825@gmail.com</a></p>
          <p><i class="fa-solid fa-train-subway" aria-hidden="true"></i><strong class="p"> 지하철 <span class="dot1">: </span></strong>2호선 서면역 2번 출구 -> 도보 6분 소요</p>
          <p><i class="fa-solid fa-bus" aria-hidden="true"></i><strong class="p"> 버스 <span class="dot1">: </span></strong>서면역, 서면 지하상가 정류장 -> 도보 3분 소요</p>
        </div>
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
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
          };

  // 지도를 생성합니다
  var map = new kakao.maps.Map(mapContainer, mapOption);

  // 주소-좌표 변환 객체를 생성합니다
  var geocoder = new kakao.maps.services.Geocoder();

  // 주소로 좌표를 검색합니다
  geocoder.addressSearch('부산광역시 부산진구 중앙대로 708' , function(result, status) {

    // 정상적으로 검색이 완료됐으면
    if (status === kakao.maps.services.Status.OK) {

      var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

      // 결과값으로 받은 위치를 마커로 표시합니다
      var marker = new kakao.maps.Marker({
        map: map,
        position: coords
      });

      // 인포윈도우로 장소에 대한 설명을 표시합니다
      var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">우리 회사</div>'
      });
      infowindow.open(map, marker);

      // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
      map.setCenter(coords);
    }
  });
</script>
</body>
</html>