package com.coderman.api.biz.vo;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * 物资入库 详情
 */
@Data
public class InStockDetailVO {
    private String inNum;
    private Integer status;
    private Integer type;
    private String operator;
    private SupplierVO supplierVO;
    private long total;// 总数
    private List<InStockItemVO> itemVOS=new ArrayList<>();

    public String getInNum() {
        return inNum;
    }

    public void setInNum(String inNum) {
        this.inNum = inNum;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public SupplierVO getSupplierVO() {
        return supplierVO;
    }

    public void setSupplierVO(SupplierVO supplierVO) {
        this.supplierVO = supplierVO;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<InStockItemVO> getItemVOS() {
        return itemVOS;
    }

    public void setItemVOS(List<InStockItemVO> itemVOS) {
        this.itemVOS = itemVOS;
    }
}
