package com.membership;

import com.common.DBCoonPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DocDAO extends DBCoonPool {
    public DocDAO() {
        super();
    }
    public DocDTO getDocDTO(String uid, String upass) {
        DocDTO dto = new DocDTO();
        String sql = "SELECT * FROM SCOTT.DOCTORS WHERE DOC_ID = ? AND DOC_PW = ?";

        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, uid);
            psmt.setString(2, upass);
            rs = psmt.executeQuery();

            while(rs.next()) {
                dto.setDoc_num(rs.getInt("doc_num"));
                dto.setDoc_id(rs.getString("doc_id"));
                dto.setDoc_pw(rs.getString("doc_pw"));
                dto.setDoc_email(rs.getString("doc_email"));
                dto.setDoc_name(rs.getString("doc_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("getDocDTO 오류");
        }
        return dto;
    }
    public List<DocDTO> getAllDoctors() {
        List<DocDTO> doctors = new ArrayList<>();
        String sql = "SELECT * FROM SCOTT.DOCTORS"; // 모든 의사 정보를 가져오는 쿼리

        try {
            PreparedStatement psmt = con.prepareStatement(sql);
            ResultSet rs = psmt.executeQuery();

            while(rs.next()) {
                DocDTO dto = new DocDTO();
                dto.setDoc_num(rs.getInt("doc_num"));
                dto.setDoc_id(rs.getString("doc_id"));
                dto.setDoc_pw(rs.getString("doc_pw"));
                dto.setDoc_email(rs.getString("doc_email"));
                dto.setDoc_name(rs.getString("doc_name"));
                doctors.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("getAllDoctors 오류");
        }
        return doctors;
    }
    public DocDTO selectById(String doc_id) {
        DocDTO dto = new DocDTO();

        try {
            // 데이터베이스 조회 로직
            String sql = "SELECT * FROM scott.doctors WHERE DOC_ID = ?";

            // PreparedStatement 객체 생성
            try (PreparedStatement psmt = con.prepareStatement(sql)) {
                // SQL 쿼리에 파라미터 값 설정
                psmt.setString(1, doc_id);

                // 쿼리 실행 및 결과셋 가져오기
                try (ResultSet rs = psmt.executeQuery()) {
                    // 결과가 있다면
                    if (rs.next()) {
                        dto.setDoc_num(rs.getInt("doc_num"));
                        dto.setDoc_id(rs.getString("doc_id"));
                        dto.setDoc_pw(rs.getString("doc_pw"));
                        dto.setDoc_email(rs.getString("doc_email"));
                        dto.setDoc_name(rs.getString("doc_name"));

                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("의사 selectById 오류 발생");
            }

            return dto;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public int updateDoc(DocDTO dto) {
        int result = 0;

        try {
            // 데이터베이스 업데이트 로직
            String sql = "UPDATE scott.doctors"
                    + " SET doc_pw=?, doc_name=?, doc_email=?"
                    + " WHERE doc_num =?";
            try (PreparedStatement psmt = con.prepareStatement(sql)) {
                psmt.setString(1, dto.getDoc_pw());
                psmt.setString(2, dto.getDoc_name());
                psmt.setString(3, dto.getDoc_email());
                psmt.setInt(4, dto.getDoc_num());

                // 쿼리 실행 및 결과 처리
                result = psmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("의사 정보 업데이트 중 오류 발생");
        }

        return result;

    }
    public int deleteDoc(String doc_id) {

        int result = 0;

        try {
            String sql = "DELETE FROM scott.doctors WHERE doc_id =?";
            psmt = con.prepareStatement(sql);
            psmt.setString(1, doc_id);
            result = psmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("의사 정보 삭제 중 오류 발생");
            e.printStackTrace();
        }
        return result;
    }
}
