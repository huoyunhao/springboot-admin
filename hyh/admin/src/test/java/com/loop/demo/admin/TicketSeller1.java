package com.loop.demo.admin;

import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: 霍运浩
 * @Date: 2019/3/16 0016 12:39
 * @Description:
 */
public class TicketSeller1 {

    static List<String> tickets = new ArrayList<>();

    static {
        for (int i = 0; i < 1000; i++) {
            tickets.add("票-" + i);
        }
    }

    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            new Thread(() -> {
                while (tickets.size() > 0) {
                    System.out.println("销售了：" + tickets.remove(0));
                }
            }).start();
        }
    }

}
