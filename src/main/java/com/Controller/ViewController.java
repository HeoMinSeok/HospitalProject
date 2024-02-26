package com.Controller;

import com.board.PhotoBoardDAO;
import com.board.PhotoBoardDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/view")
public class ViewController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PhotoBoardDAO dao = new PhotoBoardDAO();
        String rbNum = req.getParameter("rb_num");
        dao.updateVisitCount(rbNum);
        PhotoBoardDTO dto = dao.selectView(rbNum);
        dao.close();
        System.out.println("content:: " + dto.getRbContents());
        dto.setRbContents(dto.getRbContents().replaceAll("\n", "<br/>"));

        String ext = null, fileName = dto.getRbSfile();
        if(fileName!=null)
            ext = fileName.substring(fileName.lastIndexOf(".")+1);
        String[] mimeStr = {"png", "jpg", "gif"};
        List<String> mimeList = Arrays.asList(mimeStr);
        boolean isImage = false;
        if(mimeList.contains(ext)){
            isImage = true;
        }
        req.setAttribute("dto", dto);
        req.setAttribute("isImage", isImage);
        req.getRequestDispatcher("/ReviewBoard/View.jsp").forward(req, resp);
    }
}
