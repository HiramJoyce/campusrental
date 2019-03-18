package com.campus.rental.domain;

import java.util.Date;

/**
 * @author hiram 2019年03月18日 23:07
 */
public class Trade {
    private String id;
    private String goodId;
    private String fromId;
    private String toId;
    private Date rentTime;
    private double total;
    private double rentLast;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGoodId() {
        return goodId;
    }

    public void setGoodId(String goodId) {
        this.goodId = goodId;
    }

    public String getFromId() {
        return fromId;
    }

    public void setFromId(String fromId) {
        this.fromId = fromId;
    }

    public String getToId() {
        return toId;
    }

    public void setToId(String toId) {
        this.toId = toId;
    }

    public Date getRentTime() {
        return rentTime;
    }

    public void setRentTime(Date rentTime) {
        this.rentTime = rentTime;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getRentLast() {
        return rentLast;
    }

    public void setRentLast(double rentLast) {
        this.rentLast = rentLast;
    }

    @Override
    public String toString() {
        return "Trade{" +
                "id='" + id + '\'' +
                ", goodId='" + goodId + '\'' +
                ", fromId='" + fromId + '\'' +
                ", toId='" + toId + '\'' +
                ", rentTime=" + rentTime +
                ", total=" + total +
                ", rentLast=" + rentLast +
                '}';
    }
}
