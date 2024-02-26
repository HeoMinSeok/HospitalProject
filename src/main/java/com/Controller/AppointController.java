package com.Controller;

import com.membership.DocDAO;
import com.membership.DocDTO;
import com.reservation.AppointDAO;
import com.reservation.AppointDTO;
import com.util.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;


@WebServlet("/Reservation/Appoint.do")
public class AppointController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DocDAO dao = new DocDAO();
        List<DocDTO> doctors = dao.getAllDoctors();
        req.setAttribute("doctors", doctors);
        req.getRequestDispatcher("../Reservation/AppointForm.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String pId = (String) session.getAttribute("UserId");
        String dId = req.getParameter("docID");

        String selectedDate = req.getParameter("selectedDate");
        String selectedTime = req.getParameter("selectedTime");

        // 진료 날짜를 "yyyy-MM-dd" 형식으로 파싱하여 DB의 aDate 컬럼에 저장
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.sql.Date aDate = null;
        try {
            aDate = new java.sql.Date(dateFormat.parse(selectedDate).getTime());
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 진료 시간은 옵션 값 그대로 DB의 aTime 컬럼에 저장
        String selectedDateTimeStr = selectedDate + " " + selectedTime + ":00";
        java.sql.Timestamp aTime = java.sql.Timestamp.valueOf(selectedDateTimeStr);


        // AppointDTO 객체 생성 및 DAO를 사용하여 DB에 저장
        AppointDTO dto = new AppointDTO(pId, dId, aDate, aTime);
        AppointDAO dao = new AppointDAO();

        int result = dao.addAppoint(dto);
        dao.close();

        // 저장 결과에 따라 페이지 이동
        if (result == 1)
            JSFunction.alertLocation(resp, "예약이 접수되었습니다.", "../index.jsp");
        else
            JSFunction.alertLocation(resp, "저장에 실패하였습니다.", "../Appoint");
    }
}
