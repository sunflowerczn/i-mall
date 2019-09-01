package com.imcode.common.websocket;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.websocket.OnClose;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.util.concurrent.CopyOnWriteArraySet;

@Component
@ServerEndpoint("/websocket/notify")
public class WebSocketService {

    private Logger log = LoggerFactory.getLogger(WebSocketService.class);

    private Session session;

    // 客户端连接信息的集合
    private static CopyOnWriteArraySet<WebSocketService> webSocketSet = new CopyOnWriteArraySet<>();

    /**
     * 客户端和服务器建立连接
     * @param session
     */
    @OnOpen
    public void onOpen(Session session){
        this.session = session;
        webSocketSet.add(this);
        log.debug("【websocket消息】有新的连接, 总数:{}", webSocketSet.size());
    }


    /**
     * 客户端和服务器断开连接的时候调用
     */
    @OnClose
    public void onClose(){
        webSocketSet.remove(this);
        log.debug("【websocket消息】连接断开, 总数:{}", webSocketSet.size());
    }


    /**
     * 向所有的客户端广播消息
     * @param message
     */
    public void sendMessage(String message) {
        // 遍历所有的客户端
        for(WebSocketService webSocket : webSocketSet){
            // 给每个客户端都发送消息 广播模式
            log.debug("【websocket消息】广播消息, message={}", message);
            try {
                // session 拿到客户端会话信息 从会话获取客户端的主机信息getBasicRemote()
                // sendText 向客户端发送消息
                webSocket.session.getBasicRemote().sendText(message);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
