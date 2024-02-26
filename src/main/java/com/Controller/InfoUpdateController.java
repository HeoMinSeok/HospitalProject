package com.Controller;

import com.membership.PatDAO;
import com.membership.PatDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/update")
public class InfoUpdateController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String pat_Id = (String) session.getAttribute("UserId"); // 세션에서 아이디 가져오기

        PatDAO patDAO = new PatDAO();
        PatDTO patDTO = patDAO.selectById(pat_Id);

        //전화번호 분리
        if (patDTO.getPat_phone() != null) {
            String pat_phone = patDTO.getPat_phone();
            // 앞의 3자리는 tel1
            String tel1 = pat_phone.length() >= 3 ? pat_phone.substring(0, 3) : "";
            // 그 다음 4자리는 tel2
            String tel2 = pat_phone.length() >= 7 ? pat_phone.substring(3, 7) : "";
            // 나머지는 tel3
            String tel3 = pat_phone.length() > 7 ? pat_phone.substring(7) : "";

            request.setAttribute("tel1", tel1);
            request.setAttribute("tel2", tel2);
            request.setAttribute("tel3", tel3);
        } else {
            System.out.println("전화번호 분리 오류");
        }

        //email 분리
        if (patDTO.getPat_email() != null) {
            String pat_email = patDTO.getPat_email();
            int atIndex = pat_email.indexOf('@');
            if (atIndex != -1) {
                String pat_email1 = pat_email.substring(0, atIndex);
                String pat_emaildomain = pat_email.substring(atIndex + 1);

                request.setAttribute("pat_email1", pat_email1);
                request.setAttribute("pat_emaildomain", pat_emaildomain);

            } else {
                System.out.println("이메일 분리 오류");
            }
        }

        // 화면으로 가져온 환자 정보를 전달
        request.setAttribute("dto", patDTO);
        request.getRequestDispatcher("/MyProfile/PatUpdate.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 환자 정보 수정사항 DB에 넣기
        if (request.getParameter("pat_num") != null) {
            int pat_num = Integer.parseInt(request.getParameter("pat_num"));
            String pat_id = request.getParameter("pat_id");
            String pat_pw = request.getParameter("pat_pw");
            String pat_name = request.getParameter("pat_name");
            String pat_phone = request.getParameter("pat_phone1") +
                    request.getParameter("pat_phone2") +
                    request.getParameter("pat_phone3");
            String pat_gen = request.getParameter("pat_gen");
            String pat_email1 = request.getParameter("pat_email1");
            String pat_email2 = request.getParameter("pat_email2");
            String pat_addr = request.getParameter("pat_addr");

            String pat_email;
            if ("type".equals(pat_email2)) {
                // 이메일 도메인을 직접 입력한 경우
                pat_email = pat_email1 + "@" + request.getParameter("pat_email3");
            } else {
                // 이메일 도메인을 선택한 경우
                pat_email = pat_email1 + "@" + pat_email2;
            }

            PatDTO dto = new PatDTO();
            dto.setPat_num(pat_num);
            dto.setPat_id(pat_id);
            dto.setPat_pw(pat_pw);
            dto.setPat_name(pat_name);
            dto.setPat_phone(pat_phone);
            dto.setPat_gen(pat_gen);
            dto.setPat_email(pat_email);
            dto.setPat_addr(pat_addr);

            PatDAO dao = new PatDAO();
            int result = dao.updatePat(dto);

            if (result == 1) {
                // 수정 성공 시
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<script>alert('수정 성공'); location.href='../index.jsp';</script>");
            } else {
                // 수정 실패 시
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<script>alert('수정 실패 (오류 발생)'); location.href='../MyProfile/MyPage.jsp';'</script>");
            }
        }
    }
}



