package com.Controller;

import com.board.PhotoBoardDAO;
import com.board.PhotoBoardDTO;
import com.util.FileUtil;
import com.util.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/edit")
@MultipartConfig(
        maxFileSize = 1024 * 1024,
        maxRequestSize = 1024 * 1024 * 10
)
public class EditController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String rbNum = req.getParameter("rbNum");
        PhotoBoardDAO dao = new PhotoBoardDAO();
        PhotoBoardDTO dto = dao.selectView(rbNum);

        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/ReviewBoard/Edit.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sDir = req.getServletContext().getRealPath("/uploads");

        String oFileName = "";
        try {
            oFileName = FileUtil.uploadFile(req, sDir);
        } catch (Exception e) {
            JSFunction.alertBack(resp, "파일 업로드 오류입니다.");
            e.printStackTrace();
        }

        String rbNum = req.getParameter("rbNum");
        String prevOfile = req.getParameter("prevOfile");
        String prevSfile = req.getParameter("prevSfile");

        String title = req.getParameter("title");
        String content = req.getParameter("content");


        PhotoBoardDTO dto = new PhotoBoardDTO();
        dto.setRbNum(rbNum);
        dto.setRbTitle(title);
        dto.setRbContents(content);

        if (!oFileName.isEmpty()) {
            String sFileName = FileUtil.renameFile(sDir, oFileName);

            dto.setRbOfile(oFileName);
            dto.setRbSfile(sFileName);

            FileUtil.deleteFile(req, "/uploads", prevSfile);
        } else {
            dto.setRbOfile(prevOfile);
            dto.setRbSfile(prevSfile);
        }

        PhotoBoardDAO dao = new PhotoBoardDAO();
        int result = dao.updatePost(dto);
        dao.close();

        if (result == 1) {
            resp.sendRedirect("../view?rbNum=" + rbNum);
        } else {
            JSFunction.alertLocation(resp, "게시물 수정에 실패했습니다.", "../view?rbNum=" + rbNum);
        }
    }
}
