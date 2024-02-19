<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<table border="1" width="90%">
    <tr>
        <td align="center">
            <%
                if(session.getAttribute("UserId") == null) {
            %>
            <a  href="../ConnTest/LoginFormTest.jsp.jsp">로그인</a>
            <%
            } else {
            %>
            <a href="../ConnTest/LogoutTest.jsp">로그아웃</a>
            <%
                }
            %>
            &nbsp;&nbsp;&nbsp;
            <a href="../ConnTest/Listx.jsp">게시판(페이징X)</a>
            &nbsp;&nbsp;&nbsp;
            <a href="../ConnTest/Listo.jsp">게시판(페이징O)</a>
        </td>
    </tr>
</table>