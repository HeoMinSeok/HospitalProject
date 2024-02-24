package com.Controller;

import com.membership.PatDAO;
import com.membership.PatDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String userId = req.getParameter("userId");
    String password = req.getParameter("password");
    String name = req.getParameter("name");
    String gender = req.getParameter("gender");
    String birthdayStr = req.getParameter("yy") + "-" + req.getParameter("mm") + "-" + req.getParameter("dd"); // 생년월일 문자열
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    java.sql.Date utilDate = null;
    utilDate = Date.valueOf(birthdayStr);
    String addr = req.getParameter("addr1");
    String tel1 = req.getParameter("tel1");
    String tel2 = req.getParameter("tel2");
    String tel3 = req.getParameter("tel3");
    String phone = tel1 + tel2 + tel3;
    String email = req.getParameter("email1"); // 첫 번째 이메일 입력란의 값 가져오기
    String emailDomain = req.getParameter("emailDomain"); // 이메일 도메인 선택값 가져오기

    if ("type".equals(emailDomain)) {
        // 이메일 도메인을 직접 입력한 경우
        email = email + "@" + req.getParameter("email2") + "." + req.getParameter("emailDomain");
    } else {
        // 이메일 도메인을 선택한 경우
        email = email + "@" + emailDomain;
    }
    if ("남자".equals(gender)) {
        gender = "Male";
    } else if ("여자".equals(gender)) {
        gender = "Female";
    }

    PatDTO dto = new PatDTO(userId, password, name, phone, utilDate, gender, email, addr);
    PatDAO dao = new PatDAO();

    boolean success = dao.addPatient(dto);

    if (success) {
        resp.setContentType("text/html;charset=UTF-8");
        resp.getWriter().println("<script>alert('가입 성공'); location.href='index.jsp';</script>");
    } else {
        // 회원가입 실패 시 다시 회원가입 폼으로 이동
        resp.setContentType("text/html;charset=UTF-8");
        resp.getWriter().println("<script>alert('가입 실패: DB 오류'); location.href='join.jsp';</script>");
    }
}


    private String formatBirthday(String year, String month, String day) {
        // 생년월일을 yyyy-mm-dd 형식으로 변환
        return year + "-" + month + "-" + day;
    }
}
