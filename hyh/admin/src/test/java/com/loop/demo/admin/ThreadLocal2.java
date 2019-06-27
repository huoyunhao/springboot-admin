package com.loop.demo.admin;

import java.util.concurrent.TimeUnit;

/**
 * @Auther: 霍运浩
 * @Date: 2019/3/16 0016 11:31
 * @Description:
 */
public class ThreadLocal2 {

    static ThreadLocal<Person> p = new ThreadLocal<>();

    public static void main(String[] args) {
        new Thread(() -> {
            try {
                TimeUnit.SECONDS.sleep(2);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println(p.get()); // 2. 虽然threadLocal时共享变量，但是取不到其他线程放入的值，所以此处为null
        }).start();

        new Thread(() -> {
            try {
                TimeUnit.SECONDS.sleep(1);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            p.set(new Person()); // 1. 往线程局部变量放入一个person
        }).start();
    }

    static class Person {
        String name = "zhangsan";
    }
}
