package com.coderman.api.system.service;

import com.coderman.api.system.vo.LoginLogVO;
import com.coderman.api.system.vo.PageVO;
import com.coderman.api.system.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 系统登入登出日志记录Service
 */
public interface LoginLogService {
    //添加登入日志
    void add(HttpServletRequest request);

    //删除登入日志
    void delete(Long id);

    //登入日志列表
    PageVO<LoginLogVO> findLoginLogList(Integer pageNum, Integer pageSize, LoginLogVO loginLogVO);

    // 批量删除登入日志
    void batchDelete(List<Long> list);

    // 用户登入报表
    List<Map<String, Object>> loginReport(UserVO userVO);
}
