package com.example.expence.controller;

import org.springframework.ai.openai.OpenAiChatClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author yourkin666
 * @date 2024/05/25/16:25
 * @description
 */
@RestController
@RequestMapping("/ai")
public class AIController {
    @Autowired
    private OpenAiChatClient openAiChatClient;

    @GetMapping("/chat")
    public String caht(String msg) {
        return openAiChatClient.call(msg);


    }
}
