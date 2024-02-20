<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>후기 게시판</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
            href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap"
            rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
<header>
    <div class="main_poni">
        <a class="navbar-brand page-scroll" href="index.jsp" >
            <b>PONI</b> </a>
    </div>
    <input type="text" placeholder="Search">
    <nav class="header_nav">

        <div class="dropdown">
            <button type="button" class="btn" data-toggle="dropdown">커뮤니티</button>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="<%=request.getContextPath()%>/photo_board?cmd=photolist">사진</a>
                <hr />
                <a class="dropdown-item" href="#" onclick="warning()">집들이</a>

            </div>
            <div id="demo" class="collapse"></div>
            <a href="#" onclick="warning()">스토어</a>
        </div>
    </nav>

    <c:choose>
    <c:when test="${not empty sessionScope.UserName}">
    <div class=" header_right">
        <input type="text" placeholder="Search">
        <div class="header_right_a">
            <a href="logout">로그아웃</a>
        </div>
        </c:when>
        <c:otherwise>
        <div class=" header_right">
            <div class="header_right_a">
                <a href="/LoginModal.jsp">로그인</a> <span>|</span>
                <a href="/terms.jsp">회원가입</a>
            </div>
            </c:otherwise>
            </c:choose>

            <div class="dropdown">
                <button type="button" class="btn btn-primary">글쓰기</button>
            </div>
        </div>



</header>
<hr/>
</body>
</html>
