<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <tr><h1>ADMIN LIST</h1></tr>
        <thead>
        <tr>
            <th>Personal<br>Number</th>
            <th>ID</th>
            <th>PW</th>
            <th>Name</th>
            <th><em class="fa fa-cog">Action</em></th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${empty CoodList}">
                <tr>
                    <td class="center" colspan=5>
                        <h2>등록된 회원이 없습니다.</h2>
                    </td>
                </tr>
            </c:when>
            <c:when test="${!empty CoodList}">
                <c:forEach items="${CoodList}" var="cood" varStatus="loop">
                    <tr align="center">
                        <td class="hidden-xs">${cood.cood_num}</td>
                        <td>${cood.cood_id}</td>
                        <td>${cood.cood_pw}</td>
                        <td>${cood.cood_name}</td>
                        <td>
                            <a class="btn btn-default" onclick="location.href='CoodUpdate.do?cood_id=${cood.cood_id}'"><em class="fa fa-pencil"></em></a>
                            <a class="btn btn-danger" onclick="location.href='CoodDelete.do?cood_id=${cood.cood_id}'"><em class="fa fa-trash"></em></a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
        </c:choose>
        </tbody>
    </table>
    <div class="center">
        <button class="btn_option1" onclick="checkRoleAndRedirect('/AdminPage/AdminMain.jsp')">DASH BOARD</button>
    </div>
</div>
</body>
<script>
    function checkRoleAndRedirect(role) {
        // 세션에서 role 값 가져오기
        var userRole = '<%= session.getAttribute("role") %>';

        // role 값에 따라 분기 처리
        if (userRole === 'Doctor' || userRole === 'Coordinator') {
            location.href = '/AdminPage/AdminMain.jsp';
        } else {
            // 다른 경우
            location.href = role;
        }
    }
</script>
</html>