package com.coderman.api.biz.controller;

import com.coderman.api.biz.service.ProductService;
import com.coderman.api.biz.vo.ProductStockVO;
import com.coderman.api.biz.vo.ProductVO;
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

@Api(tags = "物资资料接口")//用在请求的类上，表示对类的说明  tags:说明该类的作用，可以在UI界面上看到的注解
@RestController
//@RestController = @Controller + @ResponseBody
//@Controller使得从该类所在的项目跑起来的过程中，这个类就被实例化
//@ResponseBody指该类中所有的API接口返回的数据，都会以json字符串的形式返回给客户端
@RequestMapping("/product")
//用来映射请求的，即指明处理器可以处理哪些URL请求，该注解既可以用在类上，也可以用在方法上。
//标记控制器类时，方法的请求地址是相对类的请求地址而言的
public class ProductController {
    @Autowired
    private ProductService productService;
            //产品的相关

    // 全部物资列表
    @ApiOperation(value = "物资列表", notes = "物资列表,根据物资名模糊查询")//不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @GetMapping("/findProductList")//将HTTP GET请求映射到特定的处理方法上
    public ResponseBean findProductList(@RequestParam
                                                    //value:请求参数中的名称  defaultValue默认值
                                                    //作用是把请求中的指定名称的参数传递给控制器中的形参赋值
                                                    (value = "pageNum", defaultValue = "1") Integer pageNum,
                                        @RequestParam(value = "pageSize") Integer pageSize,
                                        @RequestParam(value = "categorys", required = false) String categorys,
                                        ProductVO productVO) {
        buildCategorySearch(categorys, productVO); // 封装物资查询条件
        PageVO<ProductVO> productVOPageVO = productService.findProductList(pageNum, pageSize, productVO); //商品列表
        return ResponseBean.success(productVOPageVO);
    }

    //可入库物资(入库页面使用)
    @ApiOperation(value = "可入库物资列表", notes = "物资列表,根据物资名模糊查询")
    @GetMapping("/findProducts")
    public ResponseBean findProducts(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                     @RequestParam(value = "pageSize") Integer pageSize,
                                     @RequestParam(value = "categorys", required = false) String categorys,
                                     ProductVO productVO){
        productVO.setStatus(0);//是否已经进入回收站:1:逻辑删除,0:正常数据,2:添加待审核
        buildCategorySearch(categorys, productVO);// 封装物资查询条件
        PageVO<ProductVO> productVOPageVO = productService.findProductList(pageNum, pageSize, productVO);//商品列表
        return ResponseBean.success(productVOPageVO);
    }

    //库存列表
    @ApiOperation(value = "库存列表", notes = "物资列表,根据物资名模糊查询")
    @GetMapping("/findProductStocks")
    public ResponseBean findProductStocks(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                          @RequestParam(value = "pageSize") Integer pageSize,
                                          @RequestParam(value = "categorys", required = false) String categorys,
                                          ProductVO productVO) {
        buildCategorySearch(categorys, productVO);// 封装物资查询条件
        PageVO<ProductStockVO> productVOPageVO = productService.findProductStocks(pageNum, pageSize, productVO);//库存列表
        return ResponseBean.success(productVOPageVO);
    }



    // 所有库存(饼图使用)
    @ApiOperation(value = "全部库存", notes = "物资所有库存信息,饼图使用")
    @GetMapping("/findAllStocks")
    public ResponseBean findAllStocks(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                      @RequestParam(value = "pageSize") Integer pageSize,
                                      @RequestParam(value = "categorys", required = false) String categorys,
                                      ProductVO productVO) {
        buildCategorySearch(categorys, productVO);// 封装物资查询条件
        List<ProductStockVO> list = productService.findAllStocks(pageNum, pageSize,productVO);  //所有库存信息
        return ResponseBean.success(list);
    }


    // 封装物资查询条件
    private void buildCategorySearch(@RequestParam(value = "categorys", required = false) String categorys, ProductVO productVO) {
        if (categorys != null && !"".equals(categorys)) {
            String[] split = categorys.split(",");
            switch (split.length) {
                case 1:
                    productVO.setOneCategoryId(Long.parseLong(split[0]));
                    break;
                case 2:
                    productVO.setOneCategoryId(Long.parseLong(split[0]));
                    productVO.setTwoCategoryId(Long.parseLong(split[1]));
                    break;
                case 3:
                    productVO.setOneCategoryId(Long.parseLong(split[0]));
                    productVO.setTwoCategoryId(Long.parseLong(split[1]));
                    productVO.setThreeCategoryId(Long.parseLong(split[2]));
                    break;
            }
        }
    }


    // 添加物资
    @ControllerEndpoint(exceptionMessage = "添加物资失败", operation = "物资资料添加")//自定义注解，用于标注在controller的方法上，异步记录日志
    @ApiOperation(value = "添加物资")
    @RequiresPermissions({"product:add"})
    @PostMapping("/add")
    public ResponseBean add(@RequestBody @Validated ProductVO productVO) {
        if (productVO.getCategoryKeys().length != 3) {
            return ResponseBean.error("物资需要3级分类");
        }
        productService.add(productVO); //添加商品
        return ResponseBean.success();
    }

    // 编辑物资
    @ApiOperation(value = "编辑物资", notes = "编辑物资信息")
    @RequiresPermissions({"product:edit"})
    @GetMapping("/edit/{id}")
    public ResponseBean edit(@PathVariable Long id) {
        ProductVO productVO = productService.edit(id); //编辑商品
        return ResponseBean.success(productVO);
    }

    // 更新物资
    @ControllerEndpoint(exceptionMessage = "更新物资失败", operation = "物资资料更新")//自定义注解，用于标注在controller的方法上，异步记录日志
    @ApiOperation(value = "更新物资", notes = "更新物资信息")
    @RequiresPermissions({"product:update"})
    @PutMapping("/update/{id}")
    public ResponseBean update(@PathVariable Long id, @RequestBody ProductVO productVO) {
        if (productVO.getCategoryKeys().length != 3) {
            return ResponseBean.error("物资需要3级分类");
        }
        productService.update(id, productVO); //更新商品
        return ResponseBean.success();
    }

    //删除物资
    @ControllerEndpoint(exceptionMessage = "删除物资失败", operation = "物资资料删除")
    @ApiOperation(value = "删除物资", notes = "删除物资信息")
    @RequiresPermissions({"product:delete"})
    @DeleteMapping("/delete/{id}")
    public ResponseBean delete(@PathVariable Long id) {
        productService.delete(id); //删除商品
        return ResponseBean.success();
    }

    //移入回收站
    @ControllerEndpoint(exceptionMessage = "回收物资失败", operation = "物资资料回收")
    @ApiOperation(value = "移入回收站", notes = "移入回收站")
    @RequiresPermissions({"product:remove"})
    @PutMapping("/remove/{id}")
    public ResponseBean remove(@PathVariable Long id) {
        productService.remove(id); //移入回收站
        return ResponseBean.success();
    }


    // 物资添加审核
    @ControllerEndpoint(exceptionMessage = "物资添加审核失败", operation = "物资资料审核")
    @ApiOperation(value = "物资添加审核", notes = "物资添加审核")
    @RequiresPermissions({"product:publish"})
    @PutMapping("/publish/{id}")
    public ResponseBean publish(@PathVariable Long id) {
        productService.publish(id);//物资添加审核
        return ResponseBean.success();
    }


    //恢复数据从回收站
    @ControllerEndpoint(exceptionMessage = "恢复物资失败", operation = "物资资料恢复")
    @ApiOperation(value = "恢复物资", notes = "从回收站中恢复物资")
    @RequiresPermissions({"product:back"})
    @PutMapping("/back/{id}")
    public ResponseBean back(@PathVariable Long id) {
        productService.back(id);//从回收站恢复数据
        return ResponseBean.success();
    }
}
