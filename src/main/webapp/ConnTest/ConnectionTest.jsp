<%@ page import="com.common.JDBCConnect" %>
<%@ page import="com.common.DBCoonPool" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JDBC</title>
</head>
<body>
<h2>JDBC TEST</h2>
<%
    JDBCConnect jdbc1 = new JDBCConnect();
    jdbc1.close();
//    session.setMaxInactiveInterval(1200);
%>

<h2>JDBC TEST2</h2>
<%
    String driver = application.getInitParameter("OracleDriver");
    String url = application.getInitParameter("OracleURL");
    String id = application.getInitParameter("OracleId");
    String pwd = application.getInitParameter("OraclePwd");
%>
<%
    JDBCConnect jdbc2 = new JDBCConnect(driver, url, id, pwd);
    jdbc2.close();
%>

<h2>JDBC TEST3</h2>
<%
    JDBCConnect jdbc3 = new JDBCConnect(application);
    jdbc3.close();
%>

<h2>커넥션 풀 테스트</h2>
<%
    DBCoonPool pool = new DBCoonPool();
    pool.close();
%>
</body>
</html>