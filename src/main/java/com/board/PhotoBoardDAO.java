package com.board;

import com.common.DBCoonPool;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class PhotoBoardDAO extends DBCoonPool {
    public PhotoBoardDAO() {
        super();
    }
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;

        String query = "SELECT COUNT(*) FROM scott.REVIEW_BOARD";
        if(map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                    + " LIKE '%" + map.get("searchWord") + "%'";
        }

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Review_Board selectCount 오류 발생");
        }

        return totalCount;
    }
    public List<PhotoBoardDTO> selectListPage(Map<String, Object> map) {
        List<PhotoBoardDTO> board = new ArrayList<PhotoBoardDTO>();

        String query = "SELECT * FROM ("
                + " SELECT Tb.*, ROWNUM rNum FROM ("
                + " SELECT * FROM scott.REVIEW_BOARD";
        if(map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                    + " LIKE '%" + map.get("searchWord") + "%'";
        }
        query += " ORDER BY rb_num desc"
                + " ) Tb"
                + " )"
                + " WHERE rNUM BETWEEN ? AND ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            rs = psmt.executeQuery();

            while(rs.next()) {
                PhotoBoardDTO dto = new PhotoBoardDTO();

                dto.setRbNum(rs.getString("rb_num"));
                dto.setRbTitle(rs.getString("rb_title"));
                dto.setRbContents(rs.getString("rb_contents"));
                dto.setRbPostDate(rs.getDate("rb_postdate"));
                dto.setRbOfile(rs.getString("rb_ofile"));
                dto.setRbSfile(rs.getString("rb_sfile"));
                dto.setRbVisitCount(rs.getInt("rb_visitcount"));
                dto.setPatNameFk(rs.getString("pat_name_fk"));
                dto.setPatIdFk(rs.getString("pat_id_fk"));

                board.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return board;
    }
    public int insertWrite(PhotoBoardDTO dto) {
        int result = 0;

        try {
            String query = "INSERT INTO scott.REVIEW_BOARD ( "
                    + " RB_NUM, RB_TITLE, RB_CONTENTS, RB_OFILE, RB_SFILE, PAT_NAME_FK, PAT_ID_FK)"
                    +" VALUES ("
                    +" scott.seq_board_num.nextval,?,?,?,?,?,?)";

            psmt = con.prepareStatement(query);

            psmt.setString(1, dto.getRbTitle());
            psmt.setString(2, dto.getRbContents());
            psmt.setString(3, dto.getRbOfile());
            psmt.setString(4, dto.getRbSfile());
            psmt.setString(5, dto.getPatNameFk());
            psmt.setString(6, dto.getPatIdFk());

            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("게시물 입력 중 예외 발생");
        }
        return result;
    }
    public PhotoBoardDTO selectView(String rbNum) {
        PhotoBoardDTO dto = new PhotoBoardDTO();
        String query = "SELECT * FROM scott.REVIEW_BOARD WHERE RB_NUM=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, rbNum);
            rs = psmt.executeQuery();

            if(rs.next()) {
                dto.setRbNum(rs.getString("rb_num"));
                dto.setRbTitle(rs.getString("rb_title"));
                dto.setRbContents(rs.getString("rb_contents"));
                dto.setRbPostDate(rs.getDate("rb_postdate"));
                dto.setRbOfile(rs.getString("rb_ofile"));
                dto.setRbSfile(rs.getString("rb_sfile"));
                dto.setRbVisitCount(rs.getInt("rb_visitcount"));
                dto.setPatNameFk(rs.getString("pat_name_fk"));
                dto.setPatIdFk(rs.getString("pat_Id_fk"));

            }
        } catch (Exception e) {
            System.out.println("게시물 상세보기 중 예외 발생");
            e.printStackTrace();
        }
        return dto;
    }
    public void updateVisitCount(String rbNum) {
        String query = "UPDATE scott.REVIEW_BOARD"
                + " SET rb_visitcount = rb_visitcount + 1"
                + " WHERE RB_NUM = ? ";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, rbNum);
            psmt.executeQuery();
        } catch (Exception e) {
            System.out.println("게시물 조회수 증가 중 예외 발생");
            e.printStackTrace();
        }
    }
    public boolean checkPassword(String uid, String rbNum, String inputPass) {
        boolean isPassword = false;
        try {
            String sql = "SELECT p.PAT_PW " +
                    "FROM scott.REVIEW_BOARD rb " +
                    "JOIN scott.PATIENTS p ON rb.PAT_ID_FK = p.PAT_ID " +
                    "WHERE rb.RB_NUM = ?";
            psmt = con.prepareStatement(sql);
            // Review_Board의 특정 게시물을 선택하고
            // 그 게시물에 해당하는 작성자의 비밀번호를 Patinets 테이블에서 들고옴
            psmt.setString(1, rbNum);
            rs = psmt.executeQuery();

            if(rs.next()){
                String userPassword = rs.getString("PAT_PW");
                System.out.println(userPassword);
                if(inputPass.equals(userPassword))
                    isPassword = true;
            }

        } catch (Exception e) {
            isPassword = true;
            e.printStackTrace();
        }
        return isPassword;
    }
    public int deletePost(int rbNum) {
        int result = 0;
        try {
            String sql = "DELETE FROM SCOTT.REVIEW_BOARD WHERE RB_NUM = ?";
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, rbNum);
            result = psmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        } finally {
            if (psmt != null) {
                try {
                    psmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }
}
