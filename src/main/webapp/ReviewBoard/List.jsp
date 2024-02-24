<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@include file="BoardHeader.jsp"%>--%>
<%--<button type="button" onclick="checkLoginAndRedirect();">글쓰기</button>--%>
<html>
<head>
    <meta charset="UTF-8">
    <title>후기 게시판</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/List.css" rel="stylesheet">
</head>
<body>
<header style="text-align: center;">
    <nav>
        <ul style="display: flex; justify-content: space-between; align-items: center; padding: 0 20px; list-style: none;">
            <li style="flex: 1;"><a href="#" style="text-align: center; font-size: 40px">HOME</a></li>
            <li class="isLogin" style="font-size: 25px">
                <c:if test="${empty sessionScope.UserName}">
                    <button class="writeReview" type="button" onclick="checkLoginAndRedirect();">글쓰기</button>
                    <a href="#" data-toggle="modal" data-target="#loginModal">로그인</a>
                </c:if>
                <c:if test="${not empty sessionScope.UserName}">
                    <div class="dropdown">
                        <button type="button" onclick="checkLoginAndRedirect();">글쓰기</button>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">${sessionScope.UserName} 님 <b class="caret"></b></a>
                        <ul class="dropdown-menu" >
                            <li><a href="#" >프로필</a></li>
                            <li><a href="logout" >로그아웃</a></li>
                        </ul>
                    </div>
                </c:if>
            </li>
        </ul>
    </nav>
</header>
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
            &lt;%&ndash;<span class="agreement" style="color: black; "><a href="#">Learn user licence agreement</a></span>&ndash;%&gt;
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<main>
    <c:forEach var="board" items="${ boardLists }">
    <div id="gallery">
        <figure>
            <a href="../view?rbNum=${ board.rbNum }" onclick="reload();">
                <img src="../uploads/${board.rbSfile}" style="width: 100%">
            </a>
            <figcaption>${ board.patNameFk }</figcaption>
            <figcaption>
                <c:choose>
                    <c:when test="${fn:length(board.rbContents) > 20}">
                        <c:out value="${fn:substring(board.rbContents,0,19)}" />....
                    </c:when>
                    <c:otherwise>
                        <c:out value="${ board.rbContents }" />
                    </c:otherwise>
                </c:choose>
            </figcaption>
            <figcaption>
                <div class="emoti_box">
                    <span>👁</span>
                    <span>${ board.rbVisitCount }</span>
                </div>
            </figcaption>
        </figure>
    </div>
    </c:forEach>
</main>

<footer id="info" style="align-content: center; font-size: 25px;">
<%--    ${ map.pagingImg }--%>
</footer>
<script>
    function checkLoginAndRedirect() {
        var isLoggedIn = <%= session.getAttribute("UserName") != null %>;
        if (!isLoggedIn) {
            alert("로그인 후에 글을 작성할 수 있습니다.");
        } else {
            location.href = '../mvcboard/write.do';
        }
    }
</script>
<script type="text/javascript">
    function reload(){
        location.reload();
    }
</script>
<script>
    "use strict";
    (function () {
        window.onload = () => {
            const obj = document.querySelector("#gallery");
            const time = 10000;
            function animStart() {
                if (obj.classList.contains("active") === false) {
                    obj.classList.add("active");
                    setTimeout(() => {
                        animEnd();
                    }, time);
                }
            }
            function animEnd() {
                obj.classList.remove("active");
                obj.offsetWidth;
            }
            document.addEventListener("scroll", function () {
                // scroll or scrollend
                animStart();
            });
            window.addEventListener("resize", animStart);
            animStart();
        };
    })();

</script>
<script src="../js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>
<!-- Plugin JavaScript -->
<script src="../js/jquery.easing.min.js"></script>
<script type="text/javascript">
    function reload(){
        location.reload();
    }
</script>
</body>
</html>