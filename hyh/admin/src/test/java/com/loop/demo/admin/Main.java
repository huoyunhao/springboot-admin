package com.loop.demo.admin;

import org.assertj.core.error.ElementsShouldBeAtLeast;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int N=sc.nextInt();
        int M=sc.nextInt();
        int[] stu=new int[N];
        int secondMax = stu[0];
        int min=stu[0];
        int max = stu[0];
        for (int i = 0; i < N; i++) {
            stu[i] = sc.nextInt();
        }
        if(N==M*2) {
            for (int i = 0; i < stu.length; i++) {
                if (stu[i] > max) {
                    max = stu[i];
                }
            }
            for (int j = 0; j < stu.length; j++) {
                if (stu[j] > secondMax && stu[j] < max) {
                    secondMax = stu[j];
                }
                if (min > stu[j]) {
                    min = stu[j];
                }
            }
            int result = Math.min(min + max, min + secondMax);
            System.out.println(result);
        }else{
            int k=(int)(0+Math.random()*(N-1));
            System.out.println(k);
            ArrayList arrayList=new ArrayList(N-1);
            for(int i=0;i<stu.length;i++){
                if(i!=k){
                    arrayList.add(stu[i]);
                }
            }
            int[] num=new int[N-1];
            for (int i = 0; i < num.length; i++) {
                if (num[i] > max) {
                    max = num[i];
                }
            }
            for (int j = 0; j < num.length; j++) {
                if (num[j] > secondMax && num[j] < max) {
                    secondMax = stu[j];
                }
                if (min > num[j]) {
                    min = num[j];
                }
            }
            int result = Math.min(min + max, min + secondMax);
            System.out.println(result);
        }

    }

}






