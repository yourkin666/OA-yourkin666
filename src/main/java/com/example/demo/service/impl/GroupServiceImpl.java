package com.example.demo.service.impl;

import com.example.demo.mapper.GroupMapper;
import com.example.demo.pojo.Group;
import com.example.demo.utils.Result;
import com.example.demo.service.GroupService;
import com.example.demo.utils.ThreadLocalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.*;

/**
 * @author yourkin666
 * @date 2024/05/21/21:41
 * @description
 */
@Service
public class GroupServiceImpl implements GroupService {
    @Autowired
    private GroupMapper groupMapper;
    @Override
    public Result addMembers(Map<String,String> parms) {

        String name = parms.get("name");
        String member = parms.get("member");
        if (!StringUtils.hasLength(name)){
            return Result.error("请输入指定小组名称");
        }
        groupMapper.addMember(name, member);
        return Result.success();
    }

    @Override
    public Result addTask( Map<String,String> parms) {
        String content = parms.get("content");
        String groupName = parms.get("groupname");
        if (!StringUtils.hasLength(content) ||!StringUtils.hasLength(groupName)){
            return Result.error("参数不全");
        }
        groupMapper.addTask(content, groupName);
        return Result.success();
    }

    @Override
    public Result selectTask1() {
        Map<String,Object> claims = ThreadLocalUtil.get();
        Object id = claims.get("id");
        String groupName = groupMapper.selectGroup(id);
        return Result.success(groupMapper.selectTask(groupName));
    }
    @Override
    public Result selectTask2(String groupname) {
        return Result.success(groupMapper.selectAllTasks(groupname));
    }

//    更新任务
    @Override
    public Result updateTask( Map<String,String> parms) {
        String content = parms.get("content");
        String id = parms.get("id");
        if (!StringUtils.hasLength(content) ||!StringUtils.hasLength(id)){
            return Result.error("参数不全");
        }

//        设置关卡,若任务已完成,则无法修改哦
        String process = groupMapper.selectProcess(id);
        if (process.equals("1")) {
            return Result.error("任务已完成,无法修改哦");
        }

        groupMapper.updateTask(content, id);
        return Result.success();
    }

    @Override
    public Result updateProcess(int id, String status) {
        if (!StringUtils.hasLength(String.valueOf(id)) ||!StringUtils.hasLength(status)){
            return Result.error("参数不全");
        }
        //        设置关卡,若任务已完成,则无法修改哦
        String process = groupMapper.selectProcess(String.valueOf(id));
        if (
                process.equals("1")) {
            return Result.error("任务已完成,无法修改哦");
        }
        groupMapper.updateProcess(id,status);
        return Result.success();    }

    @Override
    public Result foundGroup(String name) {
        groupMapper.foundGroup(name);
        return Result.success();
    }

    @Override
    public Result selectGroups() {
        return Result.success(groupMapper.selectGroups());
    }

}
