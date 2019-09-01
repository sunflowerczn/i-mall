package com.imcode.common.controller;

import com.imcode.common.model.R;
import com.imcode.common.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class UploadController {

    @Autowired
    private FileService fileService;

    /**
     * 上传文件
     * @param uploadFile
     * @return
     */
    public R upload(MultipartFile uploadFile) {
        String url = fileService.upload(uploadFile);
        return R.ok("文件上传成功", url);
    }

}
