package com.example.expence.service.impl;

import com.example.expence.mapper.Applymapper;
import com.example.expence.mapper.DepartmentMapper;
import com.example.expence.service.ApplyService;
import com.example.expence.utils.Result;
import com.example.expence.utils.ThreadLocalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Map;

/**
 * @author yourkin666
 * @date 2024/05/24/18:09
 * @description
 */
@Service
public class ApplyServiceImpl implements ApplyService {
    @Autowired
    private Applymapper applymapper;
    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public Result apply(Map<String, String> parms) {
        Map<String,Object> claims = ThreadLocalUtil.get();
        String userName = (String) claims.get("userName");
        String content = parms.get("content");
        applymapper.insertOneApply(content, userName);
        return Result.success();
    }


    @Override
    public Result check() {
        return Result.success(applymapper.selectAllApplies());
    }

    @Override
    public Result approveJoin(@RequestBody Map<String,String> parms) {
        int status = Integer.parseInt(parms.get("status"));
        if (status == 1) {
            int id = Integer.parseInt(parms.get("id"));
            String name = parms.get("name");
            String dpName = parms.get("dpName");
            if (!StringUtils.hasLength(String.valueOf(id)) || !StringUtils.hasLength(dpName)) {
                return Result.error("参数不全");
            }
//           排除重复记录的情况发生
           if(StringUtils.hasLength(departmentMapper.selectDpName(name))) {
               return Result.success("已经重复操作过了！！！");
           }
            applymapper.updateStatus(status, id);
            applymapper.joinDepartment(name, dpName);
            return Result.success();
        }
        else {
            return Result.error("no！！！");
        }
    }

    @Override
    public Result approveTurn1(Map<String, String> parms) {
        int status = Integer.parseInt(parms.get("status"));
        int id = Integer.parseInt(parms.get("id"));
        applymapper.updateStatus(status, id);
        return Result.success();
    }

    @Override
    public Result approveTurn2(Map<String, String> parms) {
        int status = Integer.parseInt(parms.get("status"));
        String name = parms.get("name");
        int id = Integer.parseInt(parms.get("id"));
        String dpName = parms.get("dpName");
        int empStatus = applymapper.selectStatus(id);
        if (empStatus == 2){
            return Result.error("ad 不同意！！！");
        }
        if(status == 2) {
            return Result.success("拒绝成功！！！");
        }
        else {
            applymapper.updateStatus(status, id);
            applymapper.updateDp(name, dpName);
            return Result.success();
        }
    }

    @Override
    public Result approveLeave(Map<String, String> parms) {
        int status = Integer.parseInt(parms.get("status"));
        String name = parms.get("name");
        int id = Integer.parseInt(parms.get("id"));
        String feedback = parms.get("feedback");
        if (status == 3) {
            applymapper.setFeedback(feedback, id);
            applymapper.updateStatus(status,id);
            return Result.success("驳回成功");
        }
        applymapper.updateStatus(status,id);
        return Result.success();
    }

    @Override
    public Result checkOne() {
        Map<String,Object> claims = ThreadLocalUtil.get();
        Object name = claims.get("userName");
        return Result.success(applymapper.selectOne(name));
    }

}
