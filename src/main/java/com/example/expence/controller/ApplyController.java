package com.example.expence.controller;

import com.example.expence.anno.RoleCheck;
import com.example.expence.service.ApplyService;
import com.example.expence.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @author yourkin666
 * @date 2024/05/24/18:08
 * @description
 */
@RestController
@RequestMapping("/apply")
public class ApplyController {
    @Autowired
    private ApplyService applyService;

//    申请（包括请假，加部门和转部门），status显示为0（待办）
    @PostMapping("")
    @RoleCheck(roles = {"user"})
    public Result apply(@RequestBody Map<String,String> parms) {
        return applyService.apply(parms);
    }

//    user查看申请
    @GetMapping("/checkOne")
    @RoleCheck(roles = {"user"})
    public Result checkOne() {
        return applyService.checkOne();
}

//    ad/su查看申请
    @GetMapping("/checkAll")
    @RoleCheck(roles = {"ad", "su"})
    public Result check() {
        return applyService.check();
    }


//    审批(加部门)，status显示为1（意为同意），status显示为2（意为拒绝）
//    请求体内容
//{
//        "id" : "2",           apply id
//        "name" :"wwwwww",     apply 人
//        "dpName": "研发部门",  相加的部门
//        "status": "1"         apply status
//}
    @PostMapping("/approveJoin")
    @RoleCheck(roles = {"ad", "su"})
    public Result approveJoin(@RequestBody Map<String,String> parms) {
        return applyService.approveJoin(parms);
    }

//    ad审批（转部门）,不同意就设置status为2，同意可以设置status为3（表示自己看到并操作了）
//    请求体内容
//{
//        "id": "5",
//        "status": "2"
//}
    @PostMapping("/approveTurn1")
    @RoleCheck(roles = {"ad"})
    public Result approveTurn1(@RequestBody Map<String,String> parms) {
        return applyService.approveTurn1(parms);
}

//    su审批（转部门），如果先检查到status为2，则无法操作,同意就设置status为1，不同意再去设置为2
//    请求体内容
//{
//        "name":"ssssss",
//        "id":"5",
//        "dpName":"研发部门",
//        "status":"1"
//}
    @PostMapping("/approveTurn2")
    @RoleCheck(roles = { "su"})
    public Result approveTurn2(@RequestBody Map<String,String> parms) {
        return applyService.approveTurn2(parms);
}

//    审批（请假），驳回的status为3
//    请求体内容
//{
//        "name": "wwwwww",
//        "id": "1",
//        "status": "3",
//        "feedback": "理由打动不了我"
//
//}
    @PostMapping("/approveLeave")
    @RoleCheck(roles = { "su", "ad"})
    public Result approveLeave(@RequestBody Map<String,String> parms) {
        return applyService.approveLeave(parms);
}
}
