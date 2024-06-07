package com.example.expence.websocket.pojo;

import lombok.Data;

@Data
public class Message {
    private String toName;
    private String message;
}
