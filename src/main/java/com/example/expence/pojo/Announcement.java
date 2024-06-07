package com.example.expence.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author yourkin666
 * @date 2024/05/21/11:53
 * @description
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Announcement {
    private Integer id;//主键ID
    private String title;
    private String content;
    private String dpName;
}

