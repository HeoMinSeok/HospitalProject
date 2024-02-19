<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Neptune - Free Bootstrap Theme by WowThemes.net</title>
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
        ARIES
      </a>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
      <ul class="nav navbar-nav">
        <li>
          <a href="index.jsp" class="link">Home</a>
        </li>
        <li>
          <a href="WayToComeView.jsp" class="link">Way To Come</a>
        </li>
        <li>
          <a href="page-sample.html" class="link">Page Sample</a>
        </li>
        <li>
          <a href="contact.html" class="link">Hire me</a>
        </li>
        <c:if test="${not empty sessionScope.UserName}">
          <li>
            <a>${sessionScope.UserName} 님</a>
          </li>
          <li>
            <a href="logout" class="link">LOGOUT</a>
          </li>
        </c:if>
        <!-- 세션에 사용자 정보가 없으면 로그인 버튼을 표시 -->
        <c:if test="${empty sessionScope.UserName}">
          <li>
            <a href="LoginModal.jsp" class="link">LOGIN</a>
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
    <div class="row">

      <div class="col-lg-6">
        <h2 style="border-bottom: solid black 2px" >찾아 오는 길</h2>
        <i class="fa-solid fa-bus fa-2xl"></i> <b style="font-size: 20px">- 2호선 서면역 2번 출구 -> 도보 6분 소요</b>
      </div>

      <div class="col-lg-6">
        <h2>STEPS OF PROJECT</h2>
        <div id="map" style="width:100%;height:350px;"></div>
      </div>

    </div>
    <div class="row" style="border-top: solid black 2px">
      <p>
        <a href="#" class="btnghost"><i class="fa fa-envelope"></i> Request similar project</a>
        <i style="font-size:12px;margin-right:3px;"> or </i>
        <a href="index.jsp#portfolio" class="btnghost"><i class="fa fa-camera"></i> Back to projects gallery</a>
      </p>
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