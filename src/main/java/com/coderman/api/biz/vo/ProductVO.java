package com.coderman.api.biz.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;
@Data
public class ProductVO {
    private Long id;
    private String pNum;
    @NotBlank
    private String name;
    @NotBlank
    private String model;
    @NotBlank
    private String unit;
    @NotBlank
    private String remark;
    private Integer sort;
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")
    private Date createTime;
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")
    private Date modifiedTime;
    private String imageUrl;
    @NotNull(message = "分类不能为空")
    private Long[] categoryKeys;
    private Long oneCategoryId;
    private Long twoCategoryId;
    private Long threeCategoryId;
    private Integer status;//是否已经进入回收站:1:逻辑删除,0:正常数据,2:添加待审核

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getpNum() {
        return pNum;
    }

    public void setpNum(String pNum) {
        this.pNum = pNum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Long[] getCategoryKeys() {
        return categoryKeys;
    }

    public void setCategoryKeys(Long[] categoryKeys) {
        this.categoryKeys = categoryKeys;
    }

    public Long getOneCategoryId() {
        return oneCategoryId;
    }

    public void setOneCategoryId(Long oneCategoryId) {
        this.oneCategoryId = oneCategoryId;
    }

    public Long getTwoCategoryId() {
        return twoCategoryId;
    }

    public void setTwoCategoryId(Long twoCategoryId) {
        this.twoCategoryId = twoCategoryId;
    }

    public Long getThreeCategoryId() {
        return threeCategoryId;
    }

    public void setThreeCategoryId(Long threeCategoryId) {
        this.threeCategoryId = threeCategoryId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
