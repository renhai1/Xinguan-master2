package com.coderman.api.system.enums;

/**
 * 角色状态枚举 0 DISABLE 1 AVAILABLE
 */
public enum RoleStatusEnum {
    DISABLE(0),
    AVAILABLE(1);

    private int statusCode;

    RoleStatusEnum(int statusCode) {
        this.statusCode = statusCode;
    }

    public int getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }
}