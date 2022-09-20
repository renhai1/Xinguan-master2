package com.coderman.api.biz.service;

import com.coderman.api.biz.vo.InStockDetailVO;
import com.coderman.api.biz.vo.InStockVO;
import com.coderman.api.system.vo.PageVO;

public interface InStockService {
    //入库单列表
    PageVO<InStockVO> findInStockList(Integer pageNum, Integer pageSize, InStockVO inStockVO);
    //入库单明细
    InStockDetailVO detail(Long id, int pageNo, int pageSize);
    //删除入库单
    void delete(Long id);
    //物资入库
    void addIntoStock(InStockVO inStockVO);
    //移入回收站
    void remove(Long id);
    //还原从回收站中
    void back(Long id);
    //入库审核
    void publish(Long id);
}
