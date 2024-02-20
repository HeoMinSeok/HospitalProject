package com.membership;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;


@Getter
@Setter
public class PatDTO {
    private int pat_num; // 환자 번호
    private String pat_id; // 환자 아이디
    private String pat_pw; // 환자 비밀번호
    private String pat_name; // 환자 이름
    private String pat_gen; // 환자 성별
    private Date pat_birth; // 환자 생년월일
    private String pat_addr; // 환자 주소
    private String pat_phone; // 환자 전화번호
    private String pat_email;

    // 기본 생성자
    public PatDTO() {
    }

    // 전체 필드를 받는 생성자
    public PatDTO(String pat_id, String pat_pw, String pat_name, String pat_phone, Date pat_birth, String pat_gen, String pat_email, String pat_addr) {
        this.pat_id = pat_id;
        this.pat_pw = pat_pw;
        this.pat_name = pat_name;
        this.pat_gen = pat_gen;
        this.pat_birth = pat_birth;
        this.pat_addr = pat_addr;
        this.pat_phone = pat_phone;
        this.pat_email = pat_email;
    }
}
