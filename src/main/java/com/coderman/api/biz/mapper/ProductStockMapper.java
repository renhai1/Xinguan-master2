package com.coderman.api.biz.mapper;

import com.coderman.api.biz.vo.ProductStockVO;
import com.coderman.api.biz.vo.ProductVO;
import com.coderman.api.common.pojo.biz.ProductStock;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ProductStockMapper extends Mapper<ProductStock> {

    //库存列表
    List<ProductStockVO> findProductStocks(ProductVO productVO);

    // 库存信息(饼图使用)
    List<ProductStockVO> findAllStocks(ProductVO productVO);
}
