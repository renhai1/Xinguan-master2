package com.coderman.api.system.mapper;

import com.coderman.api.common.pojo.system.LoginLog;
import com.coderman.api.system.vo.UserVO;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.Map;

public interface LoginLogMapper extends Mapper<LoginLog> {

    //用户登入报表
    List<Map<String,Object>> userLoginReport(UserVO userVO);

}