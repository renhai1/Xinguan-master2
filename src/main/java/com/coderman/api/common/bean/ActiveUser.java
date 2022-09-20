package com.coderman.api.common.bean;

import com.coderman.api.common.pojo.system.Menu;
import com.coderman.api.common.pojo.system.Role;
import com.coderman.api.common.pojo.system.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor

/**
 * 当前用户bean
 */
public class ActiveUser {
    //当前用户对象
    private User user;
    //当前用户具有的角色
    private List<Role> roles;
    // 当前用户具有的url
    private Set<String> urls;
    //包括url+permission
    private List<Menu> menus;
    //当前用户具有的权限API:例如[user:add],[user:delete]...
    private Set<String> permissions;
    //session id
    private String id;
    //用户id
    private String userId;
    //用户名称
    private String username;
    //用户主机地址
    private String host;
    //用户登录时系统IP
    private String systemHost;
    //状态
    private String status;
    //session创建时间
    private String startTimestamp;
    //session 最后访问时间
    private String lastAccessTime;
    // 超时时间
    private Long timeout;
    // 所在地
    private String location;
    //是否为当前登录用户
    private Boolean current;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public Set<String> getUrls() {
        return urls;
    }

    public void setUrls(Set<String> urls) {
        this.urls = urls;
    }

    public List<Menu> getMenus() {
        return menus;
    }

    public void setMenus(List<Menu> menus) {
        this.menus = menus;
    }

    public Set<String> getPermissions() {
        return permissions;
    }

    public void setPermissions(Set<String> permissions) {
        this.permissions = permissions;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getSystemHost() {
        return systemHost;
    }

    public void setSystemHost(String systemHost) {
        this.systemHost = systemHost;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStartTimestamp() {
        return startTimestamp;
    }

    public void setStartTimestamp(String startTimestamp) {
        this.startTimestamp = startTimestamp;
    }

    public String getLastAccessTime() {
        return lastAccessTime;
    }

    public void setLastAccessTime(String lastAccessTime) {
        this.lastAccessTime = lastAccessTime;
    }

    public Long getTimeout() {
        return timeout;
    }

    public void setTimeout(Long timeout) {
        this.timeout = timeout;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Boolean getCurrent() {
        return current;
    }

    public void setCurrent(Boolean current) {
        this.current = current;
    }
}
