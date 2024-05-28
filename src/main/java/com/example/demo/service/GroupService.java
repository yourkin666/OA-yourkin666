package com.example.demo.service;

import com.example.demo.utils.Result;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Map;

/**
 * @author yourkin666
 * @date 2024/05/21/21:40
 * @description
 */
public interface GroupService {
    Result addMembers(Map<String,String> parms);

    Result addTask(Map<String,String> parms);

    Result selectTask1();

    Result updateTask( Map<String,String> parms);

    Result updateProcess(int id, String status);

    Result foundGroup(String name);

    Result selectGroups();

    Result selectTask2(String groupname);
}
