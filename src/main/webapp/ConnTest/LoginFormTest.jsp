<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SESSION LOGIN 구현</title>
</head>
<body>
<jsp:include page="../Common/LinkTest.jsp"></jsp:include>
<h2>LOGIN PAGE</h2>

<span id="loginError" style="color: red; font-size: 1.2em;">
      <%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
  </span>

<%
    if(session.getAttribute("UserId") == null) {
%>
<script>
    window.onload = function() {
        setTimeout(hideErrorMessage, 3000);
    };
    function hideErrorMessage() {
        var errorMessage = document.getElementById("loginError");
        errorMessage.innerHTML = "";
    }
</script>

<script>
    function validateForm(form) {
        if(!form.user_id.value) {
            alert("아이디를 입력하세요");
            return false;
        } else if(!form.user_pw.value) {
            alert("패스워드를 입력하세요");
            return false;
        }
    }
</script>
<form action="LoginProcessTest.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
    아이디 : <input type="text" name="user_id"><br>
    패스워드 : <input type="password" name="user_pw"><br>
    <input type="submit" value="LOGIN">
</form>
<%
}
else {
%>
<span style="color: darkorange;"><%= session.getAttribute("UserName")%>
    </span> 님, 로그인 하셨습니다. <br>
<a href="LogoutTest.jsp">[LOGOUT]</a>
<%
    }
%>
</body>
</html>