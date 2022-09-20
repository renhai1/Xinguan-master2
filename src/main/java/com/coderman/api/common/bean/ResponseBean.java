package com.coderman.api.common.bean;

import lombok.Data;

/**
 * 后端返回的bean
 */
@Data
public class ResponseBean {
    // 200:操作成功  -1：操作失败

    // http 状态码
    private int code;
    // 返回信息
    private String msg;
    // 返回的数据
    private Object data;

    public ResponseBean() {
    }

    public ResponseBean(int code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static ResponseBean error(String message) {
        ResponseBean responseBean = new ResponseBean();
        responseBean.setMsg(message);
        responseBean.setCode(-1);
        return responseBean;
    }

    public static ResponseBean error(int code, String message) {
        ResponseBean responseBean = new ResponseBean();
        responseBean.setMsg(message);
        responseBean.setCode(code);
        return responseBean;
    }

    //ConsumerController中去向列表、编辑去向、所有去向调用的
    ////HealthController中签到记录、是否已报备
    //InStockController中入库单列表、入库单明细
    //OutStockController中的出库单列表//发放单详情
    //ProductCategoryController中的 物资分类列表//分类树形//获取父级分类（2级树） //查询所有物资类别 //编辑物资类别
    //ProductController中的// 全部物资列表 //可入库物资(入库页面使用)//库存列表 // 所有库存(饼图使用) //编辑商品
    //SupplierController中的//来源列表//添加供应商//编辑来源 //更新来源 //删除供应商 //查询所有供应商
    //DepartmentController中的//部门列表//所有部门//查找部门主任 //编辑部门
    //LogController中的// 日志列表//删除日志   // 批量删除
    //LoginLogController中  //日志列表// 登入报表
    //MenuController中  // 加载菜单树//新增菜单/按钮 //菜单详情
    //RoleController中的  // 角色拥有的菜单权限id和菜单树//角色列表 //编辑角色信息
    //UserController中的// 用户登入//用户列表//用户信息//加载菜单// 编辑用户    // 用户角色信息
    public static ResponseBean success(Object data) {
        ResponseBean responseBean = new ResponseBean();
        responseBean.setData(data);
        responseBean.setCode(200);
        responseBean.setMsg("成功");
//        responseBean.setMsg(data.toString());
        return responseBean;
    }

    public static ResponseBean success1(String message) {
        ResponseBean responseBean = new ResponseBean();
        responseBean.setData(null);
        responseBean.setCode(200);
        responseBean.setMsg(message);
        return responseBean;
    }

    //ConsumerController中添加去向、更新去向、删除去向调用的
    //HealthController中健康上报
    //InStockController中物资入库、入库审核、删除入库单、 //移入回收站、//还原从回收站中
    //OutStockController中//提交物资发放单、移入回收站//删除物资发放单//发放审核 //恢复数据从回收站
    //ProductCategoryController中的 // 添加物资类别 //更新物资类别 //删除物资类别
    //DepartmentController中的// 添加部门// 更新部门 // 删除部门
    //LoginLogController中 // 删除日志 // 批量删除
    //MenuController中  // 删除菜单/按钮  //更新菜单
    //RoleController中的 //角色授权 //添加角色信息// 删除角色// 更新角色    //更新角色状态
    //UserController中的//分配角色//删除用户//删除用户  // 更新用户 //添加用户信息
    public static ResponseBean success() {
        ResponseBean responseBean = new ResponseBean();
        responseBean.setData(null);
        responseBean.setCode(200);
        responseBean.setMsg("Success");
        return responseBean;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
