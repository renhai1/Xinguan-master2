package com.coderman.api.system.service;

import com.coderman.api.common.pojo.system.Role;
import com.coderman.api.system.vo.PageVO;
import com.coderman.api.system.vo.RoleVO;

import java.util.List;

/**
 * 角色Service
 */
public interface RoleService {
    //角色列表
    PageVO<RoleVO> findRoleList(Integer pageNum, Integer pageSize, RoleVO roleVO);

    // 添加角色
    void add(RoleVO roleVO);

    //删除角色
    void deleteById(Long id);

    //编辑角色
    RoleVO edit(Long id);

    //更新角色
    void update(Long id, RoleVO roleVO);

    //根据角色状态
    void updateStatus(Long id, Boolean status);

    //查询所有的角色
    List<Role> findAll();

    //查询角色拥有的菜单权限id
    List<Long> findMenuIdsByRoleId(Long id);

    //角色授权
    void authority(Long id, Long[] mids);
}
