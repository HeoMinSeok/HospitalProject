package com.membership;

import com.common.DBCoonPool;

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
//    public boolean isDuplicateUserId(String userId) {
//        // 여기에 Doctor 테이블에서 아이디가 중복되는지 확인하는 로직 작성
//        // 중복되면 true, 중복되지 않으면 false 반환
//    }
}
