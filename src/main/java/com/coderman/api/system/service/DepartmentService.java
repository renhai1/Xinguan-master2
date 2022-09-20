package com.coderman.api.system.service;

import com.coderman.api.common.pojo.system.Department;
import com.coderman.api.system.vo.DeanVO;
import com.coderman.api.system.vo.DepartmentVO;
import com.coderman.api.system.vo.PageVO;

import java.util.List;

/**
 * 部门Service
 */
public interface DepartmentService {
    //部门列表
    PageVO<DepartmentVO> findDepartmentList(Integer pageNum, Integer pageSize, DepartmentVO departmentVO);

    // 查询所有部门主任
    List<DeanVO> findDeanList();

    // 添加院部门
    void add(DepartmentVO departmentVO);

    //编辑院部门
    DepartmentVO edit(Long id);

    //更新院部门
    void update(Long id, DepartmentVO departmentVO);

    // 删除院部门
    void delete(Long id);

    //所有部门
    List<DepartmentVO> findAllVO();

    // 全部部门
    List<Department> findAll();
}
