package com.coderman.api.system.vo;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * 分页VO
 *
 * @param <T>
 */
@Data
public class PageVO<T> {
    private long total; //条数

    private List<T> rows = new ArrayList<>(); //数据

    public PageVO(long total, List<T> data) {
        this.total = total;
        this.rows = data;
    }
}