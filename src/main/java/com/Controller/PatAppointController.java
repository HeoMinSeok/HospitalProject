package com.Controller;

import com.reservation.AppointDAO;
import com.reservation.AppointDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/PatAppoint")
public class PatAppointController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String UserId = (String) req.getSession().getAttribute("UserId");
        AppointDAO dao = new AppointDAO();
        List<AppointDTO> myAppoint = dao.getAppoint(UserId);

        req.setAttribute("myAppoint", myAppoint);
        req.getRequestDispatcher("/MyProfile/MyAppointList.jsp").forward(req, resp);
    }
}