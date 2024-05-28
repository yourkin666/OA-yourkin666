package com.example.demo.service;

import com.example.demo.utils.Result;
import com.example.demo.pojo.User;

import java.util.Map;

public interface UserService {
    Result register(String userName, String password);
    public User selectUser(String userName);
    public void insertUser(String username, String password, String salt, String role);
    Result login(String userName, String password);
    public void updateUser(User user);
    public void updateAvatar(String url);
    Result updatePwd(Map<String,String> parms, String token);
    String getSalt(String userName);

}
