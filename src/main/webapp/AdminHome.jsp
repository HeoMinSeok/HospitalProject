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
    <title>PONI ADMIN</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <style>
        #top{
            top: -25%
        }
        .box1{
            width: 300px;
            height: 400px;
            background-color: white;
            color: gray;
            border:none;
            position: absolute; left: 10%;
            text-align: center;
            border-radius: 25px;
        }
        .box2{
            width: 300px;
            height: 400px;
            border:none;
            background-color: white;
            color: gray;
            position: absolute; left: 38.3%;
            text-align: center;
            border-radius: 25px;
        }
        .box3{
            width: 300px;
            height: 400px;
            border:none;
            background-color: white;
            color: gray;
            position: absolute;right: 10%;
            text-align: center;
            border-radius: 25px;
        }
        .brand-heading1{
            font-size:60px;
            margin-top:90px;
            margin-bottom:60px;
            border-top:2px solid #fff;
            border-bottom:2px solid #fff;
            padding:10px 0;

        }
        .intro .intro-body .brand-heading2 {
            font-size:60px;
            margin-top:80px;
            margin-bottom:20px;
            display:inline-block;
            padding:10px 0;
        }
        .intro .intro-body .brand-heading3 {
            font-size:60px;
            margin-top:120px;
            margin-bottom:20px;
            display:inline-block;
            padding:10px 0;
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
                    <a href="index.jsp">Home</a>
                </li>
                <li>
                    <c:if test="${not empty sessionScope.UserName}">
                        <a>${sessionScope.UserName} 님</a>
                    </c:if>
                </li>
                <li>
                    <a href="logout">LOGOUT</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<header class="intro">
    <div class="intro-body">
        <div class="col-md-8 col-md-offset-2" id="top">
            <c:if test="${sessionScope.role.equals('Doctors')}">
                <h1 class="brand-heading1">PONI 의사 페이지</h1>
            </c:if>
            <c:if test="${sessionScope.role.equals('Coordinator')}">
                <h1 class="brand-heading1">PONI 관리자 페이지</h1>
            </c:if>

            <div class="box1" onclick="location.href='/MemberList.do';">
                <h1 class="brand-heading2">환자<br>목록<br>출력</h1>
            </div>
            <div class="box2" onclick="location.href='/AdminView/DocterList.jsp';">
                <h1 class="brand-heading2">의사<br>목록<br>출력</h1>
            </div>
            <div class="box3" onclick="location.href='MemberList2.do';">
                <h1 class="brand-heading2">관리자<br>목록<br>출력</h1>
            </div>
        </div>

    </div>
</header>
<footer>
    <div class="container text-center">
        <p class="credits">
            Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>
        </p>
    </div>
</footer>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.min.js"></script>