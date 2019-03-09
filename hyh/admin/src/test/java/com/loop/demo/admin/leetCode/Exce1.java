package com.loop.demo.admin.leetCode;

/**
 * @Auther: 霍运浩
 * @Date: 2019/1/25 0025 13:14
 * @Description: 题目描述
 * 在一个二维数组中（每个一维数组的长度相同），每一行都按照从左到右递增的顺序排序，
 * 每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。
 */
public class Exce1 {


    public static void main(String[] args) {

        int target =1;
        int [][] array={{1,2,3},{2,3,4},{3,4,5}};//二维数组
        System.out.println(Find(target,array));

    }

    /**
     * 找到target 在数组中
     * @param target
     * @param array
     * @return
     */
    public  static boolean Find(int target, int [][] array) {

        if(array.length==0){

            return false;
        }
        for(int i=0;i<array.length;i++) {
            for (int j = 0; j < array.length; j++) {

                    if(target==array[i][j]){

                        return true;
                    }
            }
        }
        return false;

    }
}

//关于二维数组的补充知识
//在判断二维数组之前，我们要先了解如何获取二维数组的行数和列数，示例如下：
//
//
//        int rows = array.length;//行数
//
//        int columns = array[0].length;//列数
//
//        接下来要如何判断二维数组是否为空呢？Java中判断二维数组是否为空，要判断三种情况：
//
//        1、二维数组首地址是否为空，即array==null；
//
//        2、二维数组是否为{}，即array.length==0的情况；
//
//        3、二维数组是否为{{}}，即array.length=1&&array[0].length==0的情况；
//
//        综上所述，Java中判断二维数组为空的条件为：
//
//        if((array==null||array.length==0)||(array.length==1&&array[0].length==0))
