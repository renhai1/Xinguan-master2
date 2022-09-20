package com.coderman.api.system.controller;

import com.coderman.api.common.annotation.ControllerEndpoint;
import com.coderman.api.common.bean.ResponseBean;
import com.coderman.api.common.pojo.system.Department;
import com.coderman.api.system.service.DepartmentService;
import com.coderman.api.system.vo.DeanVO;
import com.coderman.api.system.vo.DepartmentVO;
import com.coderman.api.system.vo.PageVO;
import com.wuwenze.poi.ExcelKit;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

//部门管理
@Api(tags = "系统部门接口")
//用在请求的类上，表示对类的说明  tags:说明该类的作用，可以在UI界面上看到的注解
@RestController
//@RestController = @Controller + @ResponseBody
//@Controller使得从该类所在的项目跑起来的过程中，这个类就被实例化
//@ResponseBody指该类中所有的API接口返回的数据，都会以json字符串的形式返回给客户端
@RequestMapping("/department")
//用来映射请求的，即指明处理器可以处理哪些URL请求，该注解既可以用在类上，也可以用在方法上。
//标记控制器类时，方法的请求地址是相对类的请求地址而言的
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    //部门列表
    @ApiOperation(value = "部门列表", notes = "部门列表,根据部门名模糊查询")
    //不是Spring自带的，是swagger里的，此注解是用来构建API文档的  value是接口说明 notes是接口发布说明
    @GetMapping("/findDepartmentList")
    //将HTTP GET请求映射到特定的处理方法上
    public ResponseBean findDepartmentList(@RequestParam
                                                   //value:请求参数中的名称  defaultValue默认值
                                                   //作用是把请求中的指定名称的参数传递给控制器中的形参赋值
                                                   (value = "pageNum", defaultValue = "1") Integer pageNum,
                                           @RequestParam(value = "pageSize") Integer pageSize,
                                           DepartmentVO departmentVO) {
        PageVO<DepartmentVO> departmentsList = departmentService.findDepartmentList(pageNum, pageSize, departmentVO);
        return ResponseBean.success(departmentsList);
    }

    //所有部门
    @ApiOperation(value = "所有部门")
    @GetMapping("/findAll")
    public ResponseBean findAll() {
        List<DepartmentVO> departmentVOS = departmentService.findAllVO();
        return ResponseBean.success(departmentVOS);
    }

    //查找部门主任
    @ApiOperation(value = "部门主任", notes = "查找部门主任,排除掉已经禁用的用户")
    @GetMapping("/findDeanList")
    public ResponseBean findDeanList() {
        List<DeanVO> managerList = departmentService.findDeanList();
        return ResponseBean.success(managerList);
    }

    // 添加部门
    @ControllerEndpoint(exceptionMessage = "添加部门失败", operation = "添加部门")
    //自定义注解，用于标注在controller的方法上，异步记录日志
    @RequiresPermissions({"department:add"})
    //有此权限的才可执行下面的方法，否则抛异常
    @ApiOperation(value = "添加部门")
    @PostMapping("/add")
    //用于处理HTTP POST请求，并将请求映射到具体的处理方法中。同GetMapping一样
    public ResponseBean add(@RequestBody
                            //将json格式的数据转为Java对象，前端到后端必须是json格式的
                            @Validated
                                    //充满了if-else这种校验代码,代码不够优雅，
                                    // 使用spring的javax.validation注解式参数校验，可以免去繁琐的校验。
                                    DepartmentVO departmentVO) {
        departmentService.add(departmentVO);
        return ResponseBean.success();
    }

    //编辑部门
    @ApiOperation(value = "编辑部门")
    @RequiresPermissions({"department:edit"})
    @GetMapping("/edit/{id}")
    public ResponseBean edit(@PathVariable
                                     //用在参数里用来提取url中的请求参数
                                     Long id) {
        DepartmentVO departmentVO = departmentService.edit(id);
        return ResponseBean.success(departmentVO);
    }

    // 更新部门
    @ControllerEndpoint(exceptionMessage = "更新部门失败", operation = "更新部门")
    @ApiOperation(value = "更新部门")
    @RequiresPermissions({"department:update"})
    @PutMapping("/update/{id}")
    public ResponseBean update(@PathVariable Long id, @RequestBody @Validated DepartmentVO departmentVO) {
        departmentService.update(id, departmentVO);
        return ResponseBean.success();
    }

    // 删除部门
    @ControllerEndpoint(exceptionMessage = "删除部门失败", operation = "删除部门")
    @ApiOperation(value = "删除部门")
    @RequiresPermissions({"department:delete"})
    @DeleteMapping("/delete/{id}")
    public ResponseBean delete(@PathVariable Long id) {
        departmentService.delete(id);
        return ResponseBean.success();
    }

    //导出excel
    @ApiOperation(value = "导出excel", notes = "导出所有部门的excel表格")
    @PostMapping("/excel")
    @RequiresPermissions("department:export")
    @ControllerEndpoint(exceptionMessage = "导出Excel失败", operation = "导出部门excel")
    public void export(HttpServletResponse response) {
        List<Department> departments = this.departmentService.findAll();
        ExcelKit.$Export(Department.class, response).downXlsx(departments, false);
    }

}
