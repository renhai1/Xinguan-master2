package com.coderman.api.biz.controller;

import com.coderman.api.biz.service.ProductCategoryService;
import com.coderman.api.biz.vo.ProductCategoryTreeNodeVO;
import com.coderman.api.biz.vo.ProductCategoryVO;
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

@Api(tags = "物资类别接口")
//用在请求的类上，表示对类的说明  tags:说明该类的作用，可以在UI界面上看到的注解
@RestController
//@RestController = @Controller + @ResponseBody
//@Controller使得从该类所在的项目跑起来的过程中，这个类就被实例化
//@ResponseBody指该类中所有的API接口返回的数据，都会以json字符串的形式返回给客户端
@RequestMapping("/productCategory")
//用来映射请求的，即指明处理器可以处理哪些URL请求，该注解既可以用在类上，也可以用在方法上。
//标记控制器类时，方法的请求地址是相对类的请求地址而言的
public class ProductCategoryController {


    @Autowired//可以对类成员变量、方法及构造函数进行标注，让spring完成bean自动装配的工作
    private ProductCategoryService productCategoryService;
    //物资类别  相关的

    // 物资分类列表
    @ApiOperation(value = "分类列表", notes = "物资分类列表,根据物资分类名模糊查询")//不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @GetMapping("/findProductCategoryList")//将HTTP GET请求映射到特定的处理方法上
    public ResponseBean findProductCategoryList(
            @RequestParam
                    //value:请求参数中的名称  defaultValue默认值
                    //作用是把请求中的指定名称的参数传递给控制器中的形参赋值
                    (value = "pageNum", defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize") Integer pageSize,
            ProductCategoryVO productCategoryVO) {

        PageVO<ProductCategoryVO> departmentsList = productCategoryService.findProductCategoryList(pageNum, pageSize, productCategoryVO);
                                                    //物资分类列表
        return ResponseBean.success(departmentsList);
    }

    //分类树形结构(分页)
    @ApiOperation(value = "分类树形结构")//不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @GetMapping("/categoryTree")//将HTTP GET请求映射到特定的处理方法上
    public ResponseBean categoryTree(@RequestParam
                                                 //value:请求参数中的名称  defaultValue默认值
                                                 //作用是把请求中的指定名称的参数传递给控制器中的形参赋值
                                                 (value = "pageNum", required = false) Integer pageNum,
                                     @RequestParam(value = "pageSize", required = false) Integer pageSize) {
        PageVO<ProductCategoryTreeNodeVO> pageVO = productCategoryService.categoryTree(pageNum, pageSize);//分类树形
        return ResponseBean.success(pageVO);
    }

    //获取父级分类树：2级树
    @ApiOperation(value = "父级分类树")
    @GetMapping("/getParentCategoryTree")
    public ResponseBean getParentCategoryTree() {
        List<ProductCategoryTreeNodeVO> parentTree = productCategoryService.getParentCategoryTree();//获取父级分类（2级树）
        return ResponseBean.success(parentTree);
    }

     // 查询所有分类
    @ApiOperation(value = "所有分类")
    @GetMapping("/findAll")
    public ResponseBean findAll() {
        List<ProductCategoryVO> productCategoryVOS = productCategoryService.findAll(); //查询所有物资类别
        return ResponseBean.success(productCategoryVOS);
    }

    // 添加物资分类
    @ControllerEndpoint(exceptionMessage = "物资分类添加失败", operation = "物资分类添加")
    @RequiresPermissions({"productCategory:add"})
    @ApiOperation(value = "添加分类")
    @PostMapping("/add")
    public ResponseBean add(@RequestBody @Validated ProductCategoryVO productCategoryVO) {
        productCategoryService.add(productCategoryVO);//添加物资类别
        return ResponseBean.success();
    }

    //编辑物资分类
    @ApiOperation(value = "编辑分类")
    @RequiresPermissions({"productCategory:edit"})
    @GetMapping("/edit/{id}")
    public ResponseBean edit(@PathVariable Long id) {
        ProductCategoryVO productCategoryVO = productCategoryService.edit(id); //编辑物资类别
        return ResponseBean.success(productCategoryVO);
    }

    // 更新物资分类
    @ControllerEndpoint(exceptionMessage = "物资分类更新失败", operation = "物资分类更新")
    @ApiOperation(value = "更新分类")
    @RequiresPermissions({"productCategory:update"})
    @PutMapping("/update/{id}")
    public ResponseBean update(@PathVariable Long id, @RequestBody @Validated ProductCategoryVO productCategoryVO) {
        productCategoryService.update(id, productCategoryVO); //更新物资类别
        return ResponseBean.success();
    }

   //删除物资分类
    @ControllerEndpoint(exceptionMessage = "物资分类删除失败", operation = "物资分类删除")
    @ApiOperation(value = "删除分类")
    @RequiresPermissions({"productCategory:delete"})
    @DeleteMapping("/delete/{id}")
    public ResponseBean delete(@PathVariable Long id) {
        productCategoryService.delete(id); //删除物资类别
        return ResponseBean.success();
    }

}
