package com.sspku.model;

public class StudentInformationDO {
    private String no;
    private String name;
    private Integer sex;
    private String major;
    private String dorm;
    private String email;
    private Integer paymentstatus;

    public StudentInformationDO(String no, String name, Integer sex, String major, String dorm, String email, Integer paymentstatus) {
        this.no = no;
        this.name = name;
        this.sex = sex;
        this.major = major;
        this.dorm = dorm;
        this.email = email;
        this.paymentstatus = paymentstatus;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getDorm() {
        return dorm;
    }

    public void setDorm(String dorm) {
        this.dorm = dorm;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getPaymentstatus() {
        return paymentstatus;
    }

    public void setPaymentstatus(Integer paymentstatus) {
        this.paymentstatus = paymentstatus;
    }
}
