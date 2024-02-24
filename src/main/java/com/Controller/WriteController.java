package com.Controller;

import com.board.PhotoBoardDAO;
import com.board.PhotoBoardDTO;
import com.util.FileUtil;
import com.util.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class WriteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/ReviewBoard/Write.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("UserId");
        String saveDir = req.getServletContext().getRealPath("/uploads");
        String originalFileName = "";

        try {
            originalFileName = FileUtil.uploadFile(req, saveDir);
        } catch (Exception e) {
            // - 파일 업로드 실패
            JSFunction.alertLocation(resp, "파일 업로드 오류입니다.", "../mvcboard/write.do");
            return;
        }
        // 2. 파일 업로드 외 처리 - 폼값 DTO에 저장
        PhotoBoardDTO dto = new PhotoBoardDTO();
        dto.setPatNameFk(req.getParameter("name"));
        dto.setRbTitle(req.getParameter("title"));
        dto.setRbContents(req.getParameter("content"));

        // - 원본 파일명과 저장된 파일 이름 설정
        if (originalFileName != "" && originalFileName != null) {
            // -첨부 파일 있을 경우 파일명 변경
            String savedFileName = FileUtil.renameFile(saveDir, originalFileName);

            dto.setRbOfile(originalFileName);
            dto.setRbSfile(savedFileName);
        }
        dto.setPatIdFk(userId);
        // - DAO를 통해 DB에 게시 내용 저장
        PhotoBoardDAO dao = new PhotoBoardDAO();
        int result = dao.insertWrite(dto);
        dao.close();
        System.out.println(result);

        if (result == 1)
            resp.sendRedirect("../mvcboard/list.do");
        else
            JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.", "../mvcboard/write.do");
    }
}
