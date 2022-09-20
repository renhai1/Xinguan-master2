package com.coderman.api.biz.service;

import com.coderman.api.biz.vo.OutStockDetailVO;
import com.coderman.api.biz.vo.OutStockVO;
import com.coderman.api.system.vo.PageVO;

public interface OutStockService {
    //出库单列表
    PageVO<OutStockVO> findOutStockList(Integer pageNum, Integer pageSize, OutStockVO outStockVO);
    //提交物资发放单
    void addOutStock(OutStockVO outStockVO);
    //移入回收站
    void remove(Long id);
    //恢复发放单
    void back(Long id);
    //发放单详情
    OutStockDetailVO detail(Long id, Integer pageNum, Integer pageSize);
    //删除发放单
    void delete(Long id);
    //发放单审核
    void publish(Long id);
}
