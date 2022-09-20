package com.coderman.api.common.config.web;

import org.springframework.stereotype.Component;

/**
 * 分布式文件存储 Fdfs
 */
@Component
public class FdfsConfig {


    private String resHost;

    private String storagePort;

    public String getResHost() {
        return resHost;
    }

    public void setResHost(String resHost) {
        this.resHost = resHost;
    }

    public String getStoragePort() {
        return storagePort;
    }

    public void setStoragePort(String storagePort) {
        this.storagePort = storagePort;
    }

}

