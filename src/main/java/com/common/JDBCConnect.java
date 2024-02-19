package com.common;

import jakarta.servlet.ServletContext;

import java.sql.*;

public class JDBCConnect {
    public Connection con;
    public Statement stmt;
    public PreparedStatement psmt;
    public ResultSet rs;

    public JDBCConnect() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");

            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String id = "scott";
            String pwd = "tiger";
            con = DriverManager.getConnection(url, id, pwd);

            System.out.println("DB 연결 성공(기본 생성자)");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public JDBCConnect(String driver, String url, String id, String pwd) {
        try {
            Class.forName(driver);

            con = DriverManager.getConnection(url, id, pwd);

            System.out.println("DB 연결 성공(파라미터 생성자)");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public JDBCConnect(ServletContext application) {
        try {
            String driver = application.getInitParameter("OracleDriver");
            Class.forName(driver);

            String url = application.getInitParameter("OracleURL");
            String id = application.getInitParameter("OracleId");
            String pwd = application.getInitParameter("OraclePwd");
            con = DriverManager.getConnection(url, id, pwd);

            System.out.println("DB 연결 성공(파라미터 생성자2)");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            if(rs != null)
                rs.close();
            if(stmt != null)
                stmt.close();
            if(psmt != null)
                psmt.close();
            if(con != null)
                con.close();

            System.out.println("JDBC 자원 해제");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
