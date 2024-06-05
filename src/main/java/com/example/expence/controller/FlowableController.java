package com.example.expence.controller;

import com.example.expence.anno.RoleCheck;
import com.example.expence.utils.Result;
import jakarta.servlet.http.HttpServletResponse;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.engine.*;
import org.flowable.engine.runtime.Execution;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.image.ProcessDiagramGenerator;
import org.flowable.task.api.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author yourkin666
 * @date 2024/05/30/10:19
 * @description：报销流程
 */
@RestController
@RequestMapping( "/cost")
public class FlowableController {
    @Autowired
    private RuntimeService runtimeService;
    @Autowired
    private TaskService taskService;
    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private ProcessEngine processEngine;

    /**
     * 提交申请
     *
     * @param userId    用户Id
     * @param money     报销金额
     * @param username  申请人名字
     * @param descption 描述
     */
    @PostMapping( "/apply")
    public String addExpense(String userId, Integer money, String username, String descption) {
        //启动流程
        HashMap<String, Object> map = new HashMap<>();
        Map<String,Object> claims = ThreadLocalUtil.get();
        Object userName = claims.get("userName");
        map.put("taskUser", userId);
        map.put("user", userName);
        map.put("money", money);
        map.put("descption", descption);
        ProcessInstance processInstance = runtimeService.startProcessInstanceByKey("Expense", map);
        return "提交成功.流程Id为：" + processInstance.getId();
    }

    /**
     * 获取审批管理列表
     *
     * @param userId    用户Id
     */
    @GetMapping( "/list")
    public List<Map<String, Object>> findUserAgentTask(String userId) {
        //1.查找指定用户的一个待办任务
        List<Task> taskList = taskService.createTaskQuery()
                .taskAssignee(userId)
                .list();
        List<Map<String,Object>> list = new ArrayList<>();
        for (Task task : taskList) {
            Map<String,Object> map =  new HashMap<>();
            map.put("TaskId",task.toString());
            list.add(map);
        }
        return list;

    }    

    /**
     * 批准
     *
     * @param taskId 任务ID
     */
    @PostMapping("/approve")
    @RoleCheck(roles = {"ad", "su"})
    public String apply(String taskId) {
        Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
        if (task == null) {
            throw new RuntimeException("流程不存在");
        }
        //通过审核
        HashMap<String, Object> map = new HashMap<>();
        map.put("outcome", "通过");
        taskService.complete(taskId, map);
        return "ok!";
    }

    /**
     * 拒绝
     *
     * @param taskId 任务ID
     */
    @PostMapping( "/reject")
    @RoleCheck(roles = {"ad", "su"})
    public String reject(String taskId) {
        Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
        if (task == null) {
            throw new RuntimeException("流程不存在");
        }
        HashMap<String, Object> map = new HashMap<>();
        map.put("outcome", "驳回");
        taskService.complete(taskId, map);
        return "No!";
    }

    /**
     * 生成流程图
     *
     * @param processId 任务ID
     */
    @GetMapping("/processDiagram")
    public void genProcessDiagram(HttpServletResponse httpServletResponse, String processId) throws Exception {
        ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();

        //流程走完的不显示图
        if (pi == null) {
            return;
        }
        Task task = taskService.createTaskQuery().processInstanceId(pi.getId()).singleResult();
        //使用流程实例ID，查询正在执行的执行对象表，返回流程实例对象
        String InstanceId = task.getProcessInstanceId();
        List<Execution> executions = runtimeService
                .createExecutionQuery()
                .processInstanceId(InstanceId)
                .list();

        //得到正在执行的Activity的Id
        List<String> activityIds = new ArrayList<>();
        List<String> flows = new ArrayList<>();
        for (Execution exe : executions) {
            List<String> ids = runtimeService.getActiveActivityIds(exe.getId());
            activityIds.addAll(ids);
        }

        //获取流程图
        BpmnModel bpmnModel = repositoryService.getBpmnModel(pi.getProcessDefinitionId());
        ProcessEngineConfiguration engconf = processEngine.getProcessEngineConfiguration();
        ProcessDiagramGenerator diagramGenerator = engconf.getProcessDiagramGenerator();
        InputStream in = diagramGenerator.generateDiagram(bpmnModel, "png", activityIds, flows, engconf.getActivityFontName(), engconf.getLabelFontName(), engconf.getAnnotationFontName(), engconf.getClassLoader(), 1.0, true);
        OutputStream out = null;
        byte[] buf = new byte[1024];
        int legth = 0;
        try {
            out = httpServletResponse.getOutputStream();
            while ((legth = in.read(buf)) != -1) {
                out.write(buf, 0, legth);
            }
        } finally {
            if (in != null) {
                in.close();
            }
            if (out != null) {
                out.close();
            }
        }
    }
}
