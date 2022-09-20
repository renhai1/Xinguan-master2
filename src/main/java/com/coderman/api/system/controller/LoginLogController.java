package com.coderman.api.system.controller;

import com.coderman.api.common.annotation.ControllerEndpoint;
import com.coderman.api.common.bean.ResponseBean;
import com.coderman.api.system.service.LoginLogService;
import com.coderman.api.system.vo.LoginLogVO;
import com.coderman.api.system.vo.PageVO;
import com.coderman.api.system.vo.UserVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(tags = "登入日志接口")
//用在请求的类上，表示对类的说明  tags:说明该类的作用，可以在UI界面上看到的注解
@RestController
//@RestController = @Controller + @ResponseBody
//@Controller使得从该类所在的项目跑起来的过程中，这个类就被实例化
//@ResponseBody指该类中所有的API接口返回的数据，都会以json字符串的形式返回给客户端
@RequestMapping("/loginLog")
//用来映射请求的，即指明处理器可以处理哪些URL请求，该注解既可以用在类上，也可以用在方法上。
//标记控制器类时，方法的请求地址是相对类的请求地址而言的
public class LoginLogController {
    @Autowired
    private LoginLogService loginLogService;

    //日志列表
    @ApiOperation(value = "日志列表", notes = "登入日志列表，模糊查询")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @GetMapping("/findLoginLogList")
    //将HTTP GET请求映射到特定的处理方法上
    public ResponseBean findLoginLogList(@RequestParam
                         //value:请求参数中的名称  defaultValue默认值
                        //作用是把请求中的指定名称的参数传递给控制器中的形参赋值(value = "pageNum", defaultValue = "1") Integer pageNum,
                                                     (value = "pageNum", defaultValue = "1") Integer pageNum,
                                         @RequestParam(value = "pageSize") Integer pageSize,
                                         LoginLogVO loginLogVO) {
        PageVO<LoginLogVO> loginLogList = loginLogService.findLoginLogList(pageNum, pageSize, loginLogVO);
        return ResponseBean.success(loginLogList);
    }

    // 删除日志
    @ControllerEndpoint(exceptionMessage = "删除登入日志失败", operation = "删除登入日志")
    //自定义注解，用于标注在controller的方法上，异步记录日志
    @ApiOperation(value = "删除日志")
    @RequiresPermissions({"loginLog:delete"})
    @DeleteMapping("/delete/{id}")
    public ResponseBean delete(@PathVariable Long id) {
        loginLogService.delete(id);
        return ResponseBean.success();
    }

    // 批量删除
    @ControllerEndpoint(exceptionMessage = "批量删除登入日志失败", operation = "批量删除登入日志")
    @ApiOperation(value = "批量删除")
    @RequiresPermissions({"loginLog:batchDelete"})
    @DeleteMapping("/batchDelete/{ids}")
    public ResponseBean batchDelete(@PathVariable String ids) {
        String[] idList = ids.split(",");
        List<Long> list = new ArrayList<>();
        if (idList.length > 0) {
            for (String s : idList) {
                list.add(Long.parseLong(s));
            }
        }
        loginLogService.batchDelete(list);
        return ResponseBean.success();
    }

    // 登入报表
    @PostMapping("/loginReport")
    //用于处理HTTP POST请求，并将请求映射到具体的处理方法中。同GetMapping一样
    @ApiOperation(value = "登入报表",notes = "用户登入报表")
    public ResponseBean loginReport(@RequestBody UserVO userVO){
        List<Map<String,Object>> mapList= loginLogService.loginReport(userVO);
        Map<String,Object> map=new HashMap<>();
        userVO.setUsername(null);
        List<Map<String,Object>> meList= loginLogService.loginReport(userVO);
        map.put("me",mapList);
        map.put("all",meList);
        return ResponseBean.success(map);
    }


}
