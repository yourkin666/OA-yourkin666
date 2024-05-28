package com.example.demo.service.impl;

import com.example.demo.mapper.UserMapper;
import com.example.demo.utils.Result;
import com.example.demo.pojo.User;
import com.example.demo.service.UserService;
import com.example.demo.utils.JwtUtil;
import com.example.demo.utils.Md5Util;
import com.example.demo.utils.ThreadLocalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Override
    public Result register(String userName, String password) {
        User user = userMapper.selectUser(userName);
        if (user == null) {
            String salt = Md5Util.getRandomStr(12);
            String pwd = Md5Util.getMD5String(password + salt);
            userMapper.insertUser(userName, pwd, salt, "user");
            return Result.success();
        } else {
            return Result.error("已存在该用户");
        }
    }

    @Override
    public Result login(String userName, String password) {
        User user = userMapper.selectUser(userName);
        String salt = userMapper.getSalt(userName);
        if (user == null) {
            return Result.error("该用户不存在");
        }
        else if (Md5Util.getMD5String(password + salt).equals(user.getPassword())) {
            HashMap<String, Object> claims = new HashMap<>();
            claims.put("userName", userName);
            claims.put("id", user.getId());
            String token = JwtUtil.genToken(claims);
//            往redis中存token
            ValueOperations<String, String> operations = stringRedisTemplate.opsForValue();
            operations.set(token, token, 1, TimeUnit.HOURS);
            return Result.success(token);
        }
        else return Result.error("密码错误");
    }
    @Override
    public User selectUser(String userName) {
        return userMapper.selectUser(userName);
    }

    @Override
    public void insertUser(String userName, String password, String salt, String role) {
        userMapper.insertUser(userName, password, salt, role);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    @Override
    public void updateAvatar(String url) {
        Map<String,Object> claims =  ThreadLocalUtil.get();
        Object id = claims.get("id");
        userMapper.updateAvatar(url,id);
    }

    @Override
    public Result updatePwd(Map<String,String> parms,String token) {
        String oldPwd = parms.get("old_pwd");
        String newPwd = parms.get("new_pwd");
        String rePwd = parms.get("re_pwd");

        if (!StringUtils.hasLength(oldPwd)||!StringUtils.hasLength(newPwd)||!StringUtils.hasLength(rePwd)){
            return Result.error("密码不全");
        }

        Map<String,Object> claims = ThreadLocalUtil.get();
        Object id = claims.get("id");
        String userName = (String) claims.get("userName");
        User user = userMapper.selectUser(userName);
        String salt = userMapper.getSalt(userName);

        if (!user.getPassword().equals(Md5Util.getMD5String(oldPwd + salt))){
            return Result.error("密码不对哦");
        }
        if (!newPwd.equals(rePwd)){
            return Result.error("前后两次密码输入不一致");
        }
        userMapper.updatePwd(Md5Util.getMD5String(newPwd + salt),id);
//        删除Reids中的原来的token
        ValueOperations<String, String> operations = stringRedisTemplate.opsForValue();
        operations.getOperations().delete(token);
        return Result.success();
    }

    @Override
    public String getSalt(String userName) {
        return userMapper.getSalt(userName);
    }
}
