package com.sspku.model;

import java.sql.Timestamp;

public class ProcessDO {
    private Integer type;
    private Integer order;
    private Timestamp time;
    private String activity;
    private String address;
    private String details;

    public ProcessDO(Integer type, Integer order, Timestamp time, String activity, String address, String details) {
        this.type = type;
        this.order = order;
        this.time = time;
        this.activity = activity;
        this.address = address;
        this.details = details;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }
}
