package com.example.expence.config;

import com.example.expence.intercepters.LoginIntercepter;
import com.example.expence.intercepters.RoleCheckInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Autowired
    private LoginIntercepter loginIntercepter;

    @Autowired
    private RoleCheckInterceptor roleCheckInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginIntercepter).excludePathPatterns("/user/login","/user/register");
        registry.addInterceptor(roleCheckInterceptor) .addPathPatterns("/**"); // 拦截所有路径
    }

}
