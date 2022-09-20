package com.coderman.api.system.vo;

import lombok.Data;

/**
 * 静态资源  VO
 */
@Data
public class ImageAttachmentVO {

    private String mediaType;

    private String suffix;

    private String path;

    public String getMediaType() {
        return mediaType;
    }

    public void setMediaType(String mediaType) {
        this.mediaType = mediaType;
    }

    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
