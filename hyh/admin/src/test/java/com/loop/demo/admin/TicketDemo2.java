package com.loop.demo.admin;

import java.sql.SQLOutput;

class Ticket
//        implements Runnable
        extends Thread
{
    private  int tick = 10000;
    public void run()
    {
        while(true)
        {
            synchronized(this)
            {
                if(tick>0)
                {
                    //try{Thread.sleep(10);}catch(Exception e){}
                    System.out.println(Thread.currentThread().getName()+"....sale : "+ tick--);
                }
            }
        }
    }
}


public class  TicketDemo2
{
    public static void main(String[] args)
    {

//        Ticket t = new Ticket();
//        Thread thead1=new Thread(t);
//        Thread thead2=new Thread(t);
//        Thread thead3=new Thread(t);
//        thead1.start();
//        thead2.start();
//        thead3.start();
//        Ticket t1=new Ticket();
//        Ticket t2=new Ticket();
//        Ticket t3=new Ticket();
//        t1.start();
//        t2.start();
//        t3.start();
        for(int i=0;i<4;i++) {
            new Thread() {
                public int t = 1000;

                @Override
                public void run() {

                    while (true) {
                        if (t > 0) {
                            System.out.println(Thread.currentThread().getName() + "-" + t--);
                        }

                    }

                }
            }.start();

        }






        // 方式一:使用匿名内部类创建线程的子类对象
        Thread thread = new Thread() {

            @Override
            public void run() {
                System.out.println("我的线程执行了1");
            }
        };
        thread.start();



        // 方式二:使用匿名内部类创建线程的子类匿名对象
        new Thread() {

            @Override
            public void run() {
                System.out.println("我的线程执行了2");
            }
        }.start();



        // 方式三:使用匿名内部类的方式,创建线程执行目标类对象
        // 创建线程执行目标类对象
        Runnable runnable = new Runnable() {

            @Override
            public void run() {
                System.out.println("我的线程执行了3");
            }
        };
        // 通过目标创建线程对象
        Thread thread2 = new Thread(runnable);
        // 开启线程
        thread2.start();



        // 方式四:使用匿名内部类的方式,创建线程执行目标类匿名对象
        // 创建线程执行目标类对象
        // 通过目标创建线程对象
        Thread thread3 = new Thread(new Runnable() {

            @Override
            public void run() {
                System.out.println("我的线程执行了4");
            }
        });
        // 开启线程
        thread3.start();



        // 方式五:使用匿名内部类的方式,创建线程执行目标类匿名对象,并且创建的是线程的匿名对象
        // 创建线程执行目标类对象
        // 通过目标创建线程对象
        new Thread(new Runnable() {

            @Override
            public void run() {
                System.out.println("我的线程执行了5");
            }
        }).start();
    }


}
