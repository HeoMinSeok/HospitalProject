package com.Controller;

import com.membership.CoodDAO;
import com.membership.DocDAO;
import com.membership.PatDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class CheckDuplicateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 클라이언트에서 전송한 아이디 파라미터 받기
        String userId = request.getParameter("userId");

        // 각 테이블에서 아이디 중복 확인
        CoodDAO coodDAO = new CoodDAO();
        DocDAO docDAO = new DocDAO();
        PatDAO patDAO = new PatDAO();

        boolean isDuplicate = false;

        // 각 DAO 클래스에서 중복 확인
//        if (coodDAO.isDuplicateUserId(userId) || docDAO.isDuplicateUserId(userId) || patDAO.isDuplicateUserId(userId)) {
//            isDuplicate = true;
//        }

        // JSON 형식으로 응답 작성
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print("{ \"isDuplicate\": " + isDuplicate + " }");
        out.flush();
    }
}
