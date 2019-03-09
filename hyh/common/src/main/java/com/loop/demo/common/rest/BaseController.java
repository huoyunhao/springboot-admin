package com.loop.demo.common.rest;

import com.loop.demo.common.biz.BaseBiz;
import com.loop.demo.common.context.BaseContextHandler;
import com.loop.demo.common.msg.ObjectRestResponse;
import com.loop.demo.common.msg.TableResultResponse;
import com.loop.demo.common.util.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 *
 * @param <Biz>  可以认为是service
 * @param <Entity>  实体类
 */
public class BaseController<Biz extends BaseBiz, Entity> {
    @Autowired
    protected HttpServletRequest request;
    @Autowired
    protected Biz baseBiz;

    /**
     * 添加一个实体
     *
     * @param entity
     * @return
     */
    @PostMapping
    public ObjectRestResponse<Entity> add(@RequestBody Entity entity) {
        baseBiz.insertSelective(entity);
        return new ObjectRestResponse<Entity>();
    }

    /**
     * 根据实体的id来查询实体
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public ObjectRestResponse<Entity> get(@PathVariable int id) {
        ObjectRestResponse<Entity> entityObjectRestResponse = new ObjectRestResponse<>();
        Object o = baseBiz.selectById(id);
        entityObjectRestResponse.data((Entity) o);
        return entityObjectRestResponse;
    }

    /**
     * 修改根据id
     *
     * @param
     * @return
     */
    @PutMapping("/{id}")
    public ObjectRestResponse<Entity> update(@RequestBody Entity entity) {
        baseBiz.updateSelectiveById(entity);
        return new ObjectRestResponse<Entity>();
    }

    /**
     * 删除通过id
     *
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public ObjectRestResponse<Entity> remove(@PathVariable int id) {
        baseBiz.deleteById(id);
        return new ObjectRestResponse<Entity>();
    }

    /**
     * 获取所有实体
     *
     * @return
     */
    @GetMapping("/all")
    public List<Entity> all() {
        return baseBiz.selectListAll();
    }

    /**
     * 分页获取所有实体
     *
     * @param params
     * @return
     */
    @GetMapping("/page")
    public TableResultResponse<Entity> list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);
        return baseBiz.selectByQuery(query);
    }

    public String getCurrentUserName() {
        return BaseContextHandler.getUsername();
    }
}
