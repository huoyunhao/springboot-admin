package com.loop.demo.admin;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentSkipListMap;
import java.util.concurrent.CountDownLatch;

/**
 * @Auther: 霍运浩
 * @Date: 2019/3/16 0016 15:26
 * @Description:
 */
public class T01_ConcurrentMap {

    public static void main(String[] args) {

//        Map<String, String> map = new HashMap<>();
//        Map<String, String> map = new Hashtable<>(); // 423  每次加锁，都锁一个对象
        Map<String, String> map = new ConcurrentHashMap<>(); // 309，加的是分段所，将容器分为16段，每段都有一个锁 segment; 1.8以后 使用 Node + synchronized+CAS
//        Map<String, String> map = new ConcurrentSkipListMap<>(); // 317  并发且排序，插入效率较低，但是读取很快

        Random r = new Random();
        Thread[] ths = new Thread[100];
        CountDownLatch latch = new CountDownLatch(ths.length); // 启动了一个门闩，每有一个线程退出，门闩就减1，直到所有线程结束，门闩打开，主线程结束

        long start = System.currentTimeMillis();
        // 创建100个线程，每个线程添加10000个元素到map，并启动这些线程
        for (int i = 0; i < ths.length; i++) {
            ths[i] = new Thread(() -> {
                for (int j = 0; j < 10000; j++) {
                    map.put("a" + r.nextInt(10000), "a" + r.nextInt(100000));
                }
                latch.countDown();
            }, "t" + i);
        }
        Arrays.asList(ths).forEach(Thread::start);

        try {
            latch.await();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        long end = System.currentTimeMillis();
        System.out.println(end - start);
        System.out.println(map.size());
    }

}

