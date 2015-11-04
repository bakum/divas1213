package ua.divas.bean;

import java.io.IOException;

import java.util.Date;

import java.util.Queue;

import java.util.concurrent.ConcurrentLinkedQueue;

import weblogic.websocket.ClosingMessage;
import weblogic.websocket.WebSocketAdapter;
import weblogic.websocket.WebSocketConnection;
import weblogic.websocket.annotation.WebSocket;

@WebSocket(timeout = -1, pathPatterns = { "/service/*" })
public class SocketMediator extends WebSocketAdapter {
    final static Queue<WebSocketConnection> queue = new ConcurrentLinkedQueue<>();
    
    private static SocketMediator sm;

    public static SocketMediator getSm() {
        return sm;
    }

    public SocketMediator() {
        super();
        sm = this;
    }

    @Override
    public void onOpen(WebSocketConnection webSocketConnection) {
        System.out.println("New connection was created from a client " + webSocketConnection.getRemoteAddress());
        //super.onOpen(webSocketConnection);
        queue.add(webSocketConnection);
    }

    @Override
    public void onClose(WebSocketConnection webSocketConnection, ClosingMessage closingMessage) {
        queue.remove(webSocketConnection);
        //super.onClose(webSocketConnection, closingMessage);
    }

    @Override
    public void onError(WebSocketConnection webSocketConnection, Throwable throwable) {
        queue.remove(webSocketConnection);
        //super.onError(webSocketConnection, throwable);
    }

    @Override
    public void onMessage(WebSocketConnection connection, String payload) {
        // Sends message from the browser back to the client.
        String msgContent = "Message \"" + payload + "\" has been received by server. At:" + new Date();
        System.out.println(msgContent);
        try {
            connection.send("ECHO: " + msgContent);
            broadcast("Grouphug: " + msgContent);
        } catch (IOException e) {
            try {
                connection.close(ClosingMessage.SC_GOING_AWAY);
            } catch (IOException f) {
                f.printStackTrace();
            }
        }
    }


    public void broadcast(String message) {
        for (WebSocketConnection conn : SocketMediator.queue) {
            try {
                conn.send(message);
                System.out.println("Message was sent to client: " + message);
                System.out.println("Client: " + conn.getRemoteAddress());
            } catch (IOException ioe) {
                ioe.printStackTrace();
            }
        }
    }

}
