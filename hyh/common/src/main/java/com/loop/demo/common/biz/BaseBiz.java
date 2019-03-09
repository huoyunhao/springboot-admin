package com.loop.demo.common.biz;


import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.loop.demo.common.msg.TableResultResponse;
import com.loop.demo.common.util.EntityUtils;
import com.loop.demo.common.util.Query;
import org.springframework.beans.factory.annotation.Autowired;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.entity.Example;

import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;

/**
 基础业务逻辑层  service
 */
public class BaseBiz<M extends Mapper<T>, T> {
    @Autowired
    protected M mapper;

    public void setMapper(M mapper) {
        this.mapper = mapper;
    }

    public T selectOne(T entity) {
        return mapper.selectOne(entity);
    }


    public T selectById(Object id) {
        return mapper.selectByPrimaryKey(id);
    }


    public List<T> selectList(T entity) {
        return mapper.select(entity);
    }


    public List<T> selectListAll() {
        return mapper.selectAll();
    }


    public Long selectCount(T entity) {
        return new Long(mapper.selectCount(entity));
    }


    public void insert(T entity) {
        EntityUtils.setCreatAndUpdatInfo(entity);
        mapper.insert(entity);
    }


    public void insertSelective(T entity) {
        EntityUtils.setCreatAndUpdatInfo(entity);
        mapper.insertSelective(entity);
    }


    public void delete(T entity) {
        mapper.delete(entity);
    }


    public void deleteById(Object id) {
        mapper.deleteByPrimaryKey(id);
    }


    public void updateById(T entity) {
        EntityUtils.setUpdatedInfo(entity);
        mapper.updateByPrimaryKey(entity);
    }


    public void updateSelectiveById(T entity) {
        EntityUtils.setUpdatedInfo(entity);
        mapper.updateByPrimaryKeySelective(entity);

    }

    public List<T> selectByExample(Object example) {
        return mapper.selectByExample(example);
    }

    public int selectCountByExample(Object example) {
        return mapper.selectCountByExample(example);
    }

    public TableResultResponse<T> selectByQuery(Query query) {
        //获取父类泛型的第二个属性 就是BaseBiz<M extends Mapper<T>, T> 的第二个T
        Class<T> clazz = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[1];
        //获取之后条件查询
        Example example = new Example(clazz);
        //如果有请求的参数
        if(query.entrySet().size()>0) {
            Example.Criteria criteria = example.createCriteria();
            for (Map.Entry<String, Object> entry : query.entrySet()) {
                //模糊查询 and 关心
                criteria.andLike(entry.getKey(), "%" + entry.getValue().toString() + "%");
            }
        }
        //传入query对象中的分页信息
        Page<Object> result = PageHelper.startPage(query.getPage(), query.getLimit());
        //将条件去查询
        List<T> list = mapper.selectByExample(example);
        //得到对象的条数 result.getTotal()
        return new TableResultResponse<T>(result.getTotal(), list);
    }

}
