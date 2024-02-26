<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>나의 작성 글 확인</title>
</head>
<body>
<form action="mylist" method="post" class="validation-form" novalidate id="myJoinForm">
    <div class="container">
        <h1>나의 작성 글</h1>

        <table id="example" class="table table-striped table-bordered nowrap dt-print-table" style="width:100%">
            <thead>
            <tr>
                <th>Personal<br>Number</th>
                <th>Title</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${empty MyWriteList}">
                    <tr>
                        <td class="center" colspan=5>
                            <h2>등록된 게시글이 없습니다.</h2>
                        </td>
                    </tr>
                </c:when>
                <c:when test="${!empty MyWriteList}"> <%-- db 테이블 진입하는 값 --%>
                    <c:forEach items="${MyWriteList}" var="item" varStatus="loop">
                        <tr align="center">
                            <td class="hidden-xs">${item.rbNum}</td> <%-- db 항목 진입하는 값 --%>
                            <td><a href="../view?rb_num=${ item.rbNum }">${item.rbTitle}</a></td>
                            <td>${item.rbPostDate}</td>
                        </tr>
                    </c:forEach>
                </c:when>
            </c:choose>
            </tbody>
        </table>
    </div>
</form>
</body>
<script type="text/javascript">
    function reload(){
        location.reload();
    }
</script>
</html>