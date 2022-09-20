package com.coderman.api.system.vo;

import lombok.Data;

import java.util.List;
import java.util.Set;

/**
 * 用户 权限 部门等信息VO
 */
@Data
public class UserInfoVO {
    private String username;

    private String nickname;

    private String avatar;

    private Set<String> url;

    private Set<String> perms;

    private List<String> roles;

    private String department;

    private Boolean isAdmin = false;
}
