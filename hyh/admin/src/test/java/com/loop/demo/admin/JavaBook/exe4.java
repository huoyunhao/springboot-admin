package com.loop.demo.admin.JavaBook;

/**
 * @Auther: 霍运浩
 * @Date: 2019/1/25 0025 22:05
 * @Description: 删除字符串中重复的字符  比如good  删除之后变成 god
 */
public class exe4 {

    public static void main(String[] args) {
        //todo 提醒我
        String str="g o dcdcd sxxxcdscsdddcxd";
        test(str);
    }

    public static void test(String str){
      char[] chars=str.toCharArray();
      for(int i=0;i<chars.length;i++){
          if(chars[i]==' '){
              continue;
          }
           for(int j=i+1;j<chars.length;j++){

               if(chars[j]==' '){
                   continue;
               }
               if(chars[i]==chars[j]){
                   chars[j]=' ';
               }

           }

      }
      StringBuffer strinBuffer=new StringBuffer();
      for(int i=0;i<chars.length;i++){
          if(chars[i]!=' '){
              strinBuffer.append(chars[i]);
          }
      }
      System.out.println(strinBuffer.toString());
    }
}
