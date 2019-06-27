package com.loop.demo.admin;

import java.util.Vector;
import java.util.concurrent.TimeUnit;

/**
 * @Auther: 霍运浩
 * @Date: 2019/3/16 0016 12:40
 * @Description:
 */
public class TicketSeller2 {

    static Vector<String> tickets = new Vector<>();

    static {
        for (int i = 0; i < 1000; i++) {
            tickets.add("票-" + i);
        }
    }

    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            new Thread(() -> {
                while (tickets.size() > 0) {
                    // 将问题方法，睡1s
                    try {
                        TimeUnit.SECONDS.sleep(1);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    System.out.println("销售了：" + tickets.remove(0));
                }
            }).start();
        }
    }

}
