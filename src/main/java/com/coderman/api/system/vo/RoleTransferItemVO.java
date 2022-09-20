package com.coderman.api.system.vo;

import lombok.Data;

/**
 * 角色转换?
 */
@Data
public class RoleTransferItemVO {
    private Long key;
    private String label;
    private boolean disabled;

    public Long getKey() {
        return key;
    }

    public void setKey(Long key) {
        this.key = key;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public boolean isDisabled() {
        return disabled;
    }

    public void setDisabled(boolean disabled) {
        this.disabled = disabled;
    }
}
