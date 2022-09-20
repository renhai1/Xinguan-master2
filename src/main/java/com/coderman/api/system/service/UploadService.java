package com.coderman.api.system.service;

import com.coderman.api.common.pojo.system.ImageAttachment;
import com.coderman.api.system.vo.ImageAttachmentVO;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * 静态资源Service
 */
public interface UploadService {
    String uploadImage(MultipartFile file) throws IOException; //图片上传

    List<ImageAttachment> findImageList(ImageAttachmentVO imageAttachmentVO); //图片列表

    void delete(Long id); //删除图片
}