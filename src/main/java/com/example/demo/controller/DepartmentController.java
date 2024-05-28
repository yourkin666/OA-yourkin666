package com.example.demo.controller;

import com.example.demo.anno.RoleCheck;
import com.example.demo.utils.Result;
import com.example.demo.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @author yourkin666
 * @date 2024/05/21/11:57
 * @description
 */
@RestController
@RequestMapping("/department")
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

//  ad/su发公告
    @PostMapping("/addAnnouncement")
    @RoleCheck(roles = {"ad", "su"})
    public Result addAnnouncement(@RequestBody Map<String,String> parms) {
        return  departmentService.addAnnouncement(parms);
    }

//  查看公告
    @GetMapping("/seeAnnouncement")
    public Result seeAnnouncement() {
        return departmentService.selectAnnouncement();
    }

//  查看部门成员
    @GetMapping("/selectmembers")
    public Result selectmembers() {
        return departmentService.selectMembers();
    }

//  查看个人所在部门
    @GetMapping("/selectDepartment")
    public Result selectDepartment() {
        return departmentService.selectDepartment();
    }

}
