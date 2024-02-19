<%@ page import="com.membership.MemberDAO" %>
<%@ page import="com.membership.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userId = request.getParameter("user_id");
    String userPwd = request.getParameter("user_pw");

    MemberDAO dao = new MemberDAO();
    MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
    dao.close();

    // 로그인 성공 여부에 따른 처리
    if(memberDTO.getId() != null) {
        // 로그인 성공
        session.setAttribute("UserId", memberDTO.getId());
        session.setAttribute("UserName", memberDTO.getName());
        response.sendRedirect("LoginFormTest.jsp");
    }
    else {
        request.setAttribute("LoginErrMsg", "아이디/패스워드를 확인하세요");
        request.getRequestDispatcher("LoginFormTest.jsp").forward(request, response);
    }
%>