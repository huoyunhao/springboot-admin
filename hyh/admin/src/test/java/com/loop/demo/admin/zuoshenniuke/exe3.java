package com.loop.demo.admin.zuoshenniuke;

/**
 * @Auther: 霍运浩
 * @Date: 2019/1/29 0029 16:05
 * @Description: 二分查找法
 */
public class exe3
{
    public static int binary(int[] array, int value)
    {
        int low = 0;
        int high = array.length - 1;
        while(low <= high)
        {
            int middle = (low + high) / 2;
            if(value == array[middle])
            {
                return value;
            }
            if(value > array[middle])
            {
                low = middle + 1;
            }
            if(value < array[middle])
            {
                high = middle - 1;
            }
        }
        return -1;
    }
    public static void main(String[] args)
    {
        int[] a = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        int value = binary(a, 9);
        System.out.println(value);
    }
}