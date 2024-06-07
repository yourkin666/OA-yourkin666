package com.example.expence.controller;

import com.example.expence.anno.RoleCheck;
import com.example.expence.utils.Result;
import com.example.expence.service.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @author yourkin666
 * @date 2024/05/21/21:39
 * @description
 */

@RestController
@RequestMapping("/group")
public class GroupController {
    @Autowired
    private GroupService groupService;

//  创建小组
    @PostMapping("/foundGroup")
    @RoleCheck(roles = {"ad", "su"})
    public Result foundGroup(String name) {
        return groupService.foundGroup(name);
    }

//  ad往指定小组加人
    @PostMapping("/addmember")
    @RoleCheck(roles = {"ad", "su"})
    public Result addMembers(@RequestBody Map<String,String> parms) {
        return groupService.addMembers(parms);
    }

//    查看已创建的小组
    @GetMapping("/allgroups")
    @RoleCheck(roles = {"ad", "su"})
    public Result selectGroups() {
        return groupService.selectGroups();
    }

//    派任务
    @PostMapping("/addtask")
    @RoleCheck(roles = {"ad", "su"})
    public Result addTask(@RequestBody Map<String,String> parms) {
        return groupService.addTask(parms);
    }

//    更新任务
    @PostMapping("/updatetask")
    @RoleCheck(roles = {"ad", "su"})
    public Result updateTask(@RequestBody Map<String,String> parms) {
        return groupService.updateTask(parms);
    }

//    查看任务
//    1.这是普通员工查看方式(只能看自己的)
    @GetMapping("/selectTask")
    @RoleCheck(roles = {"user"})
    public Result selectTask1() {
        return groupService.selectTask1();
    }

//    2.这是su和ad查看方式(想看哪个看哪个的)
    @GetMapping("/selectTasks")
    @RoleCheck(roles = {"ad", "su"})
    public Result selectTask2(String groupname) {
        return groupService.selectTask2(groupname);
}

//    更新任务完成进度
//    若process标记为1,则说明任务完成
//    查询前提:已通过查看任务接口得知了任务id,等会会传id
    @PostMapping("/updateProcess")
    public Result updateProcess(int id, String status) {
        return groupService.updateProcess(id, status);
    }
}
