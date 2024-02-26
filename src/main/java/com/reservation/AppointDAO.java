package com.reservation;

import com.common.DBCoonPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AppointDAO extends DBCoonPool {
    public AppointDAO() {
        super();
    }
    public int addAppoint(AppointDTO dto) {
        int result = 0;
        try {
            String sql = "INSERT INTO SCOTT.APPOINT (ANUM, PID, DID, ADATE, ATIME, STATUS) " +
                    "VALUES (SCOTT.SEQ_APPOINT_NUM.nextval, ?, ?, ?, ?, DEFAULT)";

            psmt = con.prepareStatement(sql);
            psmt.setString(1, dto.getPid());
            psmt.setString(2, dto.getDid());
            psmt.setDate(3, dto.getAdate());
            psmt.setTimestamp(4, dto.getAtime());

            result = psmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("예약 도중 오류 발생");
        }
        return result;
    }
    public List<AppointDTO> getMy(String doctorId) {
        List<AppointDTO> myPatients = new ArrayList<>();
        String sql = "SELECT * FROM SCOTT.APPOINT WHERE dId = ?";

        try {
            PreparedStatement psmt = con.prepareStatement(sql);
            psmt.setString(1, doctorId);
            ResultSet rs = psmt.executeQuery();

            while (rs.next()) {
                AppointDTO dto = new AppointDTO();
                dto.setAnum(rs.getInt("anum"));
                dto.setPid(rs.getString("pid"));
                dto.setAdate(rs.getDate("adate"));
                dto.setAtime(rs.getTimestamp("atime"));
                dto.setStatus(rs.getString("status"));

                myPatients.add(dto);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return myPatients;
    }
    public List<AppointDTO> getAppoint(String patId) {
        List<AppointDTO> myAppoint = new ArrayList<>();
        String sql = "SELECT * FROM SCOTT.APPOINT WHERE pId = ?";

        try {
            PreparedStatement psmt = con.prepareStatement(sql);
            psmt.setString(1, patId);
            ResultSet rs = psmt.executeQuery();

            while (rs.next()) {
                AppointDTO dto = new AppointDTO();
                dto.setAnum(rs.getInt("anum"));
                dto.setDid(rs.getString("did"));
                dto.setAdate(rs.getDate("adate"));
                dto.setAtime(rs.getTimestamp("atime"));
                dto.setStatus(rs.getString("status"));

                myAppoint.add(dto);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return myAppoint;
    }
}
