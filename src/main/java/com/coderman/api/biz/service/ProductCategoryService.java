package com.coderman.api.biz.service;

import com.coderman.api.biz.vo.ProductCategoryTreeNodeVO;
import com.coderman.api.biz.vo.ProductCategoryVO;
import com.coderman.api.system.vo.PageVO;

import java.util.List;

public interface ProductCategoryService {
    //添加物资类别
    void add(ProductCategoryVO ProductCategoryVO);
    //部门列表
    PageVO<ProductCategoryVO> findProductCategoryList(Integer pageNum, Integer pageSize, ProductCategoryVO ProductCategoryVO);
    //编辑物资类别
    ProductCategoryVO edit(Long id);
    //更新物资类别
    void update(Long id, ProductCategoryVO ProductCategoryVO);
    //删除物资类别
    void delete(Long id);
    //查询所有物资类别
    List<ProductCategoryVO> findAll();
    //分类树形
    PageVO<ProductCategoryTreeNodeVO> categoryTree(Integer pageNum, Integer pageSize);
    //获取父级分类（2级树）
    List<ProductCategoryTreeNodeVO> getParentCategoryTree();
}
