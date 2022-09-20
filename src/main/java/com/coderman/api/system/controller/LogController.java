package com.coderman.api.system.controller;

import com.coderman.api.common.bean.ResponseBean;
import com.coderman.api.system.service.LogService;
import com.coderman.api.system.vo.LogVO;
import com.coderman.api.system.vo.PageVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Api(tags = "系统日志接口")
//用在请求的类上，表示对类的说明  tags:说明该类的作用，可以在UI界面上看到的注解
@RestController
//@RestController = @Controller + @ResponseBody
//@Controller使得从该类所在的项目跑起来的过程中，这个类就被实例化
//@ResponseBody指该类中所有的API接口返回的数据，都会以json字符串的形式返回给客户端
@RequestMapping("/log")
//用来映射请求的，即指明处理器可以处理哪些URL请求，该注解既可以用在类上，也可以用在方法上。
//标记控制器类时，方法的请求地址是相对类的请求地址而言的
public class LogController {
    @Autowired
    private LogService logService;

    // 日志列表
    @ApiOperation(value = "日志列表", notes = "系统日志列表，模糊查询")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @GetMapping("/findLogList")
    //将HTTP GET请求映射到特定的处理方法上
    public ResponseBean findLogList(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
         //value:请求参数中的名称  defaultValue默认值
         //作用是把请求中的指定名称的参数传递给控制器中的形参赋值(value = "pageNum", defaultValue = "1") Integer pageNum,
                                    @RequestParam(value = "pageSize") Integer pageSize,
                                    LogVO logVO) {
        PageVO<LogVO> logList = logService.findLogList(pageNum, pageSize, logVO);
        return ResponseBean.success(logList);
    }

    //删除日志
    @ApiOperation(value = "删除日志")
    @RequiresPermissions({"log:delete"})
    @DeleteMapping("/delete/{id}")
    //将 HTTP DELETE 请求映射到特定的处理程序方法。
    public ResponseBean delete(@PathVariable
                          //用在参数里用来提取url中的请求参数
                                           Long id) {
        logService.delete(id);
        return ResponseBean.success("删除系统日志成功");
    }

    // 批量删除
    @ApiOperation(value = "批量删除")
    @RequiresPermissions({"log:batchDelete"})
    @DeleteMapping("/batchDelete/{ids}")
    public ResponseBean batchDelete(@PathVariable String ids) {
        String[] idList = ids.split(",");
        List<Long> list = new ArrayList<>();
        if (idList.length > 0) {
            for (String s : idList) {
                list.add(Long.parseLong(s));
            }
        }
        logService.batchDelete(list);
        return ResponseBean.success("批量删除成功");
    }


}