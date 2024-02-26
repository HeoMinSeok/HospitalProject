package com.Controller;

import com.membership.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;


public class MemberUpdateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 수정페이지에 환자 목록 가져오기
        if (request.getParameter("pat_id")!=null) {
            String pat_id = request.getParameter("pat_id");
//        System.out.println("pat_id: " + pat_id);
            PatDAO dao = new PatDAO();
            PatDTO dto = dao.selectById(pat_id);

            //전화번호 분리
            if (dto.getPat_phone() != null) {
                String pat_phone = dto.getPat_phone();
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
                System.out.println("생년월일 분리 오류");
            }

            //생년월일 분리
            if (dto.getPat_birth() != null) {
                String pat_email = String.valueOf(dto.getPat_birth());
                int atIndex = pat_email.indexOf('-');
                if (atIndex != -1) {
                    String pat_birthYY = pat_email.substring(0, atIndex);
                    String pat_birthMM = pat_email.substring(atIndex + 1, pat_email.indexOf('-', atIndex + 1));
                    String pat_birthDD = pat_email.substring(pat_email.indexOf('-', atIndex + 1) + 1);
//                System.out.println("pat_birthYY : " + pat_birthYY);
//                System.out.println("pat_birthMM : " + pat_birthMM);
//                System.out.println("pat_birthDD : " + pat_birthDD);
                    request.setAttribute("pat_birthYY", pat_birthYY);
                    request.setAttribute("pat_birthMM", pat_birthMM);
                    request.setAttribute("pat_birthDD", pat_birthDD);
                } else {
                    System.out.println("생년월일 분리 오류");
                }
            }
            //email 분리
            if (dto.getPat_email() != null) {
                String pat_email = dto.getPat_email();
                int atIndex = pat_email.indexOf('@');
                if (atIndex != -1) {
                    String pat_email1 = pat_email.substring(0, atIndex);
                    String pat_emaildomain = pat_email.substring(atIndex + 1);
                    //System.out.println("email1 : " + pat_email1);
                    //System.out.println("doc_emaildomain : " + pat_emaildomain);
                    request.setAttribute("pat_email1", pat_email1);
                    request.setAttribute("pat_emaildomain", pat_emaildomain);
                } else {
                    System.out.println("이메일 분리 오류");
                }
            }
            request.setAttribute("dto", dto);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/AdminPage/PatUpdate.jsp");
            dispatcher.forward(request, response);

            // 수정페이지에 의사 목록 가져오기
        } else  if (request.getParameter("doc_id")!=null) {
            String doc_id = request.getParameter("doc_id");
            System.out.println("doc_id: " + doc_id);
            DocDAO dao = new DocDAO();
            DocDTO dto = dao.selectById(doc_id);
            //email 분리
            if (dto.getDoc_email() != null) {
                String doc_email = dto.getDoc_email();
                int atIndex = doc_email.indexOf('@');
                if (atIndex != -1) {
                    String doc_email1 = doc_email.substring(0, atIndex);
                    String doc_emaildomain = doc_email.substring(atIndex + 1);
                    //System.out.println("email1 : " + doc_email1);
                    //System.out.println("doc_emaildomain : " + doc_emaildomain);
                    request.setAttribute("doc_email1", doc_email1);
                    request.setAttribute("doc_emaildomain", doc_emaildomain);
                } else {
                    System.out.println("이메일 분리 오류");
                }
            }
            request.setAttribute("dto", dto);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/AdminPage/DocUpdate.jsp");
            dispatcher.forward(request, response);

            // 수정페이지에 관리자 목록 가져오기
        } else if (request.getParameter("cood_id")!=null) {
            String cood_id   = request.getParameter("cood_id");
            System.out.println("cood_id: " + cood_id);
            CoodDAO dao = new CoodDAO();
            CoodDTO dto = dao.selectById(cood_id);

            request.setAttribute("dto", dto);
            RequestDispatcher dispatcher = request.getRequestDispatcher("CoodUpdate.jsp");
            dispatcher.forward(request,response);

        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 환자 정보 수정사항 DB에 넣기
        if ( request.getParameter("pat_num") != null ) {
            // System.out.println("doPost 진입");
            int pat_num = Integer.parseInt(request.getParameter("pat_num"));
            String pat_id = request.getParameter("pat_id");
            String pat_pw = request.getParameter("pat_pw");
            //System.out.println("id ="+ pat_id+" pw ="+ pat_pw + " num= " + pat_num);
            String pat_name = request.getParameter("pat_name");
            String tel1 = request.getParameter("pat_phone1");
            String tel2 = request.getParameter("pat_phone2");
            String tel3 = request.getParameter("pat_phone3");
            String pat_phone = tel1 + tel2 + tel3;
            String birthdayStr = request.getParameter("yy") + "-" + request.getParameter("mm") + "-" + request.getParameter("dd"); // 생년월일 문자열
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.sql.Date pat_birth = null;
            pat_birth = Date.valueOf(birthdayStr);
            //System.out.println("1");
            String pat_gen = request.getParameter("pat_gen");
            if ("남자".equals(pat_gen)) {
                pat_gen = "Male";
            } else if ("여자".equals(pat_gen)) {
                pat_gen = "Female";
            }
            String email = request.getParameter("pat_email1");
            String emailDomain = request.getParameter("pat_emailDomain");
            String pat_addr = request.getParameter("pat_addr");
            String pat_email = null;
            if ("type".equals(emailDomain)) {
                // 이메일 도메인을 직접 입력한 경우
                pat_email = email + "@" + request.getParameter("pat_email2");
            } else {
                // 이메일 도메인을 선택한 경우
                pat_email = email + "@" + emailDomain;
            }

            PatDTO dto = new PatDTO();
            dto.setPat_num(pat_num);
            dto.setPat_id(pat_id);
            dto.setPat_pw(pat_pw);
            dto.setPat_name(pat_name);
            dto.setPat_phone(pat_phone);
            dto.setPat_birth(pat_birth);
            dto.setPat_gen(pat_gen);
            dto.setPat_email(pat_email);
            dto.setPat_addr(pat_addr);

            PatDAO dao = new PatDAO();
            int result = dao.updatePat(dto);

            if (result == 1) {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<script>alert('수정 성공'); location.href='/AdminPage/PatList.do';</script>");
            } else {
                // 회원가입 실패 시 다시 회원가입 폼으로 이동
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<script>alert('수정 실패 (오류 발생)'); location.href='/AdminPage/PatUpdate.do?pat_id=" + dto.getPat_id() + "'</script>");
            }

            // 의사 정보 수정사항 DB에 넣기
        }else if ( request.getParameter("doc_num") != null ) {
            int doc_num = Integer.parseInt(request.getParameter("doc_num"));
//        System.out.println(" num= " + doc_num);
            String doc_id = request.getParameter("doc_id");
            String doc_pw = request.getParameter("doc_pw");
            String doc_name = request.getParameter("doc_name");
//       System.out.println("id =" + doc_id + " pw =" + doc_pw + " num= " + doc_num);
            String email = request.getParameter("doc_email1");
            String emailDomain = request.getParameter("doc_emailDomain");

            String doc_email = null;
            if ("type".equals(emailDomain)) {
                // 이메일 도메인을 직접 입력한 경우
                doc_email = email + "@" + request.getParameter("doc_email2") + "." + request.getParameter("emailDomain");
            } else {
                // 이메일 도메인을 선택한 경우
                doc_email = email + "@" + emailDomain;
            }
//            System.out.println("doc_email : "+doc_email);

            DocDTO dto = new DocDTO();
            dto.setDoc_num(doc_num);
            dto.setDoc_id(doc_id);
            dto.setDoc_pw(doc_pw);
            dto.setDoc_name(doc_name);
            dto.setDoc_email(doc_email);

            DocDAO dao = new DocDAO();
            int result = dao.updateDoc(dto);

            if (result == 1) {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<script>alert('수정 성공'); location.href='/AdminPage/DocList.do';</script>");
            } else {
                // 수정 실패 시 다시 회원가입 폼으로 이동
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<script>alert('수정 실패'); location.href='/AdminPage/DocUpdate.do?doc_id=" + dto.getDoc_id() + "'</script>");
            }
            // 관리자 정보 수정사항 DB에 넣기
        }else if ( request.getParameter("cood_num") != null ) {
            int cood_num = Integer.parseInt(request.getParameter("cood_num"));
            String cood_id = request.getParameter("cood_id");
            String cood_pw = request.getParameter("cood_pw");
            String cood_name = request.getParameter("cood_name");
//        System.out.println("id ="+ cood_id+" pw ="+ cood_pw + " num= " + cood_num);

            CoodDTO dto = new CoodDTO();
            dto.setCood_num(cood_num);
            dto.setCood_id(cood_id);
            dto.setCood_pw(cood_pw);
            dto.setCood_name(cood_name);

            CoodDAO dao = new CoodDAO();
            int result = dao.updateCood(dto);
            //boolean success = dao.addPatient(dto);

            if (result == 1) {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<script>alert('수정 성공'); location.href='/AdminPage/CoodList.do';</script>");
            } else {
                // 수정 실패 시 다시 회원가입 폼으로 이동
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<script>alert('수정 실패'); location.href='/AdminPage/CoodUpdate.do?cood_id="+dto.getCood_id() + "'</script>");
            }
        }
    }
}