package com.example.demo.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author yourkin666
 * @date 2024/05/24/18:06
 * @description
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Apply {
    private Integer id;
    private String content;
    private String userName;
    private boolean status;
}
