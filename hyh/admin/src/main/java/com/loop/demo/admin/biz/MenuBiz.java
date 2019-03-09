package com.loop.demo.admin.biz;

import com.loop.demo.admin.constants.AdminConstant;
import com.loop.demo.admin.entity.Menu;
import com.loop.demo.admin.mapper.MenuMapper;
import com.loop.demo.common.biz.BaseBiz;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
@CacheConfig(cacheNames = "MenuBiz")
public class MenuBiz extends BaseBiz<MenuMapper, Menu> {
    @Override
    public List<Menu> selectListAll() {
        return super.selectListAll();
    }

    @Override
    public void insertSelective(Menu entity) {
        if (AdminConstant.ROOT == entity.getParentId()) {
            entity.setPath("/" + entity.getCode());
        } else {
            Menu parent = this.selectById(entity.getParentId());
            entity.setPath(parent.getPath() + "/" + entity.getCode());
        }
        super.insertSelective(entity);
    }

    @Override
    public void updateById(Menu entity) {
        if (AdminConstant.ROOT == entity.getParentId()) {
            entity.setPath("/" + entity.getCode());
        } else {
            Menu parent = this.selectById(entity.getParentId());
            entity.setPath(parent.getPath() + "/" + entity.getCode());
        }
        super.updateById(entity);
    }

    @Override
    public void updateSelectiveById(Menu entity) {
        super.updateSelectiveById(entity);
    }

    /**
     * 获取用户可以访问的菜单
     *
     * @param id
     * @return
     */
    public List<Menu> getUserAuthorityMenuByUserId(int id) {
        return mapper.selectAuthorityMenuByUserId(id);
    }

}
