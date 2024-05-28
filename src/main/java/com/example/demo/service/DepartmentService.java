package com.example.demo.service;

import com.example.demo.utils.Result;

import java.util.Map;

/**
 * @author yourkin666
 * @date 2024/05/21/12:00
 * @description
 */
public interface DepartmentService {
    Result addAnnouncement(Map<String, String> parms);

    Result selectAnnouncement();

    Result selectMembers();

    Result selectDepartment();
}
