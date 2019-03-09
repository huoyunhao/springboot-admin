package com.loop.demo.admin.JavaBook;


/**
 * @Auther: 霍运浩
 * @Date: 2019/1/26 0026 16:09
 * @Description: 统计一行字符有多少个单词
 */
public class exe5 {

    public static void main(String[] args) {

        String str=" liove you ";
        test1(str);
    }

    /**
     * 运用正则表达式
     * @param string
     */
    public static void test(String string) {
        String[] strings=string.trim().split("\\s+");
        System.out.println(strings.length);

    }
    /**
     * 传统方法
     */
    public static void test1(String string){
        char[] chars=string.toCharArray();
        int word=0;
        int count=0;
        //word 用来判断前面一个字符是否为空格 o 为空格  1 不为空格
        // 若前一个字符为空格后一个字符串不为则表示这个这个一个新的单词开始，
        // 若前一个字符为非空格，后一个字符也还是非空格 则表示这是单词的延续 不count++;
        for(char c:chars){

             if(c==' '){
                 word=0;
             }else if(word==0){
                 word=1;
                 count++;
             }
        }
        System.out.println(count);
    }
}
