package com.example.expence.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author yourkin666
 * @date 2024/05/22/16:12
 * @description
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Task {
    private Integer id;
    private String content;
    private String process;
    private Integer groupName;
}
