package com.loop.demo.admin.JavaBook;

import javax.sound.midi.Soundbank;
import java.util.Arrays;

/**
 * @Auther: 霍运浩
 * @Date: 2019/1/25 0025 20:59
 * @Description: 判断两个字符串由相同的字符组成  p293
 *    比如  abcdaaa aaaabcd 是相同字符   相同字符是指 字母个数相同 且 每个字母的个数相同
 */
public class exe3 {


    public static void main(String[] args) {

        String str1="abcdaaa";
        String str2="aaaabcf";
        System.out.println("是否相同："+test(str1,str2));
    }

    /**
     * 先将字符串排序 然后比较    时间复杂度 取决于排序算法
     * @param str1
     * @param str2
     * @return
     */
    public static boolean test(String str1, String str2){

        char[] chars1=str1.toCharArray();
        char[] chars2=str2.toCharArray();
        Arrays.sort(chars1);
        Arrays.sort(chars2);
        str1=new String(chars1);
        str2=new String (chars2);
        return str1.equals(str2);
    }

    /**
     * 另外一种算法
     * @param str1
     * @param str2
     */
    public static boolean compare(String str1,String str2){

            byte[] b1=str1.getBytes();
            byte[] b2=str1.getBytes();
            int[] bCount=new int[256];
            for(int i=0;i<b1.length;i++){
                bCount[b1[i]]++;
            }
            for(int i=0;i<b2.length;i++){
                bCount[b2[i]]--;
            }
            for(int i=0;i<bCount.length;i++){

                if(bCount[i]!=0)
                {
                    return false;
                }
            }
            return true;
    }

}
