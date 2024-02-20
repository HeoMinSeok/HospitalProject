<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<main class="photolist_main">
    <c:forEach var="board" items="${boards}">
        <div class="container">
            <div class="nickname">${board.userNickname }</div>
            <a href=" /JspProject/photo_board?cmd=detail&id=${board.id}"  onclick="reload();"><img class="container_img"
                                                                                                   src="/JspProject/uploads/${board.photoImage }" style="width: 100%"></a>
            <div class="emoti_box">
                <div>
                    <span>👁</span>
                    <span>${board.readCount }</span>
                </div>

                <div class="favorite">

                </div>
            </div>

            <div>
                <c:choose>
                    <c:when test="${fn:length(board.content) > 20}">
                        <c:out value="${fn:substring(board.content,0,19)}" />....
                    </c:when>
                    <c:otherwise>
                        <c:out value="${board.content }" />
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </c:forEach>

</main>
</body>
</html>
