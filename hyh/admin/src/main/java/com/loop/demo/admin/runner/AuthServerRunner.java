package com.loop.demo.admin.runner;

import com.loop.demo.admin.config.UserAuthConfig;
import com.loop.demo.admin.util.helper.RsaKeyHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.Map;

/**
 */
@Configuration
public class AuthServerRunner implements CommandLineRunner {
//    @Autowired
//    private RedisTemplate<String, String> redisTemplate;
    private static final String REDIS_USER_PRI_KEY = "AUTH:JWT:PRI";
    private static final String REDIS_USER_PUB_KEY = "AUTH:JWT:PUB";

    @Autowired
    private UserAuthConfig userAuthConfig;

    @Override
    public void run(String... args) throws Exception {
//        if (redisTemplate.hasKey(REDIS_USER_PRI_KEY)&&redisTemplate.hasKey(REDIS_USER_PUB_KEY)) {
//            userAuthConfig.setUserPriKey(RsaKeyHelper.toBytes(redisTemplate.opsForValue().get(REDIS_USER_PRI_KEY)));
//            userAuthConfig.setUserPubKey(RsaKeyHelper.toBytes(redisTemplate.opsForValue().get(REDIS_USER_PUB_KEY)));
//        } else {
            Map<String, byte[]> keyMap = RsaKeyHelper.generateKey(userAuthConfig.getUserSecret());
            userAuthConfig.setUserPriKey(keyMap.get("pri"));
            userAuthConfig.setUserPubKey(keyMap.get("pub"));
//            redisTemplate.opsForValue().set(REDIS_USER_PRI_KEY, RsaKeyHelper.toHexString(keyMap.get("pri")));
//            redisTemplate.opsForValue().set(REDIS_USER_PUB_KEY, RsaKeyHelper.toHexString(keyMap.get("pub")));
//        }
    }
}
