package com.reservation;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.sql.Timestamp;

@Getter
@Setter
public class AppointDTO {
    private int anum;
    private String pid;
    private String did;
    private Date adate;
    private Timestamp atime;
    private String status;

    public AppointDTO() {

    }

    public AppointDTO(int anum, String pid, String did, Date adate, Timestamp atime, String status) {
        this.anum = anum;
        this.pid = pid;
        this.did = did;
        this.adate = adate;
        this.atime = atime;
        this.status = status;
    }
    public AppointDTO(String pid, String did,Date adate, Timestamp atime){
        this.pid = pid;
        this.did = did;
        this.adate = adate;
        this.atime = atime;
    }
}
