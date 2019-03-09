package com.loop.demo.admin.Collection;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * @Auther: 霍运浩
 * @Date: 2019/1/26 0026 17:22
 * @Description:
 */
public class MapTest {

    public static void main(String[] args) {

        Map<String, Object> map = new HashMap<>();

        map.put("key1", "value1");
        map.put("key2", "value2");
        map.put("key3", "value3");
        map.put("key4", 4);
        map.put("key5", 5);
        map.put("key6", 6);



        System.out.println("方式一");
        System.out.println("通过Map.keySet遍历key和value");
        System.out.println();
        System.out.println("java 7 foreach");

        for (String key : map.keySet()) {
            System.out.println("key:" + key + "-" +"value:"+ map.get(key));
        }
        System.out.println();
        System.out.println("java 8 lambdab遍历");

        map.keySet().forEach(key -> System.out.println("key:" + key + "-" +"value:"+ map.get(key)));


        System.out.println();
        System.out.println("方式二");
        System.out.println("通过Map.entrySet使用Iterator遍历key和value");
        System.out.println();
        System.out.println("java 7 Map.entrySet");
        Iterator<Map.Entry<String, Object>> iterator = map.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<String, Object> entry = iterator.next();
            System.out.println("key:" + entry.getKey() + "-" +"value:"+ entry.getValue());
        }
        System.out.println();
        System.out.println("java 8 forEachRemaining");
        map.entrySet().iterator().forEachRemaining(item -> System.out.println("key:" + item.getKey() + "-" +"value:"+ item.getValue()));

        System.out.println();
        System.out.println("方式三");
        System.out.println("通过Map.entrySet遍历key和value，在大容量时推荐使用");
        System.out.println();
        System.out.println("java 7 Map.entrySet");
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            System.out.println("key:" + entry.getKey() + "-" +"value:"+ entry.getValue());
        }
        System.out.println();
        System.out.println("java 8 lambdab遍历");
        map.entrySet().forEach(entry -> System.out.println("key:" + entry.getKey() + "-" +"value:"+ entry.getValue()));


        System.out.println();
        System.out.println("方式四");
        System.out.println("通过Map.values()遍历所有的value，但不能遍历key");
        System.out.println();
        System.out.println("java 7 Map.values()");
        for (Object value : map.values()) {
            System.out.println("map.value = " + value);
        }
        System.out.println();
        System.out.println("java 8 lambdab遍历");
        map.values().forEach(System.out::println); // 等价于map.values().forEach(value -> System.out.println(value));

        System.out.println();
        System.out.println("方式五");
        System.out.println("通过k,v遍历，Java8独有的");
        System.out.println();
        System.out.println("java 8 lambdab遍历");
        map.forEach((k, v) -> System.out.println("key:" + k  + "-" +"value:"+  v));
    }
}
