package com.coderman.api.system.service;

import com.coderman.api.common.pojo.system.Log;
import com.coderman.api.system.vo.LogVO;
import com.coderman.api.system.vo.PageVO;
import org.springframework.scheduling.annotation.Async;

import java.util.List;

/**
 * 系统日志Service
 */
public interface LogService {
    //异步保存操作日志
    @Async("CodeAsyncThreadPool")
    //作用在于可以让被标注的方法异步执行
    void saveLog(Log log);

    // 删除登入日志
    void delete(Long id);

    //登入日志列表
    PageVO<LogVO> findLogList(Integer pageNum, Integer pageSize, LogVO logVO);

    // 批量删除登入日志
    void batchDelete(List<Long> list);
}
