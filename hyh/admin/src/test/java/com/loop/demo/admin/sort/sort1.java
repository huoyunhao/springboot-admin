package com.loop.demo.admin.sort;

/**
 * @Auther: 霍运浩
 * @Date: 2019/1/29 0029 13:22
 * @Description:  选择排序————————经过一轮得到最小的数 然后将这一轮最小的数和第一个记录的位置进行交换，
 *                                        然后对不包括第一个数的其他数字进行第二轮比较 面试宝典-- p247页
 *                                        n-1+n-2+..+1==  n2
 */
public class sort1 {

    /**
     * 选择排序
     * @param ints
     */
    public static void test(int[] ints) {

        int length=ints.length;
        int temp=0;
        int flag=0;
        for(int i=0;i<length;i++){

            temp=ints[i];//先保存第一个数字和它的下标
            flag=i;
            for(int j=i+1;j<length;j++){
                if(temp>ints[j]){
                      temp=ints[j];//记录下这轮比较 最小的数字
                      flag=j;//记录下最小数字的下标
                }
            }
            //如何flag==i 说明ints[i]本身为本轮最小值不需要交换
            if(flag!=i){
                ints[flag]=ints[i];
                ints[i]=temp;
            }

        }
        for(int i:ints){
            System.out.println(i);
        }


    }
    public static void main(String[] args) {

        int[] ints={5,3,1,4,2};
        test(ints);

    }
}
