package com.loop.demo.admin.zuoshenniuke;

/**
 * @Auther: 霍运浩
 * @Date: 2019/1/29 0029 14:58
 * @Description: 找出B中不属于A的数
 *               找出数组B中不属于A的数，数组A有序而数组B无序。假设数组A有n个数，数组B有m个数，写出算法并分析时间复杂度。
*   使用二分查找法:
 * 由于数组A是有序的，在一个有序序列中查找一个元素可以使用二分法（也称折半法）。原理就是将查找的元素与序列的中位数进行比较，
 * 如果小于则去掉中位数及其之后的序列，如果大于则去掉中位数及其之前的序列，
 * 如果等于则找到了。如果不等于那么再将其与剩下的序列继续比较直到找到或剩下的序列为空为止。
 */
public class exe2 {


    public static void main(String[] args) {

        int[] a={2,5,7,8};
        int[] b={5,9,0,2};
        int temp;
        int left=0;
        int right=a.length-1;
        int mid=(right+left)/2;
        for(int i=0;i<b.length;i++){
            temp=b[i];
            while(left<=right && a[mid]!=temp){
                if(a[mid]>temp)
                    right=mid-1;
                if(a[mid]<temp)
                    left=mid+1;
                 mid=(left+right)/2;

            }
             if(a[mid]!=temp){
                 System.out.println(temp);
             }
        }
    }




}
