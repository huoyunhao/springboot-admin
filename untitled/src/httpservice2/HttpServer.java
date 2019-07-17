package httpservice2;

import java.io.IOException;

import java.net.ServerSocket;
import java.net.Socket;


public class HttpServer {

    public static void main(String[] args) throws IOException {
        //启动服务器，监听12345端口
        ServerSocket server = new ServerSocket(12345);
        System.out.println("服务器启动，监听12345端口....");
        while (!Thread.interrupted()){
            //不停接收客户端请求
            Socket client = server.accept();
            //开启线程
            new Thread(new ServerThread(client)).start();
        }
        server.close();

    }


}
