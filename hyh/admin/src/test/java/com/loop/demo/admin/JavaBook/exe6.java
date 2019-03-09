package com.loop.demo.admin.JavaBook;

import java.util.ArrayList;

/**
 * @Auther: 霍运浩
 * @Date: 2019/1/26 0026 16:53
 * @Description:
 */
public class exe6 {


    public static void main(String[] args) {

        String s = "abc";
        ArrayList<String> result = combineString(s);
        for (String r : result) {
            System.out.println(r);
        }
    }

    private static ArrayList<String> combineString(String s) {
        int len = s.length();
        ArrayList<String> list = new ArrayList<String>();
        int count = (int) (Math.pow(2, len));
        for (int i = 1; i < count; ++i) {
            String temp = "";
            String str = Integer.toBinaryString(i);
            while (str.length() < len) {
                str = "0" + str;
            }
            for (int j = 0; j < str.length(); ++j) {
                if (str.charAt(j) == '1') {
                    temp += s.charAt(j);
                }
            }
            list.add(temp);
        }
        return list;
    }

}
