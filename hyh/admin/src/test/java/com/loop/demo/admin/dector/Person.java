package com.loop.demo.admin.dector;

/**
 * @Auther: 霍运浩
 * @Date: 2019/3/16 0016 21:29
 * @Description:
 */
public class Person implements Component{
    private String name;
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Person(String name){
        this.name = name;
    }

    @Override
    public void show() {
        System.out.println("装扮的" + name);
    }
}
