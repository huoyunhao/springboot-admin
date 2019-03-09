package com.loop.demo.admin.zuoshenniuke;

/**
 * @Auther: 霍运浩
 * @Date: 2019/1/29 0029 14:58
 * @Description: 找出B中不属于A的数
 *               找出数组B中不属于A的数，数组A有序而数组B无序。假设数组A有n个数，数组B有m个数，写出算法并分析时间复杂度。
 *               时间复杂度  n*m    额外空间复杂度  temp  boolean
 *
 */
public class exe1 {


    public static void main(String[] args) {

        int[] a={2,5,7,8};
        int[] b={5,9,0,2};
        int temp;
        Boolean flag;
        //每取出一个b中数 遍历a数组看是否有匹配的数字
        for(int i=0;i<b.length;i++){
            flag=false;
            temp=b[i];
            for(int j=0;j<a.length;j++){
                if(temp==a[j]){
                    flag=true;//说明a中有属于b的数
                    break;
                }
            }
            //如何flag==false 说明这个数 只有b中才有
            if(flag==false){
                System.out.println("k:"+i+"-v:"+temp);
            }
        }

    }


}
