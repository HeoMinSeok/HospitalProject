package com.membership;

import com.common.DBCoonPool;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


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
    public PatDTO getPatients(String PatientId) {
        PatDTO dto = new PatDTO();
        String sql = "SELECT * FROM SCOTT.PATIENTS WHERE PAT_ID = ?";

        try {
            PreparedStatement psmt = con.prepareStatement(sql);
            psmt.setString(1, PatientId);
            ResultSet rs = psmt.executeQuery();

            while (rs.next()){

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
            System.out.println("getPatients 오류");
        }
       return dto;
    }
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;

        String query = "SELECT COUNT(*) FROM scott.patients";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchFiled") + " "
                    + " LIKE '%" + map.get("searchWord") + "%'";

        }
        //SELECT COUNT(*) FROM board_jsp
        //WHERE title Like '%검색어%';
        //2.조건 반환
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Pat selectCount 오류발생"+ e.getMessage());
        }
        return totalCount;
    }
    public List<PatDTO> selectListPage(Map<String, Object> map) {
        //쿼리 결과를 담을 변수
        List<PatDTO> bbs = new ArrayList<PatDTO>();

        //쿼리문 작성
        String query = "SELECT * FROM ("
                + " SELECT Tb.*, ROWNUM rNum FROM ("
                + " SELECT * FROM scott.patients";

        if(map.get("searchWord") != null){
            query += " WHERE " + map.get("searchFiled") + " "
                    +" LIKE '%" + map.get("searchWord") + "%'";

        }
        query += " ORDER BY pat_num desc"
                + " ) Tb"
                + " )"
                +" WHERE rNUM BETWEEN ? AND ?";

        try{
            psmt = con.prepareStatement(query);
            psmt.setString(1,map.get("start").toString());
            psmt.setString(2,map.get("end").toString());
            rs=psmt.executeQuery();

            while(rs.next()){
                PatDTO dto = new PatDTO();
                //한 row의 내용을 DTO에 저장
                dto.setPat_num(rs.getInt("pat_num"));
                dto.setPat_id(rs.getString("pat_id"));
                dto.setPat_pw(rs.getString("pat_pw"));
                dto.setPat_name(rs.getString("pat_name"));
                dto.setPat_gen(rs.getString("pat_gen"));
                dto.setPat_birth(rs.getDate("pat_birth"));
                dto.setPat_phone(rs.getString("pat_phone"));
                dto.setPat_email(rs.getString("pat_email"));
                dto.setPat_addr(rs.getString("pat_addr"));

                bbs.add(dto);

            }
        }catch (Exception e){
            System.out.println("PatList 게시물 조회 중 예외발생");
            e.printStackTrace();
        }
        return bbs;
    }
    public PatDTO selectById(String pat_id) {
        PatDTO dto = new PatDTO();

        try {
            // 데이터베이스 조회 로직
            String sql = "SELECT * FROM scott.patients WHERE PAT_ID = ?";

            // PreparedStatement 객체 생성
            try (PreparedStatement psmt = con.prepareStatement(sql)) {
                // SQL 쿼리에 파라미터 값 설정
                psmt.setString(1, pat_id);

                // 쿼리 실행 및 결과셋 가져오기
                try (ResultSet rs = psmt.executeQuery()) {
                    // 결과가 있다면
                    if (rs.next()) {
                        dto.setPat_num(rs.getInt("pat_num"));
                        dto.setPat_id(rs.getString("pat_id"));
                        dto.setPat_pw(rs.getString("pat_pw"));
                        dto.setPat_name(rs.getString("pat_name"));
                        dto.setPat_gen(rs.getString("pat_gen"));
                        dto.setPat_birth(rs.getDate("pat_birth"));
                        dto.setPat_phone(rs.getString("pat_phone"));
                        dto.setPat_email(rs.getString("pat_email"));
                        dto.setPat_addr(rs.getString("pat_addr"));

                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("환자 selectById 오류 발생");
        }

        return dto;
    }
    public int updatePat(PatDTO dto) {
        int result = 0;

        try {
            // 데이터베이스 업데이트 로직
            String sql = "UPDATE scott.patients"
                    + " SET pat_pw=?, pat_name=?, pat_phone=?, pat_birth=?, pat_gen=?, pat_email=?, pat_addr=?"
                    + " WHERE pat_num =?";
            try (PreparedStatement psmt = con.prepareStatement(sql)) {
                psmt.setString(1, dto.getPat_pw());
                psmt.setString(2, dto.getPat_name());
                psmt.setString(3, dto.getPat_phone());
                psmt.setDate(4, dto.getPat_birth());
                psmt.setString(5, dto.getPat_gen());
                psmt.setString(6, dto.getPat_email());
                psmt.setString(7, dto.getPat_addr());
                psmt.setInt(8, dto.getPat_num());

                // 쿼리 실행 및 결과 처리
                result = psmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("환자 정보 업데이트 중 오류 발생");
        }

        return result;
    }
    public int deletePat(String pat_id){
        int result = 0;

        try{
            String sql = "DELETE FROM SCOTT.PATIENTS WHERE PAT_ID =?";
            psmt = con.prepareStatement(sql);
            psmt.setString(1, pat_id);
            result = psmt.executeUpdate();

        }catch (Exception e){
            System.out.println("환자 정보 삭제 중 오류 발생");
            e.printStackTrace();
        }
        return result;
    }
}

