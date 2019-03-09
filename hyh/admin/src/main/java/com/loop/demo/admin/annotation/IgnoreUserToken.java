package com.loop.demo.admin.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 忽略用户鉴权
 */
@Retention(RetentionPolicy.RUNTIME) //// 注解会在class字节码文件中存在，在运行时可以通过反射获取到
@Target(value={ElementType.METHOD,ElementType.TYPE})  //方法  //接口、类、枚举、注解
public @interface IgnoreUserToken {
}
