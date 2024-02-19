package com.membership;

public class MemberDTO {
    private String id;
    private String pass;
    private String name;
    private String regidate;

    public String getId() {
        return this.id;
    }

    public String getPass() {
        return this.pass;
    }

    public String getName() {
        return this.name;
    }

    public String getRegidate() {
        return this.regidate;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setRegidate(String regidate) {
        this.regidate = regidate;
    }
}
