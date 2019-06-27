package com.loop.demo.admin;

import java.util.concurrent.TimeUnit;

/**
 * @Auther: 霍运浩
 * @Date: 2019/3/16 0016 11:29
 * @Description:
 */
public class ThreadLocal1 {

    /*volatile*/ static Person p = new Person();

    public static void main(String[] args) {
        new Thread(() -> {
            try {
                TimeUnit.SECONDS.sleep(2);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println(p.name);  // 在加与不加volatile的情况下，这句话打印的值分别是？ 答：不写volatile有可能发生可见性问题
        }).start();

        new Thread(() -> {
            try {
                TimeUnit.SECONDS.sleep(1);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            p.name = "lisi";
        }).start();
    }

    static class Person {
        String name = "zhangsan";
    }
}
