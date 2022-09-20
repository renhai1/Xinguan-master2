package com.coderman.api.system.controller;

import com.coderman.api.common.annotation.ControllerEndpoint;
import com.coderman.api.common.bean.ResponseBean;
import com.coderman.api.common.pojo.system.Role;
import com.coderman.api.system.service.MenuService;
import com.coderman.api.system.service.RoleService;
import com.coderman.api.system.vo.MenuNodeVO;
import com.coderman.api.system.vo.PageVO;
import com.coderman.api.system.vo.RoleVO;
import com.wuwenze.poi.ExcelKit;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(tags = "系统角色接口")
//用在请求的类上，表示对类的说明  tags:说明该类的作用，可以在UI界面上看到的注解
@RestController
//@RestController = @Controller + @ResponseBody
//@Controller使得从该类所在的项目跑起来的过程中，这个类就被实例化
//@ResponseBody指该类中所有的API接口返回的数据，都会以json字符串的形式返回给客户端
@RequestMapping("/role")
//用来映射请求的，即指明处理器可以处理哪些URL请求，该注解既可以用在类上，也可以用在方法上。
//标记控制器类时，方法的请求地址是相对类的请求地址而言的
public class RoleController {
    @Autowired
    private RoleService roleService;
    @Autowired
    private MenuService menuService;


    //角色授权
    @ControllerEndpoint(exceptionMessage = "角色授权失败", operation = "角色授权")
    //自定义注解，用于标注在controller的方法上，异步记录日志
    @ApiOperation(value = "角色授权")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @RequiresPermissions({"role:authority"})
    //有此权限的才可执行下面的方法，否则抛异常
    @PostMapping("/authority/{id}")
    //用于处理HTTP POST请求，并将请求映射到具体的处理方法中。同GetMapping一样
    public ResponseBean authority(@PathVariable
                                          //用在参数里用来提取url中的请求参数
                                          Long id,
                                  @RequestBody
                                          //将json格式的数据转为Java对象，前端到后端必须是json格式的
                                          Long[] mids) {
        roleService.authority(id, mids);
        return ResponseBean.success();
    }

    // 角色拥有的菜单权限id和菜单树
    @ApiOperation(value = "角色菜单")
    @GetMapping("/findRoleMenu/{id}")
    public ResponseBean findRoleMenu(@PathVariable Long id) {
        List<MenuNodeVO> tree = menuService.findMenuTree();
        //角色拥有的菜单id
        List<Long> mids = roleService.findMenuIdsByRoleId(id);
        List<Long> ids = menuService.findOpenIds();
        Map<String, Object> map = new HashMap<>();
        map.put("tree", tree);
        map.put("mids", mids);
        map.put("open", ids);
        return ResponseBean.success(map);
    }

    //角色列表
    @ApiOperation(value = "角色列表")
    @GetMapping("/findRoleList")
    public ResponseBean findRoleList(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                     @RequestParam(value = "pageSize", defaultValue = "7") Integer pageSize,
                                     RoleVO roleVO) {
        PageVO<RoleVO> roleList = roleService.findRoleList(pageNum, pageSize, roleVO);
        return ResponseBean.success(roleList);
    }

    //添加角色信息
    @ControllerEndpoint(exceptionMessage = "添加角色失败", operation = "添加角色")
    @ApiOperation(value = "添加角色")
    @RequiresPermissions({"role:add"})
    @PostMapping("/add")
    public ResponseBean add(@RequestBody @Validated RoleVO roleVO) {
        roleService.add(roleVO);
        return ResponseBean.success();
    }

    // 删除角色
    @ControllerEndpoint(exceptionMessage = "删除角色失败", operation = "删除角色")
    @ApiOperation(value = "删除角色", notes = "根据id删除角色信息")
    @RequiresPermissions({"role:delete"})
    @DeleteMapping("/delete/{id}")
    public ResponseBean delete(@PathVariable Long id) {
        roleService.deleteById(id);
        return ResponseBean.success();
    }


    //编辑角色信息
    @ApiOperation(value = "编辑用户", notes = "根据id更新角色信息")
    @GetMapping("/edit/{id}")
    @RequiresPermissions({"role:edit"})
    public ResponseBean edit(@PathVariable Long id) {
        RoleVO roleVO = roleService.edit(id);
        return ResponseBean.success(roleVO);
    }

    // 更新角色
    @ControllerEndpoint(exceptionMessage = "更新角色失败", operation = "更新角色")
    @ApiOperation(value = "更新角色", notes = "根据id更新角色信息")
    @RequiresPermissions({"role:update"})
    @PutMapping("/update/{id}")
    public ResponseBean update(@PathVariable Long id, @RequestBody @Validated RoleVO roleVO) {
        roleService.update(id, roleVO);
        return ResponseBean.success();
    }

    //更新角色状态
    @ControllerEndpoint(exceptionMessage = "角色更新状态失败", operation = "角色|禁用/启用")
    @ApiOperation(value = "更新状态", notes = "禁用和更新两种状态")
    @RequiresPermissions({"role:status"})
    @PutMapping("/updateStatus/{id}/{status}")
    public ResponseBean updateStatus(@PathVariable Long id, @PathVariable Boolean status) {
        roleService.updateStatus(id, status);
        return ResponseBean.success();
    }

    //导出excel
    @ApiOperation(value = "导出excel", notes = "导出所有角色的excel表格")
    @PostMapping("/excel")
    @RequiresPermissions("role:export")
    @ControllerEndpoint(exceptionMessage = "导出Excel失败", operation = "导出角色excel")
    public void export(HttpServletResponse response) {
        List<Role> roles = this.roleService.findAll();
        ExcelKit.$Export(Role.class, response).downXlsx(roles, false);
    }


}

