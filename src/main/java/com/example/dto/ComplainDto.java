package com.example.dto;

public class ComplainDto {
    private String cid;
    private String uname;
    private String description;
    private String date;
    private String status;

    public ComplainDto(String cid, String uname, String description, String date, String status) {
        this.cid = cid;
        this.uname = uname;
        this.description = description;
        this.date = date;
        this.status = status;
    }

    public String getCid() {
        return cid;
    }

    public String getUname() {
        return uname;
    }

    public String getDescription() {
        return description;
    }

    public String getDate() {
        return date;
    }

    public String getStatus() {
        return status;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
