package com.example.expence.aop;


import com.example.expence.anno.RoleCheck;
import com.example.expence.mapper.UserMapper;
import com.example.expence.utils.Result;
import com.example.expence.utils.ThreadLocalUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
        String[] roles = roleCheck.roles();
        boolean hasPermission = hasPermission(roles);
        if (!hasPermission) {
            return Result.error("你权限不够哦");
        }
        return joinPoint.proceed();
    }

    private boolean hasPermission(String[] roles) {
        Map<String,Object> claims = ThreadLocalUtil.get();
        Object id = claims.get("id");
        // 获取用户角色的逻辑
        // 实际应用中需要从请求中获取用户的角色字段
        String userRole = userMapper.selectRoleById(id);
//        contain方法看是否包含这个元素
        return Arrays.asList(roles).contains(userRole);
    }
}
