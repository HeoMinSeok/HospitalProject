package com.membership;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PatDTO {
    private int pat_num;
    private String pat_id, pat_pw, pat_name, pat_gen ,pat_jumin, pat_addr, pat_phone;

    public PatDTO() {

    }
}
