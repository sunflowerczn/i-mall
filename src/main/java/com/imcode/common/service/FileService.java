package com.imcode.common.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;

/**
 * 封装文件上传服务
 */
@Service
public class FileService {

    //@Value("${file.upload.path}")
    private String filePath = "D:\\java\\Apache2.2\\htdocs";

    /**
     * 文件上传成功以后返回上传到服务器的文件名称
     *
     * @param uploadFile
     * @return
     */
    public String upload(MultipartFile uploadFile) {
        try {
            //原始文件名
            String originalFileName = uploadFile.getOriginalFilename();

            //文件后缀
            String fileSuffix = originalFileName.substring(originalFileName.lastIndexOf("."));
            //新的文件名称
            String fileName = System.currentTimeMillis() + fileSuffix;

            //如果文件目录不存在 创建该目录
            File dir = new File(filePath);
            if (!dir.exists()) {
                //创建文件夹
                dir.mkdir();
            }
            //文件路径
            File file = new File(filePath + "/" + fileName);

            uploadFile.transferTo(file);// 完成文件上传
            return filePath + "/" + fileName;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
