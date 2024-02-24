package com.membership;

import com.common.DBCoonPool;

import java.sql.Date;


public class PatDAO extends DBCoonPool {
    public PatDAO() {
        super();
    }
    public PatDTO getPatDTO(String uid, String upass) {
        PatDTO dto = new PatDTO();
        String sql = "SELECT * FROM SCOTT.PATIENTS WHERE PAT_ID = ? AND PAT_PW = ?";

        try{
            psmt = con.prepareStatement(sql);
            psmt.setString(1, uid);
            psmt.setString(2, upass);
            rs = psmt.executeQuery();

            while(rs.next()) {
                dto.setPat_num(rs.getInt("pat_num"));
                dto.setPat_id(rs.getString("pat_id"));
                dto.setPat_pw(rs.getString("pat_pw"));
                dto.setPat_name(rs.getString("pat_name"));
                dto.setPat_phone(rs.getString("pat_phone"));
                dto.setPat_birth(rs.getDate("pat_birth"));
                dto.setPat_gen(rs.getString("pat_gen"));
                dto.setPat_email(rs.getString("pat_email"));
                dto.setPat_addr(rs.getString("pat_addr"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("getPatDTO 오류");
        }
        return dto;
    }
    public boolean addPatient(PatDTO patient) {
        String sql = "INSERT INTO SCOTT.PATIENTS (PAT_NUM, PAT_ID, PAT_PW, PAT_NAME, PAT_PHONE, PAT_BIRTH, PAT_GEN, PAT_EMAIL, PAT_ADDR) " +
                "VALUES (SCOTT.SEQ_BOARD_NUM.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, patient.getPat_id());
            psmt.setString(2, patient.getPat_pw());
            psmt.setString(3, patient.getPat_name());
            psmt.setString(4, patient.getPat_phone());
            psmt.setDate(5,   patient.getPat_birth());
            psmt.setString(6, patient.getPat_gen());
            psmt.setString(7, patient.getPat_email());
            psmt.setString(8, patient.getPat_addr());

            int rowsAffected = psmt.executeUpdate();

            return rowsAffected > 0; // 회원가입이 성공했는지 여부를 반환
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("addPatient 오류");
            return false;
        }
    }
}

