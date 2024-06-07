package com.example.expence.AOP;


import com.example.expence.anno.RoleCheck;
import com.example.expence.mapper.UserMapper;
import com.example.expence.utils.ThreadLocalUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Arrays;
import java.util.Map;

/**
 * @author yourkin666
 * @date 2024/06/07/18:55
 * @description
 */
@Aspect
@Component
public class RoleCheckAspect {
    @Autowired
    private UserMapper userMapper;


    @Around("@annotation(roleCheck)")
    public Object checkRole(ProceedingJoinPoint joinPoint, RoleCheck roleCheck) throws Throwable {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String[] roles = roleCheck.roles();
        // 这里简化处理，实际应用中需要从请求中获取用户的角色字段
        boolean hasPermission = hasPermission(request, roles);
        if (!hasPermission) {
            HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
            response.setStatus(HttpStatus.FORBIDDEN.value());
            return null;
        }
        return joinPoint.proceed();
    }

    private boolean hasPermission(HttpServletRequest request, String[] roles) {
        // 实现检查用户是否有权限的逻辑
        Map<String,Object> claims = ThreadLocalUtil.get();
        Object id = claims.get("id");

        // 获取用户角色的逻辑
        // 实际应用中需要从请求中获取用户的角色字段
        String userRole = userMapper.selectRoleById(id);
//        contain方法看是否包含这个元素
        return Arrays.asList(roles).contains(userRole);
    }
}
