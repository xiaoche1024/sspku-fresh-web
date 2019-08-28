package com.sspku.model;

public class CheckListDO {
    private Integer type;
    private Integer order;
    private String name;
    private String details;

    public CheckListDO(Integer type, Integer order, String name, String details) {
        this.type = type;
        this.order = order;
        this.name = name;
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
}
