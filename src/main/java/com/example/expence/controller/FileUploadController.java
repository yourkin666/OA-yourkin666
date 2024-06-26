package com.example.expence.controller;

import com.example.expence.utils.Result;
import com.example.expence.utils.AliOssUtil;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.UUID;

/**
 * @author yourkin666
 * @date 2024/05/17/21:41
 * @description文件上传功能,用于上传头像和工作文件~~~
 */
@RestController
public class FileUploadController {
    @PostMapping("/upload")
    public Result<String> upload(MultipartFile file) throws IOException {
        String originalFilename = file.getOriginalFilename();
//        引入UUId,目的:避免了因上传多份/**文件名相同**/的文件而引起的/**文件覆盖**/的问题
        String filename = UUID.randomUUID().toString()+originalFilename.substring(originalFilename.lastIndexOf("."));
//        前端可以通过这个url去获得图片
        String url = AliOssUtil.uploadFile(filename, file.getInputStream());
        return Result.success(url);
    }
}

/*
                                上传本地服务器
 */
//          String originalFilename = file.getOriginalFilename();
//      引入UUId,目的:避免了因上传多份/**文件名相同**/的文件而引起的/**文件覆盖**/的问题
//          String filename = UUID.randomUUID().toString()+originalFilename.substring(originalFilename.lastIndexOf("."));
//          file.transferTo(new File("C:\\Users\\Administrator\\Desktop\\files\\" + filename));
