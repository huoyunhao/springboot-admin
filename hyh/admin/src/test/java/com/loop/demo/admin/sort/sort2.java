package com.loop.demo.admin.sort;

/**
 * @Auther: 霍运浩
 * @Date: 2019/1/29 0029 14:21
 * @Description: 冒泡排序  时间复杂度--   n2    n-1 +n-2 +n-3+..+1
 */
public class sort2 {


    public static void test(int[] ints) {

        int temp;
        for (int i = 0; i < ints.length - 1; i++) { //i控制趟 次数
            for (int j = 0; j < ints.length - i - 1; j++) //j 控制交换的次数
            {
                if (ints[j] > ints[j + 1]) {
                    temp = ints[j];
                    ints[j] = ints[j + 1];
                    ints[j + 1] = temp;
                }
            }
        }
        for (int i : ints) {
            System.out.println(i);
        }

    }

    public static void main(String[] args) {

        int[] ints = {4, 3, 5, 2, 1};   // 3 5 421   34521 34251 3 4 2 1  5
        test(ints);

    }
}
