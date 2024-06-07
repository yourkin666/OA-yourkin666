package com.example.expence.websocket.pojo;

import lombok.Data;


@Data
public class ResultMessage {

    private boolean isSystem;
    private String fromName;
    private Object message;//如果是系统消息是数组
}
