package com.loop.demo.admin.dector;

/**
 * @Auther: 霍运浩
 * @Date: 2019/3/16 0016 21:29
 * @Description:
 */
/** 牛仔裤 */
public class Jeans extends Decorator {
    @Override
    public void show(){
        System.out.println("穿牛仔裤");
        super.show();
    }

}
