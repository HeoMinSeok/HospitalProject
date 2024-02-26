package com.emrboard;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class EmrDTO {
    private int eNum;
    private String eContents;
    private String eDocId;
    private String ePatId;
    private String ePmh;
    private Date eDate;

    public EmrDTO() {
    }
}
