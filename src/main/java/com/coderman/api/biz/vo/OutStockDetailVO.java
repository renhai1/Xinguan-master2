package com.coderman.api.biz.vo;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * 出库详情
 */
@Data
public class OutStockDetailVO {

    private String outNum;

    private Integer status;

    private Integer type;

    private String operator;

    private ConsumerVO consumerVO;

    private long total;// 总数

    private List<OutStockItemVO> itemVOS = new ArrayList<>();

    public String getOutNum() {
        return outNum;
    }

    public void setOutNum(String outNum) {
        this.outNum = outNum;
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

    public ConsumerVO getConsumerVO() {
        return consumerVO;
    }

    public void setConsumerVO(ConsumerVO consumerVO) {
        this.consumerVO = consumerVO;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<OutStockItemVO> getItemVOS() {
        return itemVOS;
    }

    public void setItemVOS(List<OutStockItemVO> itemVOS) {
        this.itemVOS = itemVOS;
    }
}
