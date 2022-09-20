package com.coderman.api.biz.controller;

import com.coderman.api.common.pojo.biz.Supplier;
import com.coderman.api.biz.service.InStockService;
import com.coderman.api.biz.service.SupplierService;
import com.coderman.api.biz.vo.InStockDetailVO;
import com.coderman.api.biz.vo.InStockVO;
import com.coderman.api.biz.vo.SupplierVO;
import com.coderman.api.common.annotation.ControllerEndpoint;
import com.coderman.api.common.bean.ResponseBean;
import com.coderman.api.system.vo.PageVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Api(tags = "物资入库接口")
//用在请求的类上，表示对类的说明  tags:说明该类的作用，可以在UI界面上看到的注解
@RestController
//@RestController = @Controller + @ResponseBody
//@Controller使得从该类所在的项目跑起来的过程中，这个类就被实例化
//@ResponseBody指该类中所有的API接口返回的数据，都会以json字符串的形式返回给客户端
@RequestMapping("/inStock")
//用来映射请求的，即指明处理器可以处理哪些URL请求，该注解既可以用在类上，也可以用在方法上。
//标记控制器类时，方法的请求地址是相对类的请求地址而言的
public class InStockController {
    @Autowired
    //可以对类成员变量、方法及构造函数进行标注，让spring完成bean自动装配的工作
    private InStockService inStockService;

    @Autowired
    private SupplierService supplierService;

    //入库单列表
    @ApiOperation(value = "入库单列表")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @GetMapping("/findInStockList")
    //将HTTP GET请求映射到特定的处理方法上
    public ResponseBean findInStockList(
            @RequestParam
                    //value:请求参数中的名称  defaultValue默认值
                    //作用是把请求中的指定名称的参数传递给控制器中的形参赋值
                    (value = "pageNum", defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize") Integer pageSize,
            InStockVO inStockVO) {
        PageVO<InStockVO> inStockList = inStockService.findInStockList(pageNum, pageSize, inStockVO); //入库单列表
        return ResponseBean.success(inStockList);
        //返回是ResponseBean对象  data（表示返回的数据Object类型） 200（表示操作成功） 成功
    }


    //物资入库
    @ControllerEndpoint(exceptionMessage = "入库单申请失败", operation = "入库单申请")
    //自定义注解，用于标注在controller的方法上，异步记录日志
    @ApiOperation(value = "物资入库")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @PostMapping("/addIntoStock")
    // 用于处理请求方法的 POST*类型等。
    @RequiresPermissions({"inStock:in"})
    //有此权限的才可执行下面的方法，否则抛异常
    public ResponseBean addIntoStock(@RequestBody
                        //将json格式的数据转为Java对象，前端到后端必须是json格式的
                                         @Validated
                        //充满了if-else这种校验代码,代码不够优雅，
                       // 使用spring的javax.validation注解式参数校验，可以免去繁琐的校验。
                                                 InStockVO inStockVO) {
        if(inStockVO.getSupplierId()==null){
            //说明现在添加物资来源
            SupplierVO supplierVO = new SupplierVO();
            BeanUtils.copyProperties(inStockVO,supplierVO);
            //把两个对象中相同字段进行赋值。
            if("".equals(supplierVO.getName())||supplierVO.getName()==null){
                return ResponseBean.error("物资提供方名不能为空");
            }
            if("".equals(supplierVO.getEmail())||supplierVO.getEmail()==null){
                return ResponseBean.error("邮箱不能为空");
            }
            if("".equals(supplierVO.getContact())||supplierVO.getContact()==null){
                return ResponseBean.error("联系人不能为空");
            }
            if("".equals(supplierVO.getAddress())||supplierVO.getAddress()==null){
                return ResponseBean.error("地址不能为空");
            }
            if("".equals(supplierVO.getPhone())||supplierVO.getPhone()==null){
                return ResponseBean.error("联系方式不能为空");
            }
            if(supplierVO.getSort()==null){
                return ResponseBean.error("排序不能为空");
            }
            Supplier supplier = supplierService.add(supplierVO);
            inStockVO.setSupplierId(supplier.getId());
        }
        inStockService.addIntoStock(inStockVO);  //物资入库
        return ResponseBean.success();
        //返回是ResponseBean对象  NULL 200（表示操作成功） 成功
    }

    //入库审核
    @ControllerEndpoint(exceptionMessage = "入库单审核失败", operation = "入库单审核")
    //自定义注解，用于标注在controller的方法上，异步记录日志
    @ApiOperation(value = "入库审核")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @PutMapping("/publish/{id}")
    //用于处理HTTP POST请求，并将请求映射到具体的处理方法中。同GetMapping一样
    @RequiresPermissions({"inStock:publish"})
    //有此权限的才可执行下面的方法，否则抛异常
    public ResponseBean publish(@PathVariable
                        //用在参数里用来提取url中的请求参数
                                            Long id) {
        inStockService.publish(id); //入库审核
        return ResponseBean.success();//返回是ResponseBean对象  NULL 200（表示操作成功） 成功
    }


    //物资入库单详细
    @RequiresPermissions({"inStock:detail"})//有此权限的才可执行下面的方法，否则抛异常
    @ApiOperation(value = "入库单明细")//不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @GetMapping("/detail/{id}") //将HTTP GET请求映射到特定的处理方法上
    public ResponseBean detail(@PathVariable Long id,//用在参数里用来提取url中的请求参数
                               @RequestParam
                       //value:请求参数中的名称  defaultValue默认值
                     //作用是把请求中的指定名称的参数传递给控制器中的形参赋值
                                       (value = "pageNum", defaultValue = "1") Integer pageNum,
                               @RequestParam(value = "pageSize",defaultValue = "3") Integer pageSize) {
        InStockDetailVO detail = inStockService.detail(id,pageNum,pageSize);//入库单明细
        return ResponseBean.success(detail);
    }

    //删除物资入库单
    @ControllerEndpoint(exceptionMessage = "入库单删除失败", operation = "入库单删除") //自定义注解，用于标注在controller的方法上，异步记录日志
    @RequiresPermissions({"inStock:delete"})//有此权限的才可执行下面的方法，否则抛异常
    @ApiOperation(value = "删除物资入库单")//不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @GetMapping("/delete/{id}")//将HTTP GET请求映射到特定的处理方法上
    public ResponseBean delete(@PathVariable
                    //用在参数里用来提取url中的请求参数
                                           Long id) {
        inStockService.delete(id);//删除入库单
        return ResponseBean.success();
    }

    //移入回收站
    @ControllerEndpoint(exceptionMessage = "入库单回收失败", operation = "入库单回收")//自定义注解，用于标注在controller的方法上，异步记录日志
    @ApiOperation(value = "移入回收站", notes = "移入回收站")//不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @RequiresPermissions({"inStock:remove"})//有此权限的才可执行下面的方法，否则抛异常
    @PutMapping("/remove/{id}")//用于处理HTTP POST请求，并将请求映射到具体的处理方法中。同GetMapping一样
    public ResponseBean remove(@PathVariable
                       //用在参数里用来提取url中的请求参数
                                           Long id) {
        inStockService.remove(id); //移入回收站
        return ResponseBean.success();
    }

    //恢复数据从回收站
    @ControllerEndpoint(exceptionMessage = "入库单恢复失败", operation = "入库单恢复")//自定义注解，用于标注在controller的方法上，异步记录日志
    @ApiOperation(value = "恢复数据", notes = "从回收站中恢复入库单")//不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @RequiresPermissions({"inStock:back"})//有此权限的才可执行下面的方法，否则抛异常
    @PutMapping("/back/{id}")//用于处理HTTP POST请求，并将请求映射到具体的处理方法中。同GetMapping一样
    public ResponseBean back(@PathVariable
                        //用在参数里用来提取url中的请求参数
                                         Long id) {
        inStockService.back(id);//还原从回收站中
        return ResponseBean.success();
    }
}
