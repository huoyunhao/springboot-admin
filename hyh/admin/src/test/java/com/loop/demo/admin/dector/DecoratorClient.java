package com.loop.demo.admin.dector;

/**
 * @Auther: 霍运浩
 * @Date: 2019/3/16 0016 21:30
 * @Description:
 */
public class DecoratorClient {
    public static void main(String[] args) {
        System.out.println("Welcome to Andy.Chen Blog!" +"\n"
                +"Decorator Patterns." +"\n");

        Person mPerson = new Person("Andy");

        Sandal mSandal = new Sandal();
        Jeans mJeans = new Jeans();
        mJeans.decoratorObj(mPerson);
        mSandal.decoratorObj(mJeans);
        mSandal.show();
    }
}
