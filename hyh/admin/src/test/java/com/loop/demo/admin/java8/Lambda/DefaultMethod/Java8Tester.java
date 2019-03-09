package com.loop.demo.admin.java8.Lambda.DefaultMethod;

/**
 * @Auther: 霍运浩
 * @Date: 2019/1/24 0024 18:03
 * @Description:
 */
public class Java8Tester {
    public static void main(String args[]){
        Vehicle vehicle = new Car();
        vehicle.print();
        FourWheeler vehicle1 = new Car();
        vehicle1.print();
    }
}

interface Vehicle {
    default void print(){
        System.out.println("我是一辆车!");
    }

    static void blowHorn(){
        System.out.println("按喇叭!!!");
    }
}

interface FourWheeler {
    default void print(){
        System.out.println("我是一辆四轮车!");
    }
}

class Car implements Vehicle, FourWheeler {
    public void print(){
        Vehicle.super.print();
        FourWheeler.super.print();
        Vehicle.blowHorn();
        System.out.println("我是一辆汽车!");
    }
}
