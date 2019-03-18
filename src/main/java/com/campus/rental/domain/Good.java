package com.campus.rental.domain;

import java.util.Date;

/**
 * @author hiram 2019年03月18日 23:01
 */
public class Good {
    private String id;
    private String type;
    private String old; // 新旧程度
    private String title;
    private String content;
    private String name;
    private String img; // 图片名，多个图片名已逗号分隔
    private String phone;
    private String weChat;
    private String qq;
    private double price;
    private int timeUnit; // 0：小时  1：天  2：周  3：月  4：年
    private Date createTIme;
    private String userId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getOld() {
        return old;
    }

    public void setOld(String old) {
        this.old = old;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getWeChat() {
        return weChat;
    }

    public void setWeChat(String weChat) {
        this.weChat = weChat;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getTimeUnit() {
        return timeUnit;
    }

    public void setTimeUnit(int timeUnit) {
        this.timeUnit = timeUnit;
    }

    public Date getCreateTIme() {
        return createTIme;
    }

    public void setCreateTIme(Date createTIme) {
        this.createTIme = createTIme;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Good{" +
                "id='" + id + '\'' +
                ", type='" + type + '\'' +
                ", old='" + old + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", name='" + name + '\'' +
                ", img='" + img + '\'' +
                ", phone='" + phone + '\'' +
                ", weChat='" + weChat + '\'' +
                ", qq='" + qq + '\'' +
                ", price=" + price +
                ", timeUnit=" + timeUnit +
                ", createTIme=" + createTIme +
                ", userId='" + userId + '\'' +
                '}';
    }
}
