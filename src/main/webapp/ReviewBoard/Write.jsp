<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<form name="writeFrm" method="post" enctype="multipart/form-data" action="../mvcboard/write.do" onsubmit="return validateForm(this);">
    <input type="hidden" name="name" value="<%= session.getAttribute("UserName") %>">
    <input type="hidden" name="name" value="<%= session.getAttribute("UserId") %>">
    <input type="hidden" name="name" value="<%= session.getAttribute("UserNum") %>">
    <table border="1" width="90%">
        <tr>
            <td>작성자</td>
            <td>
                ${ sessionScope.UserName }
            </td>
        </tr>
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;">
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%;height: 100px;"></textarea>
            </td>
        </tr>
        <tr>
            <td>첨부 파일</td>
            <td>
                <input type="file" name="ofile" multiple/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">RESET</button>
                <button type="button" onclick="location.href='../mvcboard/list.do';">
                    목록 바로가기
                </button>
            </td>
        </tr>
    </table>
</form>
</body>
<script>
    function validateForm(form) {
        if(!form.title.value) {
            alert("제목을 입력하세요");
            form.title.focus();
            return false;
        }
        if(!form.content.value) {
            alert("내용을 입력하세요");
            form.content.focus();
            return false;
        }
    }
</script>
</html>
