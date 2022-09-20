package com.coderman.api.biz.controller;


import com.coderman.api.biz.service.HealthService;
import com.coderman.api.biz.vo.HealthVO;
import com.coderman.api.common.annotation.ControllerEndpoint;
import com.coderman.api.common.bean.ActiveUser;
import com.coderman.api.common.bean.ResponseBean;
import com.coderman.api.common.pojo.biz.Health;
import com.coderman.api.system.vo.PageVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


@Api(tags = "健康上报接口")
//用在请求的类上，表示对类的说明  tags:说明该类的作用，可以在UI界面上看到的注解
@RestController
//@RestController = @Controller + @ResponseBody
//@Controller使得从该类所在的项目跑起来的过程中，这个类就被实例化
//@ResponseBody指该类中所有的API接口返回的数据，都会以json字符串的形式返回给客户端
@RequestMapping("/health")
//用来映射请求的，即指明处理器可以处理哪些URL请求，该注解既可以用在类上，也可以用在方法上。
//标记控制器类时，方法的请求地址是相对类的请求地址而言的
public class HealthController {

    @Autowired
    //可以对类成员变量、方法及构造函数进行标注，让spring完成bean自动装配的工作
    private HealthService healthService;

    //健康上报
    @ControllerEndpoint(exceptionMessage = "健康上报失败", operation = "健康上报")
    //自定义注解，用于标注在controller的方法上，异步记录日志
    @ApiOperation(value = "健康上报", notes = "用户健康上报")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @RequiresPermissions({"health:report"})
    //有此权限的才可执行下面的方法，否则抛异常
    @PostMapping("/report")
    //用于处理HTTP POST请求，并将请求映射到具体的处理方法中。同GetMapping一样
    public ResponseBean report(@Validated
                               //充满了if-else这种校验代码,代码不够优雅，
                               // 使用spring的javax.validation注解式参数校验，可以免去繁琐的校验。
                               @RequestBody
                                       //将json格式的数据转为Java对象，前端到后端必须是json格式的
                                       HealthVO healthVO) {
        ActiveUser activeUser = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
        //获取当前登录用户信息
        healthVO.setUserId(activeUser.getUser().getId());
        //将健康登记的ID设置为当前登录用户的ID
        healthService.report(healthVO);//健康上报此用户
        return ResponseBean.success();
    }


    //签到记录
    @ApiOperation(value = "健康记录", notes = "用户健康上报历史记录")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @GetMapping("/history")
    //将HTTP GET请求映射到特定的处理方法上
    public ResponseBean history(@RequestParam
                                        //value:请求参数中的名称  defaultValue默认值
                                        //作用是把请求中的指定名称的参数传递给控制器中的形参赋值
                                        (value = "pageNum", defaultValue = "1") Integer pageNum,
                                @RequestParam(value = "pageSize") Integer pageSize) {
        ActiveUser activeUser = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
        Long id = activeUser.getUser().getId();//当前登录用户的ID
        PageVO<Health> Health = healthService.history(id, pageNum, pageSize);//对接数据库签到记录
        return ResponseBean.success(Health);
        //返回是ResponseBean对象  Health 200（表示操作成功） 成功
    }

    //今日是否已报备
    @ApiOperation(value = "是否报备", notes = "今日是否已报备")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @GetMapping("/isReport")
    //将HTTP GET请求映射到特定的处理方法上
    public ResponseBean isReport() {
        ActiveUser activeUser = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
        Health report = healthService.isReport(activeUser.getUser().getId());
        return ResponseBean.success(report);
    }
}
