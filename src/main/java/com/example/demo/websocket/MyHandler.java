package com.example.demo.websocket;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.HashSet;
import java.util.Set;
//继承了TextWebSocketHandler类，这意味着MyHandler用于处理文本类型的WebSocket消息。
public class MyHandler extends TextWebSocketHandler {
//
    private static Set<WebSocketSession> sessions = new HashSet<>();

//连接建立时，向sessions集合中添加该WebSocketSession
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessions.add(session);
        session.sendMessage(new TextMessage("连接成功！"));
    }

//收到WebSocket消息时，向所有WebSocketSession发送消息
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        for (WebSocketSession webSocketSession : sessions) {
            webSocketSession.sendMessage(new TextMessage(message.getPayload()));
        }
    }

//关闭连接时，从sessions集合中移除该WebSocketSession
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session);
    }
}
