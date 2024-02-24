package com.Controller;

import com.board.PhotoBoardDAO;
import com.board.PhotoBoardDTO;
import com.util.FileUtil;
import com.util.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/pass")
public class PassController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("mode", req.getParameter("mode"));
        req.getRequestDispatcher("/ReviewBoard/Pass.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String rbNum = req.getParameter("rbNum");
        String mode = req.getParameter("mode");
        String pass = req.getParameter("password");

        PhotoBoardDAO dao = new PhotoBoardDAO();
        boolean confirmed = dao.checkPassword(rbNum, pass);
        dao.close();
        
        if(confirmed) {
            if(mode.equals("edit")) {
                HttpSession session = req.getSession();
                session.setAttribute("pass", pass);
                resp.sendRedirect("../edit?rbNum=" + rbNum);
            } else if (mode.equals("delete")) {
                dao = new PhotoBoardDAO();
                PhotoBoardDTO dto = dao.selectView(rbNum);
                int result = dao.deletePost(rbNum);
                dao.close();
                if(result == 1) {
                    String sFileName = dto.getRbSfile();
                    FileUtil.deleteFile(req, "/uploads", sFileName);
                }
                JSFunction.alertLocation(resp, "삭제되었습니다.", "../mvcboard/list.do");
            }
        }
        else
            JSFunction.alertBack(resp, "비밀번호가 틀렸습니다.");
    }
}

