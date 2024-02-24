package com.board;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class PhotoBoardDTO{
    private String rbNum;
    private String rbTitle;
    private String rbContents;
    private Date rbPostDate;
    private String rbOfile;
    private String rbSfile;
    private int rbVisitCount;
    private String patNameFk;
    private String patIdFk;

    public PhotoBoardDTO() {

    }
}
