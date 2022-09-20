package com.coderman.api.system.controller;

import com.coderman.api.common.annotation.ControllerEndpoint;
import com.coderman.api.common.bean.ResponseBean;
import com.coderman.api.common.pojo.system.Menu;
import com.coderman.api.system.service.MenuService;
import com.coderman.api.system.vo.MenuNodeVO;
import com.coderman.api.system.vo.MenuVO;
import com.wuwenze.poi.ExcelKit;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(tags = "菜单权限接口")
//用在请求的类上，表示对类的说明  tags:说明该类的作用，可以在UI界面上看到的注解
@RequestMapping("/menu")
//用来映射请求的，即指明处理器可以处理哪些URL请求，该注解既可以用在类上，也可以用在方法上。
//标记控制器类时，方法的请求地址是相对类的请求地址而言的
@RestController
//@RestController = @Controller + @ResponseBody
//@Controller使得从该类所在的项目跑起来的过程中，这个类就被实例化
//@ResponseBody指该类中所有的API接口返回的数据，都会以json字符串的形式返回给客户端
public class MenuController {
    @Autowired
    private MenuService menuService;

    // 加载菜单树
    @ApiOperation(value = "加载菜单树", notes = "获取所有菜单树，以及展开项")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @GetMapping("/tree")
    //将HTTP GET请求映射到特定的处理方法上
    public ResponseBean tree() {
        List<MenuNodeVO> menuTree = menuService.findMenuTree();
        List<Long> ids = menuService.findOpenIds();
        Map<String, Object> map = new HashMap<>();
        map.put("tree", menuTree);
        map.put("open", ids);
        return ResponseBean.success(map);
    }

    //新增菜单/按钮
    @ControllerEndpoint(exceptionMessage = "新增菜单/按钮失败", operation = "新增菜单/按钮")
    //自定义注解，用于标注在controller的方法上，异步记录日志
    @ApiOperation(value = "新增菜单")
    @RequiresPermissions({"menu:add"})
    @PostMapping("/add")
    //用于处理HTTP POST请求，并将请求映射到具体的处理方法中。同GetMapping一样
    public ResponseBean add(@RequestBody
                                //将json格式的数据转为Java对象，前端到后端必须是json格式的
                                @Validated
                      //充满了if-else这种校验代码,代码不够优雅，
                      // 使用spring的javax.validation注解式参数校验，可以免去繁琐的校验。
                                        MenuVO menuVO) {
        Menu node = menuService.add(menuVO);
        Map<String, Object> map = new HashMap<>();
        map.put("id", node.getId());
        map.put("menuName", node.getMenuName());
        map.put("children", new ArrayList<>());
        map.put("icon", node.getIcon());
        return ResponseBean.success(map);
    }

    // 删除菜单/按钮
    @ControllerEndpoint(exceptionMessage = "删除菜单/按钮失败", operation = "删除菜单/按钮")
    @ApiOperation(value = "删除菜单", notes = "根据id删除菜单节点")
    @RequiresPermissions({"menu:delete"})
    @DeleteMapping("/delete/{id}")
    //将 HTTP DELETE 请求映射到特定的处理程序方法。
    public ResponseBean delete(@PathVariable
                           //用在参数里用来提取url中的请求参数
                                           Long id) {
        menuService.delete(id);
        return ResponseBean.success();
    }

    //菜单详情
    @ApiOperation(value = "菜单详情", notes = "根据id编辑菜单，获取菜单详情")
    @RequiresPermissions({"menu:edit"})
    @GetMapping("/edit/{id}")
    public ResponseBean edit(@PathVariable Long id) {
        MenuVO menuVO = menuService.edit(id);
        return ResponseBean.success(menuVO);
    }

    //更新菜单
    @ControllerEndpoint(exceptionMessage = "更新菜单失败", operation = "更新菜单")
    @ApiOperation(value = "更新菜单", notes = "根据id更新菜单节点")
    @RequiresPermissions({"menu:update"})
    @PutMapping("/update/{id}")
    public ResponseBean update(@PathVariable Long id, @RequestBody @Validated MenuVO menuVO) {
        menuService.update(id, menuVO);
        return ResponseBean.success();
    }

    //导出excel
    @ApiOperation(value = "导出excel", notes = "导出所有菜单的excel表格")
    @PostMapping("excel")
    @RequiresPermissions("menu:export")
    @ControllerEndpoint(exceptionMessage = "导出Excel失败",operation = "导出菜单excel")
    public void export(HttpServletResponse response) {
        List<Menu> menus = this.menuService.findAll();
        ExcelKit.$Export(Menu.class, response).downXlsx(menus, false);
    }

}

