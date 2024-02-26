package com.Controller;

import com.membership.CoodDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

public class CoodDeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cood_id = request.getParameter("cood_id");
        CoodDAO dao  = new CoodDAO();
        int result = dao.deleteCood(cood_id);
        response.sendRedirect("/AdminPage/CoodList.do");
    }
}