package com.Controller;

import com.membership.*;
import com.util.BoardPage;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class MemberListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nextPage = null;
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getServletPath();

        // 환자 목록 가져오기
        if (action == null || action.equals("/AdminPage/PatList.do")) {
            PatDAO patDAO = new PatDAO();

            // 뷰에 전달할 매개변수 저장용 맵 생성
            Map<String, Object> map = new HashMap<>();
            String searchFiled = request.getParameter("searchFiled");
            String searchWord = request.getParameter("searchWord");

            if (searchWord != null) {
                // 쿼리스트링으로 받은 매개변수에서 검색어 있으면 맵에 저장
                map.put("searchFiled", searchFiled);
                map.put("searchWord", searchWord);
            }

            // 게시물 수 확인
            int totalCount = patDAO.selectCount(map);

            // 페이징 처리 시작
            int pageSize = Integer.parseInt(getServletContext().getInitParameter("POST_PER_PAGE"));
            int blockPage = Integer.parseInt(getServletContext().getInitParameter("POST_PER_BLOCK"));
            int totalPage = (int) Math.ceil((double) totalCount / pageSize);

            // 현재 페이지 확인
            int pageNum = 1;
            String pageTemp = request.getParameter("pageNum");
            if (pageTemp != null && !pageTemp.equals("")) {
                pageNum = Integer.parseInt(pageTemp); // 페이지 요청받은 값
            }

            // 목록에 출력할 게시물 범위 계산
            int start = (pageNum - 1) * pageSize + 1;
            int end = pageNum * pageSize;
            map.put("start", start);
            map.put("end", end);

            // 페이징 처리 끝

//            // 게시물 목록 가져오기
            List<PatDTO> patList = patDAO.selectListPage(map);
//
//            // 뷰에 전달할 매개변수 추가
//
            String pagingStr = BoardPage.pagingStr(totalCount ,pageSize,blockPage,pageNum, request.getRequestURI());
//            // 전달할 데이터를 req 영역에 저장하고 List.jsp 포워드
            request.setAttribute("patList", patList);
            request.setAttribute("map", map);
            request.setAttribute("pagingStr", pagingStr);

            RequestDispatcher dispatcher = request.getRequestDispatcher("../AdminPage/PatList.jsp");
            dispatcher.forward(request, response);

        } else if (action.equals("/AdminPage/DocList.do")) {
            DocDAO docDAO = new DocDAO();
            List<DocDTO> docList = docDAO.getAllDoctors();
            request.setAttribute("docList", docList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("../AdminPage/DocList.jsp");
            dispatcher.forward(request, response);

        } else if (action.equals("/AdminPage/CoodList.do")) {
            CoodDAO coodDAO = new CoodDAO();
            List<CoodDTO> coodList = coodDAO.listMembers();
            request.setAttribute("CoodList", coodList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("../AdminPage/CoodList.jsp");
            dispatcher.forward(request, response);
        } else {
            System.out.println("MemberListController 오류");
        }
    }
}