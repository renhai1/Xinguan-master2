package com.coderman.api.biz.controller;

import com.coderman.api.biz.service.ConsumerService;
import com.coderman.api.biz.service.OutStockService;
import com.coderman.api.biz.vo.ConsumerVO;
import com.coderman.api.biz.vo.OutStockDetailVO;
import com.coderman.api.biz.vo.OutStockVO;
import com.coderman.api.common.annotation.ControllerEndpoint;
import com.coderman.api.common.bean.ResponseBean;
import com.coderman.api.common.pojo.biz.Consumer;
import com.coderman.api.system.vo.PageVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Api(tags = "物资出库接口")
//用在请求的类上，表示对类的说明  tags:说明该类的作用，可以在UI界面上看到的注解
@RestController
//@RestController = @Controller + @ResponseBody
//@Controller使得从该类所在的项目跑起来的过程中，这个类就被实例化
//@ResponseBody指该类中所有的API接口返回的数据，都会以json字符串的形式返回给客户端
@RequestMapping("/outStock")
//用来映射请求的，即指明处理器可以处理哪些URL请求，该注解既可以用在类上，也可以用在方法上。
//标记控制器类时，方法的请求地址是相对类的请求地址而言的
public class OutStockController {

    @Autowired
    //可以对类成员变量、方法及构造函数进行标注，让spring完成bean自动装配的工作
    private OutStockService outStockService;//物资发放单
    @Autowired
    private ConsumerService consumerService;//物资去向

    //提交物资发放单
    @ControllerEndpoint(exceptionMessage = "发放单申请失败", operation = "发放单申请")
    //自定义注解，用于标注在controller的方法上，异步记录日志
    @ApiOperation("提交发放单")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @PostMapping("/addOutStock")
    // 用于处理请求方法的 POST*类型等。
    @RequiresPermissions({"outStock:out"})
    //有此权限的才可执行下面的方法，否则抛异常
    public ResponseBean addOutStock(@RequestBody
                 //将json格式的数据转为Java对象，前端到后端必须是json格式的
                                        @Validated
                 //充满了if-else这种校验代码,代码不够优雅，
                 // 使用spring的javax.validation注解式参数校验，可以免去繁琐的校验。
                                                OutStockVO outStockVO){
        if(outStockVO.getConsumerId()==null){
            //说明现在添加物资来源
            ConsumerVO consumerVO = new ConsumerVO();
            BeanUtils.copyProperties(outStockVO,consumerVO);//把两个对象中相同字段进行赋值。
            if("".equals(consumerVO.getName())||consumerVO.getName()==null){
                return ResponseBean.error("物资去向名不能为空");
            }
            if("".equals(consumerVO.getContact())||consumerVO.getContact()==null){
                return ResponseBean.error("联系人不能为空");
            }
            if("".equals(consumerVO.getAddress())||consumerVO.getAddress()==null){
                return ResponseBean.error("地址不能为空");
            }
            if("".equals(consumerVO.getPhone())||consumerVO.getPhone()==null){
                return ResponseBean.error("联系方式不能为空");
            }
            if(consumerVO.getSort()==null){
                return ResponseBean.error("排序不能为空");
            }
            Consumer consumer = consumerService.add(consumerVO);//添加物资去向
            outStockVO.setConsumerId(consumer.getId());
        }
        outStockService.addOutStock(outStockVO);//提交物资发放单
        return ResponseBean.success();
    }

    //发放单列表
    @ApiOperation(value = "出库单列表")//不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @GetMapping("/findOutStockList")//将HTTP GET请求映射到特定的处理方法上
    public ResponseBean findInStockList(
            @RequestParam
                    //value:请求参数中的名称  defaultValue默认值
                    //作用是把请求中的指定名称的参数传递给控制器中的形参赋值
                    (value = "pageNum", defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize") Integer pageSize,
            OutStockVO outStockVO) {
        PageVO<OutStockVO> outStockList = outStockService.findOutStockList(pageNum, pageSize, outStockVO);//出库单列表
        return ResponseBean.success(outStockList);
    }


    //移入回收站
    @ControllerEndpoint(exceptionMessage = "发放单回收失败", operation = "发放单回收")//自定义注解，用于标注在controller的方法上，异步记录日志
    @ApiOperation(value = "移入回收站", notes = "移入回收站")//不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @RequiresPermissions({"outStock:remove"}) //有此权限的才可执行下面的方法，否则抛异常
    @PutMapping("/remove/{id}")//用于处理HTTP POST请求，并将请求映射到具体的处理方法中。同GetMapping一样
    public ResponseBean remove(@PathVariable
                                           //用在参数里用来提取url中的请求参数
                                           Long id) {
        outStockService.remove(id);
        return ResponseBean.success();
    }


    //物资发放单详细
    @RequiresPermissions({"outStock:detail"})//有此权限的才可执行下面的方法，否则抛异常
    @ApiOperation(value = "发放单明细")//不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @GetMapping("/detail/{id}")//将HTTP GET请求映射到特定的处理方法上
    public ResponseBean detail(@PathVariable
                                           //用在参数里用来提取url中的请求参数
                                           Long id,
                               @RequestParam
                                       //value:请求参数中的名称  defaultValue默认值
                                       //作用是把请求中的指定名称的参数传递给控制器中的形参赋值
                                       (value = "pageNum", defaultValue = "1") Integer pageNum,
                               @RequestParam(value = "pageSize",defaultValue = "3") Integer pageSize) {
        OutStockDetailVO detail = outStockService.detail(id,pageNum,pageSize);//发放单详情
        return ResponseBean.success(detail);
    }


    //删除物资发放单
    @ControllerEndpoint(exceptionMessage = "发放单删除失败", operation = "发放单删除")//自定义注解，用于标注在controller的方法上，异步记录日志
    @RequiresPermissions({"outStock:delete"})//有此权限的才可执行下面的方法，否则抛异常
    @ApiOperation(value = "删除物资发放单")//不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @GetMapping("/delete/{id}")//将HTTP GET请求映射到特定的处理方法上
    public ResponseBean delete(@PathVariable
                                           //用在参数里用来提取url中的请求参数
                                           Long id) {
        outStockService.delete(id);//删除发放单
        return ResponseBean.success();
    }

    //发放审核
    @ControllerEndpoint(exceptionMessage = "发放单审核失败", operation = "发放单审核")//自定义注解，用于标注在controller的方法上，异步记录日志
    @ApiOperation(value = "入库审核")//不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @PutMapping("/publish/{id}")//用于处理HTTP POST请求，并将请求映射到具体的处理方法中。同GetMapping一样
    @RequiresPermissions({"outStock:publish"})//有此权限的才可执行下面的方法，否则抛异常
    public ResponseBean publish(@PathVariable
                                            //用在参数里用来提取url中的请求参数
                                            Long id) {
        outStockService.publish(id);//发放审核
        return ResponseBean.success();
    }


    //恢复数据从回收站
    @ControllerEndpoint(exceptionMessage = "发放单恢复失败", operation = "发放单恢复")//自定义注解，用于标注在controller的方法上，异步记录日志
    @ApiOperation(value = "恢复数据", notes = "从回收站中恢复入库单")//不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @RequiresPermissions({"outStock:back"})//有此权限的才可执行下面的方法，否则抛异常
    @PutMapping("/back/{id}")//用于处理HTTP POST请求，并将请求映射到具体的处理方法中。同GetMapping一样
    public ResponseBean back(@PathVariable
                                         //用在参数里用来提取url中的请求参数
                                         Long id) {
        outStockService.back(id); //恢复发放单从回收站
        return ResponseBean.success();
    }



}
