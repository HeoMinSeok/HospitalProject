package com.Controller;

import com.emrboard.EmrDAO;
import com.emrboard.EmrDTO;
import com.membership.PatDAO;
import com.membership.PatDTO;
import com.util.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/Chart")
public class ChartController extends HttpServlet {
    @Override
    protected  void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PatDAO dao = new PatDAO();
        PatDTO patients = dao.getPatients(req.getParameter("pat_id"));
        req.setAttribute("patients", patients);
        req.getRequestDispatcher("/DoctorPage/Chart.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String eContents = req.getParameter("contents");
        String eDocId = (String) session.getAttribute("UserId");
        String ePatId = req.getParameter("pat_id");
        String[] ePmhArr = req.getParameterValues("pmh");
        StringBuffer ePmhBuf = new StringBuffer();
        if(ePmhArr == null)
            ePmhBuf.append("특이사항 없음");
        else  {
            boolean isFirst = true;
            for(String s : ePmhArr) {
                if(!isFirst)
                    ePmhBuf.append(", ");
                else
                    isFirst = false;
                ePmhBuf.append(s);
            }
        }

        EmrDTO dto = new EmrDTO();
        dto.setEContents(eContents);
        dto.setEDocId(eDocId);
        dto.setEPatId(ePatId);
        dto.setEPmh(ePmhBuf.toString());

        EmrDAO dao = new EmrDAO();
        int result = dao.writeChart(dto);
        dao.close();

        if(result == 1)
            JSFunction.alertLocation(resp,"진료 작성 완료하였습니다.", "../MyAppoint");
        else
            JSFunction.alertLocation(resp, "진료 차트 작성에 실패했습니다.", "../Chart");
    }
}
