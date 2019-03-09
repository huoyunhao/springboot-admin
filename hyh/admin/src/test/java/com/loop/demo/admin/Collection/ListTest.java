package com.loop.demo.admin.Collection;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @Auther: 霍运浩
 * @Date: 2019/1/26 0026 17:09
 * @Description:
 */
public class ListTest {


    public static void main(String[] args) {

        List<String> list = new ArrayList<>();
        list.add("aaa");
        list.add("bbb");
        list.add("ccc");




        System.out.println("方法一：");
        System.out.println("超级for循环遍历");
        for(String attribute : list) {
            System.out.println(attribute);
        }



        System.out.println("方法二：");
        System.out.println("对于ArrayList来说速度比较快, 用for循环, 以size为条件遍历:");
        for(int i = 0 ; i < list.size() ; i++) {
            System.out.println(list.get(i));
        }





        System.out.println("方法三：");
        System.out.println("集合类的通用遍历方式, 从很早的版本就有, 用迭代器迭代");
        Iterator it = list.iterator();
        while(it.hasNext()) {
            System.out.println(it.next());
        }




        System.out.println("方法四");
        System.out.println("java8 闭包Lambda stream 并行遍历");
        list.parallelStream().forEach(e -> {
            System.out.println(e);
        });
        System.out.println("java8 闭包Lambda 简写");
        list.forEach(System.out::println);




        System.out.println("方法四");
        System.out.println("java8 闭包Lambda stream 串行遍历");
        list.stream().forEach(e -> {
            System.out.println(e);
        });
    }
}
