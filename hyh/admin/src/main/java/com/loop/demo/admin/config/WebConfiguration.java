package com.loop.demo.admin.config;
import com.loop.demo.admin.interceptor.UserAuthRestInterceptor;
import com.loop.demo.common.handler.GlobalExceptionHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.ArrayList;
import java.util.Collections;

/**
 * @Auther: 霍运浩
 * @Date: 2019/1/21 0021 0:56
 * @Description:
 */

@Configuration()
public class WebConfiguration implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(getUserAuthRestInterceptor()).
                addPathPatterns("/**")// 拦截所有路径
                .excludePathPatterns("/swagger-resources/**", "/webjars/**", "/v2/**", "/doc.html/**");
}
    //注入自定义过滤器
    @Bean
    UserAuthRestInterceptor getUserAuthRestInterceptor() {
        return new UserAuthRestInterceptor();
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/doc.html")
                .addResourceLocations("classpath:/META-INF/resources/");
        registry.addResourceHandler("/webjars/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/");
    }

}

