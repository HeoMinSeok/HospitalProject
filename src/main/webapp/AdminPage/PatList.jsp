
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PATIENTS LIST</title>

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
    <h1>PATIENTS LIST</h1>
    <div class="center">
        <form method="get">
            <select name = "searchFiled">
                <option value = "pat_name">이름</option>
                <option value = "pat_phone">연락처</option>
            </select>
            <input type="text" name = "searchWord">
            <input class="btn_option2" type="submit" value="검색">
        </form>
    </div>
    <table id="example" class="table99">
        <thead>
        <tr>
            <th>Personal<br>Number</th>
            <th>ID</th>
            <th>PW</th>
            <th>Name</th>
            <th>GENDER</th>
            <th>BIRTHDAY</th>
            <th>ADDRESS</th>
            <th>E-MAIL</th>
            <th>TEL</th>
            <th>EMR</th>
            <th><em class="fa fa-cog">Action</em></th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${empty patList}">
                <tr>
                    <td class="center" colspan=5>
                        <h2>등록된 회원이 없습니다.</h2>
                    </td>
                </tr>
            </c:when>
            <c:when test="${!empty patList}">
                <c:forEach items="${patList}" var="pat" varStatus="loop">
                    <tr align="center">
                        <td class="hidden-xs">${pat.pat_num}</td>
                        <td>${pat.pat_id}</td>
                        <td>${pat.pat_pw}</td>
                        <td>${pat.pat_name}</td>
                        <td>${pat.pat_gen}</td>
                        <td>${pat.pat_birth}</td>
                        <td>${pat.pat_addr}</td>
                        <td>${pat.pat_email}</td>
                        <td>${pat.pat_phone}</td>
                        <td>
                            <button class="btn_option" onclick="location.href='#'">열람</button>
                        </td>
                        <td>
                            <a class="btn btn-default" onclick="location.href='PatUpdate.do?pat_id=${pat.pat_id}'"><em class="fa fa-pencil"></em></a>
                            <a class="btn btn-danger" onclick="location.href='PatDelete.do?pat_id=${pat.pat_id}'"><em class="fa fa-trash"></em></a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
        </c:choose>
        </tbody>
    </table>
    <div class="center">${pagingStr}</div>
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