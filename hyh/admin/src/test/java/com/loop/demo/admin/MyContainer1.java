package com.loop.demo.admin;

/**
 * @Auther: 霍运浩
 * @Date: 2019/3/16 0016 11:09
 * @Description:
 */

import java.util.LinkedList;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 经典面试题：写一个固定容量的容器，拥有put和get方法，以及getCount方法
 * 能够支持2个生产者线程以及10个消费者线程的阻塞调用
 * <p>
 * 点：生产者消费者模式
 * <p>
 * 如果调用 get方法时，容器为空，get方法就需要阻塞等待
 * 如果调用 put方法时，容器满了，put方法就需要阻塞等待
 * <p>
 * 实现方式：
 * 1. wait/notify
 * 2. Condition
 * <p>
 * <p>
 * 使用Lock和Condition实现，可以精确唤醒某些线程
 */
public class MyContainer1<T> {

    private final LinkedList<T> list = new LinkedList<>();
    private final int MAX = 10;
    private int count = 0;

    public synchronized void put(T t) {
        while (MAX == count) { // 如果容量最大，释放锁等待    ///【这里为什么使用while，而不是使用if？？？】
            try {
                this.wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        // 否则 put
        list.add(t);
        ++count;
        this.notifyAll(); // 通知消费者线程，可以消费了
        // 【这里为什么调用 notifyAll 而不是 notify ？】
    }

    public synchronized T get() {
        while (list.size() == 0) { // 如果容量为空，释放锁等待
            try {
                this.wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        // 否则获取
        T t = list.removeFirst();
        count--;
        this.notifyAll(); // 通知生产者线程生产
        return t;
    }

    public static void main(String[] args) {
        MyContainer1<String> c = new MyContainer1<>();
        // 启动消费者线程
        for (int i = 0; i < 10; i++) {
            new Thread(() -> {
                for (int j = 0; j < 5; j++) {
                    System.out.println(c.get());
                }
            }, "c_" + i ).start();
        }

        try {
            TimeUnit.SECONDS.sleep(1);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        for (int i = 0; i < 2; i++) {
            new Thread(()->{
                for (int j = 0; j < 2; j++) {
                    c.put(Thread.currentThread().getName() + " " + j);
                }
            }, "p_" + i).start();
        }
    }
}

