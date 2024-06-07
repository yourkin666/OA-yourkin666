package com.example.expence.controller;

import com.example.expence.utils.Result;
import com.example.expence.pojo.User;
import com.example.expence.service.UserService;
import com.example.expence.utils.ThreadLocalUtil;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Pattern;
import org.hibernate.validator.constraints.URL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/user")
@Validated
public class UserController {
    @Autowired
    private UserService userService;

//      注册
    @PostMapping("/register")
    public Result register(@Pattern(regexp = "\\S{5,16}$") String userName, @Pattern(regexp = "\\S{5,16}$") String password) {
        return userService.register(userName, password);
    }

//      登录
    @PostMapping("/login")
    public Result login(@Pattern(regexp = "\\S{5,16}$") String userName, @Pattern(regexp = "\\S{5,16}$") String password) {
        return userService.login(userName, password);
    }

//    查看个人信息
    @GetMapping("/info")
    public Result<User> info(){
        Map<String,Object> claims =  ThreadLocalUtil.get();
        Object userName =claims.get("userName");
        User user = userService.selectUser((String) userName);
        return Result.success(user);
    }

//    更新个人邮箱
    @PostMapping("/updateEmail")
    public Result updateEmail(@Email String email){
        userService.updateEmail(email);
        return Result.success();
    }

//    更新个人头像
    @PatchMapping("/updateAvatar")
    public Result updateAvatar(@RequestParam @URL String url){
        userService.updateAvatar(url);
        return Result.success();
    }

//    更新个人密码
    @PatchMapping("/updatePwd")
    public Result updatePwd(@RequestBody Map<String,String> parms, @RequestHeader("Authorization") String token){
        return userService.updatePwd( parms,token);
        }
    }

