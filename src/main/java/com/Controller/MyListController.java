package com.Controller;

import com.board.PhotoBoardDAO;
import com.board.PhotoBoardDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/mylist")
public class MyListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nextPage = null;
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("UserId");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getPathInfo();

        PhotoBoardDAO PhotoBoardDAO = new PhotoBoardDAO();
        List<PhotoBoardDTO> mywritelist = PhotoBoardDAO.listMembers(userId);
        System.out.println("list size : " + mywritelist.size());
        request.setAttribute("MyWriteList", mywritelist);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/MyProfile/MyWriteList.jsp");
        dispatcher.forward(request, response);
    }
}