package com.emrboard;

import com.common.DBCoonPool;

public class EmrDAO extends DBCoonPool {
    public EmrDAO () {
        super();
    }
    public int writeChart(EmrDTO dto) {
        int result = 0;

        try{
            String sql = "INSERT INTO SCOTT.EMR(ENUM, ECONTENTS, EDOCID, EPATID, EPMH) " +
                    "VALUES (SCOTT.SEQ_EMR_NUM.nextval, ?, ?, ?, ?)";

            psmt = con.prepareStatement(sql);
            psmt.setString(1, dto.getEContents());
            psmt.setString(2, dto.getEDocId());
            psmt.setString(3, dto.getEPatId());
            psmt.setString(4, dto.getEPmh());

            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("차트 작성 중 오류 발생");
        }
        return result;
    }

}
