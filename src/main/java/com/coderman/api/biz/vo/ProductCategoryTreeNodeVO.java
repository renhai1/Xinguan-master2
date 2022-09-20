package com.coderman.api.biz.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Comparator;
import java.util.Date;
import java.util.List;

/**
 * 物资类别树
 */
@Data
public class ProductCategoryTreeNodeVO {
    private Long id;
    private String name;
    private String remark;
    private Integer sort;
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date modifiedTime;
    private Long pid;
    private int lev;
    private List<ProductCategoryTreeNodeVO> children;

    // 排序,根据order排序
    public static Comparator<ProductCategoryTreeNodeVO> order() {
        Comparator<ProductCategoryTreeNodeVO> comparator = (o1, o2) -> {
            if (o1.getSort() != o2.getSort()) {
                return (int) (o1.getSort() - o2.getSort());
            }
            return 0;
        };
        return comparator;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public int getLev() {
        return lev;
    }

    public void setLev(int lev) {
        this.lev = lev;
    }

    public List<ProductCategoryTreeNodeVO> getChildren() {
        return children;
    }

    public void setChildren(List<ProductCategoryTreeNodeVO> children) {
        this.children = children;
    }
}
