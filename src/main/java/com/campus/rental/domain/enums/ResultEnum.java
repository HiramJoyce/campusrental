package com.campus.rental.domain.enums;

/**
 * @author caohailiang
 * 返回结果类型枚举
 * code规则：成功为1，失败为0，后续改为不同状态码对应不同的提示
 */
public enum ResultEnum {
    SUCCESS(1, "成功"),
    ERROR(0, "失败"),
    NOT_LOGIN(0, "未登录，请先登录"),
    NOT_SUPPORT_TYPE(0, "不支持的类型"),
    LOGIN_EXPIRY(0, "登录失效，请重新登陆"),
    PERMISSION_DENIED(0, "没有权限"),
    // trade相关
    TRADE_VERSION_NOT_NEWEST(0, "交易版本不是最新的"),
    ADD_TRADE_FAIL(0, "新增交易失败"),
    UPDATE_TRADE_FAIL(0, "修改交易失败"),
    TRADE_PENDING_DELETED(0, "交易待删或已删除"),
    TRADE_NOT_EXISTS(0, "交易不存在"),
    TRADE_VERIFY_REPEAT(0, "重复复核"),
    OPERATION_NOT_PERMITTED(0, "操作不被允许"),
    NO_DATA(0, "暂无数据"),
    EXPIRED_DEAL(0, "The deal has expired. Please check the latest deal before operation!"),
    ;

    private Integer code;
    private String msg;

    ResultEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
