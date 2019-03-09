package com.loop.demo.admin.JavaBook;

/**
 * @Auther: 霍运浩
 * @Date: 2019/1/25 0025 20:51
 * @Description: 递归 计算1+2+3+4+5+..+n;
 */
public class exe2 {


    public static void main(String[] args) {

        System.out.println(test(3));
    }

    public static int test(int number) {

        try {

            int[] arr=new int[number-2];
            return number+test(number-1);
        }catch(Exception e){

            return 1;
        }
    }
}
