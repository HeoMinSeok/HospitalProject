package com.util;

import com.common.DBCoonPool;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/duplicateCheck")
public class
DuplicateCheckServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        boolean isDuplicate = checkDuplicate(id);

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        if(isDuplicate)
            out.print("duplicate");
        else
            out.print("사용 가능한 아이디입니다.");
        out.close();
    }
    private boolean checkDuplicate(String id) {
        boolean isDuplicate = false;
        Connection con = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        try {
            DBCoonPool dbCoonPool = new DBCoonPool();
            con = dbCoonPool.con;
            
            String cSql = "SELECT COUNT(*) FROM SCOTT.COORDINATOR WHERE COOD_ID = ?";
            psmt= con.prepareStatement(cSql);
            psmt.setString(1, id);
            rs = psmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    isDuplicate = true;
                    return isDuplicate;
                }
            }
            
            String dSql = "SELECT COUNT(*) FROM SCOTT.DOCTORS WHERE DOC_ID = ?";
            psmt = con.prepareStatement(dSql);
            psmt.setString(1, id);
            rs = psmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    isDuplicate = true;
                    return isDuplicate;
                }
            }

            String pSql = "SELECT COUNT(*) FROM SCOTT.PATIENTS WHERE PAT_ID = ?";
            psmt = con.prepareStatement(pSql);
            psmt.setString(1, id);
            rs = psmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    isDuplicate = true;
                    return isDuplicate;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 자원 반납
            try {
                if (rs != null) {
                    rs.close();
                }
                if (psmt != null) {
                    psmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isDuplicate;
    }
}
