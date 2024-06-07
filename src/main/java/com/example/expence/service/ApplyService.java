package com.example.expence.service;

import com.example.expence.utils.Result;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Map;

/**
 * @author yourkin666
 * @date 2024/05/24/18:09
 * @description
 */
public interface ApplyService {
    Result apply(Map<String, String> parms);

    Result approveJoin(@RequestBody Map<String,String> parms);

    Result check();

    Result approveTurn1(Map<String, String> parms);

    Result approveTurn2(Map<String, String> parms);

    Result approveLeave(Map<String, String> parms);

    Result checkOne();
}
