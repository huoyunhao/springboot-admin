package com.loop.demo.admin.biz;

import org.apache.ibatis.session.RowBounds;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * @Auther: 霍运浩
 * @Date: 2019/3/6 0006 0:21
 * @Description:
 */
public class test  implements Mapper {
    @Override
    public int deleteByPrimaryKey(Object o) {
        return 0;
    }

    @Override
    public int delete(Object o) {
        return 0;
    }

    @Override
    public int insert(Object o) {
        return 0;
    }

    @Override
    public int insertSelective(Object o) {
        return 0;
    }

    @Override
    public boolean existsWithPrimaryKey(Object o) {
        return false;
    }

    @Override
    public List selectAll() {
        return null;
    }

    @Override
    public Object selectByPrimaryKey(Object o) {
        return null;
    }

    @Override
    public int selectCount(Object o) {
        return 0;
    }

    @Override
    public List select(Object o) {
        return null;
    }

    @Override
    public Object selectOne(Object o) {
        return null;
    }

    @Override
    public int updateByPrimaryKey(Object o) {
        return 0;
    }

    @Override
    public int updateByPrimaryKeySelective(Object o) {
        return 0;
    }

    @Override
    public int deleteByExample(Object o) {
        return 0;
    }

    @Override
    public List selectByExample(Object o) {
        return null;
    }

    @Override
    public int selectCountByExample(Object o) {
        return 0;
    }

    @Override
    public int updateByExample(Object o, Object o2) {
        return 0;
    }

    @Override
    public int updateByExampleSelective(Object o, Object o2) {
        return 0;
    }

    @Override
    public List selectByExampleAndRowBounds(Object o, RowBounds rowBounds) {
        return null;
    }

    @Override
    public List selectByRowBounds(Object o, RowBounds rowBounds) {
        return null;
    }
}
