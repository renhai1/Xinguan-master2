package com.coderman.api.biz.service;

import com.coderman.api.biz.vo.SupplierVO;
import com.coderman.api.common.pojo.biz.Supplier;
import com.coderman.api.system.vo.PageVO;

import java.util.List;

public interface SupplierService {
    //添加供应商
    Supplier add(SupplierVO supplierVO);
    //供应商列表
    PageVO<SupplierVO> findSupplierList(Integer pageNum, Integer pageSize, SupplierVO supplierVO);
    //编辑供应商
    SupplierVO edit(Long id);
    //更新供应商
    void update(Long id, SupplierVO supplierVO);
    //删除供应商
    void delete(Long id);
    //查询所有供应商
    List<SupplierVO> findAll();
}
