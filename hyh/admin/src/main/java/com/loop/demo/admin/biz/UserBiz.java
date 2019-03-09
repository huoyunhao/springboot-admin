package com.loop.demo.admin.biz;

import com.loop.demo.admin.constants.AdminConstant;
import com.loop.demo.admin.entity.User;
import com.loop.demo.admin.mapper.MenuMapper;
import com.loop.demo.admin.mapper.UserMapper;
import com.loop.demo.common.biz.BaseBiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
/**
 *  biz是Business的缩写，实际上就是（业务逻辑层） 将server层公共部分提取出来  并提供一个公共工具类 BaseBiz
 *  其他service层继承baseBiz即可
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class UserBiz extends BaseBiz<UserMapper, User> {

    @Autowired
    private MenuMapper menuMapper;
    @Override
    public void insertSelective(User entity) {
        String password = new BCryptPasswordEncoder(AdminConstant.PW_ENCORDER_SALT).encode(entity.getPassword());
        entity.setPassword(password);
        super.insertSelective(entity);
    }

    @Override
    public void updateSelectiveById(User entity) {
        super.updateSelectiveById(entity);
    }

    /**
     * 根据用户名获取用户信息
     * @param username
     * @return
     */
    public User getUserByUsername(String username){
        User user = new User();
        user.setUsername(username);
        return mapper.selectOne(user);
    }

}
