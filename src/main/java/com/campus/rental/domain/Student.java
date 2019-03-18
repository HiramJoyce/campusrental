package com.campus.rental.domain;

/**
 * @author hiram 2019年03月18日 23:10
 */
public class Student {
    private String id;
    private String stuNum;
    private String realName;
    private String phone;
    private String weChat;
    private String qq;
    private String password;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStuNum() {
        return stuNum;
    }

    public void setStuNum(String stuNum) {
        this.stuNum = stuNum;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id='" + id + '\'' +
                ", stuNum='" + stuNum + '\'' +
                ", realName='" + realName + '\'' +
                ", phone='" + phone + '\'' +
                ", weChat='" + weChat + '\'' +
                ", qq='" + qq + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
