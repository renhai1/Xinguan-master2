package com.coderman.api.system.service;

import com.coderman.api.common.pojo.system.Menu;
import com.coderman.api.common.pojo.system.Role;
import com.coderman.api.common.pojo.system.User;
import com.coderman.api.system.vo.*;

import java.util.List;

/**
 * 用户Service
 */
public interface UserService {

    //根据用户名查询用户
    User findUserByName(String name);

    // 查询用户角色
    List<Role> findRolesById(Long id);

    //根据用户角色查询用户的菜单
    //菜单: menu+button
    List<Menu> findMenuByRoles(List<Role> roles);

    // 加载菜单
    List<MenuNodeVO> findMenu();

    //用户列表
    PageVO<UserVO> findUserList(Integer pageNum, Integer pageSize, UserVO userVO);

    // 删除用户
    void deleteById(Long id);

    // 更新状态
    void updateStatus(Long id, Boolean status);

    //添加用户
    void add(UserVO userVO);

    //更新用户
    void update(Long id, UserEditVO userVO);

    // 编辑用户
    UserEditVO edit(Long id);

    // 已拥有的角色ids
    List<Long> roles(Long id);

    //分配角色
    void assignRoles(Long id, Long[] rids);

    //所有用户
    List<User> findAll();

    //用户登入
    String login(String username, String password);

    //用户详情
    UserInfoVO info();


}
