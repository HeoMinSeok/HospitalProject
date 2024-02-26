package com.membership;

import com.common.DBCoonPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CoodDAO extends DBCoonPool {
    public CoodDAO(){
        super();
    }
    public CoodDTO getCoodDTO(String uid, String upass) {
        CoodDTO dto = new CoodDTO();
        String sql = "SELECT * FROM SCOTT.COORDINATOR WHERE COOD_ID = ? AND COOD_PW = ?";

        try{
            psmt = con.prepareStatement(sql);
            psmt.setString(1, uid);
            psmt.setString(2, upass);
            rs = psmt.executeQuery();

            while(rs.next()) {
                dto.setCood_num(rs.getInt("cood_num"));
                dto.setCood_id(rs.getString("cood_id"));
                dto.setCood_pw(rs.getString("cood_pw"));
                dto.setCood_name(rs.getString("cood_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("getCoodDTO 오류");
        }
        return dto;
    }
    public List<CoodDTO> listMembers() {
        List<CoodDTO> coodList = new ArrayList<>();
        try {
            String query = "SELECT * FROM scott.coordinator";
            psmt = con.prepareStatement(query);
            rs = psmt.executeQuery();
            while (rs.next()) {
                CoodDTO coodDTO = new CoodDTO();
                coodDTO.setCood_num(rs.getInt("cood_num"));
                coodDTO.setCood_id(rs.getString("cood_id"));
                coodDTO.setCood_pw(rs.getString("cood_pw"));
                coodDTO.setCood_name(rs.getString("cood_name"));
                coodList.add(coodDTO); // PatDTO 객체를 PatList에 추가
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return coodList;
    }
    public CoodDTO selectById(String cood_id) {
        CoodDTO dto = new CoodDTO();

        try {
            // 데이터베이스 조회 로직
            String sql = "SELECT * FROM scott.coordinator WHERE cood_id = ?";

            // PreparedStatement 객체 생성
            try (PreparedStatement psmt = con.prepareStatement(sql)) {
                // SQL 쿼리에 파라미터 값 설정
                psmt.setString(1, cood_id);

                // 쿼리 실행 및 결과셋 가져오기
                try (ResultSet rs = psmt.executeQuery()) {
                    // 결과가 있다면
                    if (rs.next()) {
                        dto.setCood_num(rs.getInt("cood_num"));
                        dto.setCood_id(rs.getString("cood_id"));
                        dto.setCood_pw(rs.getString("cood_pw"));
                        dto.setCood_name(rs.getString("cood_name"));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("관리자 selectById 오류 발생");
        }
        return dto;
    }
    public int updateCood(CoodDTO dto) {
        int result = 0;

        try {
            // 데이터베이스 업데이트 로직
            String sql = "UPDATE scott.coordinator"
                    + " SET cood_pw=?, cood_name=?"
                    + " WHERE cood_num =?";
            try (PreparedStatement psmt = con.prepareStatement(sql)) {
                psmt.setString(1, dto.getCood_pw());
                psmt.setString(2, dto.getCood_name());
                psmt.setInt(3, dto.getCood_num());

                // 쿼리 실행 및 결과 처리
                result = psmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("관리자 정보 업데이트 중 오류 발생");
        }

        return result;
    }
    public int deleteCood(String cood_id){
        int result = 0;

        try {
            String sql = "DELETE FROM scott.coordinator WHERE cood_id =?";
            psmt = con.prepareStatement(sql);
            psmt.setString(1, cood_id);
            result = psmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("관리자 정보 삭제 중 오류 발생");
            e.printStackTrace();
        }
        return result;

    }
}