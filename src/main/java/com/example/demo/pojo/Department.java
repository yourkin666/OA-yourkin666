package com.example.demo.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author yourkin666
 * @date 2024/05/21/11:47
 * @description
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Department {
    private Integer id;//主键ID
    private String name;//用户名
    private Integer employId;
}
