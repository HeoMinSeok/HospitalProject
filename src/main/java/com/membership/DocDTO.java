package com.membership;

public class DocDTO {
    private int doc_num;
    private String doc_id, doc_pw, doc_name, doc_email;

    public DocDTO() {

    }

    public int getDoc_num() {
        return this.doc_num;
    }

    public String getDoc_id() {
        return this.doc_id;
    }

    public String getDoc_pw() {
        return this.doc_pw;
    }

    public String getDoc_name() {
        return this.doc_name;
    }

    public String getDoc_email() {
        return this.doc_email;
    }

    public void setDoc_num(int doc_num) {
        this.doc_num = doc_num;
    }

    public void setDoc_id(String doc_id) {
        this.doc_id = doc_id;
    }

    public void setDoc_pw(String doc_pw) {
        this.doc_pw = doc_pw;
    }

    public void setDoc_name(String doc_name) {
        this.doc_name = doc_name;
    }

    public void setDoc_email(String doc_email) {
        this.doc_email = doc_email;
    }
}
