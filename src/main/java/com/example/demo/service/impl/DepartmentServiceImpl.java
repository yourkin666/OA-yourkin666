package com.example.demo.service.impl;

import com.example.demo.mapper.DepartmentMapper;
import com.example.demo.pojo.Announcement;
import com.example.demo.utils.Result;
import com.example.demo.service.DepartmentService;
import com.example.demo.utils.ThreadLocalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * @author yourkin666
 * @date 2024/05/21/12:01
 * @description
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public Result addAnnouncement(Map<String, String> parms) {
        String title = parms.get("title");
        String content = parms.get("content");
        if (!StringUtils.hasLength(title)||!StringUtils.hasLength(content)){
            return Result.error("参数不全");
        }

        Map<String,Object> claims = ThreadLocalUtil.get();
        Object username = claims.get("userName");

        String dpName = departmentMapper.selectDpName(username);
        departmentMapper.addAnnouncement( title, content, dpName);

        return Result.success();    }

    @Override
    public Result selectAnnouncement() {
        Map<String,Object> claims = ThreadLocalUtil.get();
        Object username = claims.get("userName");
        String dpName = departmentMapper.selectDpName(username);
        List<Announcement> announcement = departmentMapper.selectAnnoucement(dpName);
        return Result.success(announcement);
    }

    @Override
    public Result selectMembers() {
        Map<String,Object> claims = ThreadLocalUtil.get();
        Object username = claims.get("userName");
        String dpName = departmentMapper.selectDpName(username);
        return Result.success(departmentMapper.selectMembers(dpName));
    }

    @Override
    public Result selectDepartment() {
        Map<String,Object> claims = ThreadLocalUtil.get();
        Object username = claims.get("userName");
        return Result.success(departmentMapper.selectDepartment(username));
    }
}
