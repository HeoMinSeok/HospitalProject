package com.board;

import com.common.DBCoonPool;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class PhotoBoardDTO extends DBCoonPool {
    private int rbNum;
    private String rbTitle;
    private String rbContents;
    private Date rbPostDate;
    private String rbOfile;
    private String rbSfile;
    private int rbVisitCount;
    private int patNumFk;

    public PhotoBoardDTO() {

    }
    public PhotoBoardDTO(int rbNum, String rbTitle, String rbContents, Date rbPostDate, String rbOfile, String rbSfile, int rbVisitCount, int patNumFk) {
        this.rbNum = rbNum;
        this.rbTitle = rbTitle;
        this.rbContents = rbContents;
        this.rbPostDate = rbPostDate;
        this.rbOfile = rbOfile;
        this.rbSfile = rbSfile;
        this.rbVisitCount = rbVisitCount;
        this.patNumFk = patNumFk;
    }
}
