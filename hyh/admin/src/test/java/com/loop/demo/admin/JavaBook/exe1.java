package com.loop.demo.admin.JavaBook;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * @Auther: 霍运浩
 * @Date: 2019/1/25 0025 20:04
 * @Description: 吧一个句子的单词进行反转  比如how are you  反转为 you are how
 * @think：先对句子整体反转  uoy era woh 然后再对单个单词反转
 */
public class exe1 {

    public static void main(String[] args) {

        String str="ho are you";
//        System.out.println(reverse(str));;

        System.out.println(reverse1(str));

    }

    /**
     * 使用Collects的反转函数
     * @param string
     * @return
     */
    public static String reverse(String string){

        List<String> words= Arrays.asList(string.split(" "));
        Collections.reverse(words);
        StringBuffer stringBuffer=new StringBuffer();
        for(String str:words){
            stringBuffer.append(str+" ");
        }
        return stringBuffer.toString().trim();
    }
    public static String reverse1(String str){
        char chars[]=str.toCharArray();
        swap(chars,0,chars.length-1);
        int begin = 0;
        for(int i=0;i<chars.length;i++){

            if(chars[i]==' '){
                swap(chars,begin,i-1);
                begin=i+1;
            }
        }
        return new String(chars);
    }

    private static  void swap(char[] chars ,int begin , int end){


        while(begin<end){

            char temp=chars[begin];
            chars[begin]=chars[end];
            chars[end]=temp;
            begin++;
            end--;
        }
    }
}
