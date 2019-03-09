package com.loop.demo.admin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@RunWith(SpringRunner.class)
@SpringBootTest
public class AdminApplicationTests {

    @Test
    public void contextLoads() {

        String ids="1,2,3,4,5";
        List<Object> listIds = Arrays.asList(ids.split(",")).stream().collect(Collectors.toList());
        boolean result = listIds.stream().anyMatch(p->p.equals("2"));
        System.out.println(Arrays.toString(listIds .toArray()));//[1,2,3,3,4,5,6]  
        System.out.println(result);
    }
    @Test
    public void test(){
    }

}

