<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Session에 있는 user info 삭제
//    session.removeAttribute("UserId");
//    session.removeAttribute("UserName");

    // Session 모든 속성 삭제
    session.invalidate();
    response.sendRedirect("LoginFormTest.jsp");
%>