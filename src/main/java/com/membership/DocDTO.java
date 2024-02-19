package com.membership;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DocDTO {
    private int doc_num;
    private String doc_id, doc_pw, doc_name, doc_email;
    public DocDTO() {

    }
}
