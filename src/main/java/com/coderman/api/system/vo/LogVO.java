package com.coderman.api.system.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.Id;
import java.util.Date;

/**
 * 日志VO
 */
@Data
public class LogVO {
    @Id
    private Long id;

    private String username;

    private Long time;

    private String ip;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    private String location;

    private String operation;

    private String method;

    private String params;
}