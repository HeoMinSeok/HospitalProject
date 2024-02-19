package com.membership;

import com.common.DBCoonPool;

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
//    public boolean isDuplicateUserId(String userId) {
//        // 여기에 Coordinator 테이블에서 아이디가 중복되는지 확인하는 로직 작성
//        // 중복되면 true, 중복되지 않으면 false 반환
//    }
}