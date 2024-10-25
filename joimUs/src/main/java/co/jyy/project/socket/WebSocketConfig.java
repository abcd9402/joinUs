package co.jyy.project.socket;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {


    private final ChattingHandler chattingHandler;

    public WebSocketConfig(ChattingHandler chattingHandler) {
        this.chattingHandler = chattingHandler;
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(chattingHandler, "/chat")
                .addInterceptors(new CustomHandshakeInterceptor()) // HandshakeInterceptor 추가
                .setAllowedOrigins("*"); // 필요에 따라 CORS 설정
    }
}