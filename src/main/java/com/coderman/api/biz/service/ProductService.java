package com.coderman.api.biz.service;

import com.coderman.api.biz.vo.ProductStockVO;
import com.coderman.api.biz.vo.ProductVO;
import com.coderman.api.system.vo.PageVO;

import java.util.List;

public interface ProductService {
    //添加商品
   void add(ProductVO productVO);
    //商品列表
    PageVO<ProductVO> findProductList(Integer pageNum, Integer pageSize, ProductVO productVO);
    //编辑商品
    ProductVO edit(Long id);
    //更新商品
    void update(Long id, ProductVO productVO);
    //删除商品
    void delete(Long id);
    //库存列表
    PageVO<ProductStockVO> findProductStocks(Integer pageNum, Integer pageSize, ProductVO productVO);
    //所有库存信息
    List<ProductStockVO> findAllStocks(Integer pageNum, Integer pageSize, ProductVO productVO);
    //移入回收站
    void remove(Long id);
    //从回收站恢复数据
    void back(Long id);
    //物资添加审核
    void publish(Long id);


}
