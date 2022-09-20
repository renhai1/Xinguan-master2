package com.coderman.api.common.pojo.biz;

import lombok.Data;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name="biz_consumer")
//表明实体映射到数据库中的具体的表
@Data
//作用是省去get()set()toString()
public class Consumer {
    @Id
    //用于声明一个实体类的属性映射为数据库的主键列
    @GeneratedValue(generator = "JDBC")
    //为一个实体生成一个唯一标识的主键。
    //generator属性的值声明了主键生成器的名称
    private Long id;
    private String name;
    private String address;
    private Date createTime;
    private Date modifiedTime;
    private String phone;
    private  Integer sort;
    private String contact;

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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }
}
