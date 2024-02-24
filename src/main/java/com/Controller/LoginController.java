package com.Controller;

import com.membership.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String userId = request.getParameter("user_id");
        String userPwd = request.getParameter("password");

        // 각각의 DAO를 사용하여 해당 역할의 DTO를 가져옴
        CoodDTO coodDTO = new CoodDAO().getCoodDTO(userId, userPwd);
        DocDTO docDTO = new DocDAO().getDocDTO(userId, userPwd);
        PatDTO patDTO = new PatDAO().getPatDTO(userId, userPwd);

        String loginMessage = ""; // 로그인 메시지 초기화
        String redirectPage = ""; // 리다이렉트할 페이지 초기화

        if (coodDTO.getCood_id() != null || coodDTO.getCood_pw() != null) {
            loginMessage = "관리자로 로그인하셨습니다.";
            redirectPage = "AdminHome.jsp";
        } else if (docDTO.getDoc_id() != null || docDTO.getDoc_pw() != null) {
            loginMessage = "의사로 로그인하셨습니다.";
            redirectPage = "AdminHome.jsp";
        } else if (patDTO.getPat_id() != null || patDTO.getPat_pw() != null) {
            loginMessage = "환자로 로그인하셨습니다.";
            redirectPage = "index.jsp";
        } else {
            request.setAttribute("LoginErrMsg", "아이디/패스워드를 확인하세요");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("UserId", userId);
        session.setAttribute("UserName", getUserName(coodDTO, docDTO, patDTO));
        session.setAttribute("UserNum", getUserNum(coodDTO, docDTO, patDTO));

        String successScript = "<script>alert('" + loginMessage + "');"
                + "window.location.href='" + redirectPage + "';</script>";
        response.getWriter().write(successScript);
    }

    // 사용자 이름을 가져오는 메서드
    private String getUserName(CoodDTO coodDTO, DocDTO docDTO, PatDTO patDTO) {
        if (coodDTO.getCood_name() != null) {
            return coodDTO.getCood_name();
        } else if (docDTO.getDoc_name() != null) {
            return docDTO.getDoc_name();
        } else if (patDTO.getPat_name() != null) {
            return patDTO.getPat_name();
        }
        return "";
    }
    private String getUserNum(CoodDTO coodDTO, DocDTO docDTO, PatDTO patDTO) {
        if (coodDTO != null && coodDTO.getCood_num() != 0) {
            return String.valueOf(coodDTO.getCood_num());
        } else if (docDTO != null && docDTO.getDoc_num() != 0) {
            return String.valueOf(docDTO.getDoc_num());
        } else if (patDTO != null && patDTO.getPat_num() != 0) {
            return String.valueOf(patDTO.getPat_num());
        }
        return ""; // 예외 처리: DTO가 null이거나 번호가 없는 경우
    }
}





