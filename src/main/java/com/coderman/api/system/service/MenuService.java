package com.coderman.api.system.service;

import com.coderman.api.common.pojo.system.Menu;
import com.coderman.api.system.vo.MenuNodeVO;
import com.coderman.api.system.vo.MenuVO;

import java.util.List;

/**
 * 菜单Service
 */
public interface MenuService {
    //获取菜单树
    List<MenuNodeVO> findMenuTree();

    //添加菜单
    Menu add(MenuVO menuVO);

    //删除节点
    void delete(Long id);

    // 编辑节点
    MenuVO edit(Long id);

    //更新节点
    void update(Long id, MenuVO menuVO);

    // 所有展开菜单的ID
    List<Long> findOpenIds();

    //获取所有菜单
    List<Menu> findAll();

}
