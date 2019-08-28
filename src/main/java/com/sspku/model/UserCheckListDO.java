package com.sspku.model;

public class UserCheckListDO {
    private Integer student_no;
    private Integer order;
    private String name;
    private String details;
    private Integer status;

    public UserCheckListDO(Integer student_no, Integer order, String name, String details, Integer status) {
        this.student_no = student_no;
        this.order = order;
        this.name = name;
        this.details = details;
        this.status = status;
    }

    public Integer getStudent_no() {
        return student_no;
    }

    public void setStudent_no(Integer student_no) {
        this.student_no = student_no;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
