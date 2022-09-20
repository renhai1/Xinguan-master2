package com.coderman.api.biz.controller;

import com.coderman.api.biz.service.ConsumerService;
import com.coderman.api.biz.vo.ConsumerVO;
import com.coderman.api.common.annotation.ControllerEndpoint;
import com.coderman.api.common.bean.ResponseBean;
import com.coderman.api.system.vo.PageVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 去向管理
 */
@Api(tags = "物资去向接口")
@RestController
@RequestMapping("/consumer")
public class ConsumerController {
    @Autowired
    //可以对类成员变量、方法及构造函数进行标注，让spring完成bean自动装配的工作
    private ConsumerService consumerService;

    //去向列表
    @ApiOperation(value = "去向列表", notes = "去向列表,根据去向名模糊查询")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的
    // value是接口说明   notes是接口发布说明
    @GetMapping("/findConsumerList")

    //将HTTP GET请求映射到特定的处理方法上
    public ResponseBean findConsumerList(@RequestParam(value = "pageNum", defaultValue = "1")
                                                 Integer pageNum,
                                         //value:请求参数中的名称  defaultValue默认值
                                         //作用是把请求中的指定名称的参数传递给控制器中的形参赋值
                                         @RequestParam(value = "pageSize")
                                                 Integer pageSize,
                                         ConsumerVO consumerVO) {
        PageVO<ConsumerVO> consumerVOPageVO = consumerService.findConsumerList(pageNum, pageSize, consumerVO);
        //findConsumerList是物资去向列表
        return ResponseBean.success(consumerVOPageVO);
        //返回是ResponseBean对象  data（表示返回的数据Object类型） 200（表示操作成功） 成功
    }

    //添加去向
    @ControllerEndpoint(exceptionMessage = "物资去向添加失败", operation = "物资去向添加")
    //自定义注解，用于标注在controller的方法上，异步记录日志
    @RequiresPermissions({"consumer:add"})
    //有此权限的才可执行下面的方法，否则抛异常
    @ApiOperation(value = "添加去向")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明
    @PostMapping("/add")
    //用于处理HTTP POST请求，并将请求映射到具体的处理方法中。同GetMapping一样
    public ResponseBean add(@RequestBody
                            //将json格式的数据转为Java对象，前端到后端必须是json格式的
                            @Validated
                                    //充满了if-else这种校验代码,代码不够优雅，
                                    // 使用spring的javax.validation注解式参数校验，可以免去繁琐的校验。
                                    ConsumerVO consumerVO) {
        consumerService.add(consumerVO);
        return ResponseBean.success();
        //返回是ResponseBean对象  null（表示返回的数据Object类型） 200（表示操作成功） Success
    }

    //编辑去向
    @ApiOperation(value = "编辑去向", notes = "编辑去向信息")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的
    // value是接口说明   notes是接口发布说明
    @RequiresPermissions({"consumer:edit"})
    //有此权限的才可执行下面的方法，否则抛异常
    @GetMapping("/edit/{id}")
    //将HTTP GET请求映射到特定的处理方法上
    public ResponseBean edit(@PathVariable
                                     //用在参数里用来提取url中的请求参数
                                     Long id) {
        ConsumerVO consumerVO = consumerService.edit(id);
        // 编辑物资去向
        return ResponseBean.success(consumerVO);
        //返回是ResponseBean对象  data（表示返回的数据Object类型） 200（表示操作成功） 成功
    }

    //更新去向
    @ControllerEndpoint(exceptionMessage = "物资去向更新失败", operation = "物资去向更新")
    //自定义注解，用于标注在controller的方法上，异步记录日志
    @ApiOperation(value = "更新去向", notes = "更新去向信息")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的
    // value是接口说明   notes是接口发布说明
    @RequiresPermissions({"consumer:update"})
    //有此权限的才可执行下面的方法，否则抛异常
    @PutMapping("/update/{id}")
    //用于处理HTTP POST请求，并将请求映射到具体的处理方法中。同GetMapping一样
    public ResponseBean update(@PathVariable Long id,
                               // 用在参数里用来提取url中的请求参数
                               @RequestBody
                               //将json格式的数据转为Java对象，前端到后端必须是json格式的
                               @Validated
                                       //充满了if-else这种校验代码,代码不够优雅，
                                       // 使用spring的javax.validation注解式参数校验，可以免去繁琐的校验。
                                       ConsumerVO consumerVO) {
        consumerService.update(id, consumerVO);
        //更新物资去向
        return ResponseBean.success();
        //返回是ResponseBean对象  null（表示返回的数据Object类型） 200（表示操作成功） Success
    }

    //删除去向
    @ControllerEndpoint(exceptionMessage = "物资去向删除失败", operation = "物资去向删除")
    //自定义注解，用于标注在controller的方法上，异步记录日志
    @ApiOperation(value = "删除去向", notes = "删除去向信息")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的
    // value是接口说明   notes是接口发布说明
    @RequiresPermissions({"consumer:delete"})
    //有此权限的才可执行下面的方法，否则抛异常
    @DeleteMapping("/delete/{id}")
    //将 HTTP DELETE 请求映射到特定的处理程序方法
    public ResponseBean delete(@PathVariable
                                       // 用在参数里用来提取url中的请求参数
                                       Long id) {
        consumerService.delete(id);
        //删除物资去向
        return ResponseBean.success();
        //返回是ResponseBean对象  null（表示返回的数据Object类型） 200（表示操作成功） Success
    }


    // 所有去向
    @ApiOperation(value = "所有去向", notes = "所有去向列表")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的
    // value是接口说明   notes是接口发布说明
    @GetMapping("/findAll")
    //将HTTP GET请求映射到特定的处理方法上
    public ResponseBean findAll() {
        List<ConsumerVO> consumerVOS = consumerService.findAll();
        //查询所有物资去向
        return ResponseBean.success(consumerVOS);
    }
}
