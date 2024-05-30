package com.example.expence.intercepters;

import com.example.expence.anno.RoleCheck;
import com.example.expence.mapper.UserMapper;
import com.example.expence.utils.ThreadLocalUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.Map;

@Component
public class RoleCheckInterceptor implements HandlerInterceptor {
    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            RoleCheck roleCheck = handlerMethod.getMethodAnnotation(RoleCheck.class);
            if (roleCheck != null) {
                String[] roles = roleCheck.roles();
                // 这里简化处理，实际应用中需要从请求中获取用户的角色字段
                boolean hasPermission = hasPermission(request, roles);
                if (!hasPermission) {
                    response.setStatus(HttpStatus.FORBIDDEN.value());
                    return false;
                }
            }
        }
        return true;
    }

    private boolean hasPermission(HttpServletRequest request, String[] roles) {
        Map<String,Object> claims = ThreadLocalUtil.get();
        Object id = claims.get("id");

        // 获取用户角色的逻辑
        // 实际应用中需要从请求中获取用户的角色字段
        String userRole = userMapper.selectRoleById(id);
//        contain方法看是否包含这个元素
        return Arrays.asList(roles).contains(userRole);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }


}