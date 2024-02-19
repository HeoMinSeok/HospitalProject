package com.membership;

import com.common.DBCoonPool;

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
                dto.setPat_gen(rs.getString("pat_gen"));
                dto.setPat_jumin(rs.getString("pat_jumin"));
                dto.setPat_addr(rs.getString("pat_addr"));
                dto.setPat_phone(rs.getString("pat_phone"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("getPatDTO 오류");
        }
        return dto;
    }
//    public boolean isDuplicateUserId(String userId) {
//        // 여기에 Patient 테이블에서 아이디가 중복되는지 확인하는 로직 작성
//        // 중복되면 true, 중복되지 않으면 false 반환
//    }
}
