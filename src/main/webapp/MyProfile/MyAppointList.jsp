<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ADMIN LIST</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    <script>
        // Ajax를 통해 CSS 파일을 가져와 동적으로 추가하는 함수
        function loadDynamicCSS() {
            var link = document.createElement("link");
            link.rel = "stylesheet";
            link.type = "text/css";
            link.href = "/css/memberslist.css";

            document.head.appendChild(link);
        }

        window.onload = function () {
            loadDynamicCSS();
        };
    </script>
</head>

<body class="body">
<div class="container">
    <table id="example" class="table99">
        <tr><h1>MY Appoint</h1></tr>
        <thead>
        <tr>
            <th>Appoint Number</th>
            <th>담당 의사</th>
            <th>예약 날짜</th>
            <th>예약 시간</th>
            <th>예약 상태</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${empty myAppoint }">
                <tr>
                    <td class="center" colspan=5>
                        <h2>예약 환자가 없습니다.</h2>
                    </td>
                </tr>
            </c:when>
            <c:when test="${!empty myAppoint }">
                <c:forEach items="${ myAppoint }" var="item" varStatus="loop">
                    <tr align="center">
                        <td>${item.anum}</td>
                        <td>${item.did}</td>
                        <td>${item.adate}</td>
                        <td>${fn:substring(item.atime, 11, 16)}</td>
                        <td>${item.status}</td>
                    </tr>
                </c:forEach>
            </c:when>
        </c:choose>
        </tbody>
    </table>
    <div class="center">
        <button class="btn_option1" onclick="location.href">MyPage로 이동</button>
    </div>
</div>
</body>
</html>