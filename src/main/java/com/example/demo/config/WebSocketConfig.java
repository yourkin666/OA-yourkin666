package com.example.expence.config;

import com.example.expence.websocket.MyHandler;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
// WebSocketConfigurer接口用于配置WebSocket的相关选项
public class WebSocketConfig implements WebSocketConfigurer {

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
//        指定了处理程序所处理的端点URL为/chat。同时，使用setAllowedOrigins("*")方法指定了允许的跨域请求来源
        registry.addHandler(new MyHandler(), "/chat").setAllowedOrigins("*");
    }
}
