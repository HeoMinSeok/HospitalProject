package com.membership;

import com.common.DBCoonPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

}
