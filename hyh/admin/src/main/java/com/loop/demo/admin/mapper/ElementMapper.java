package com.loop.demo.admin.mapper;

import com.loop.demo.admin.entity.Element;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
public interface ElementMapper extends Mapper<Element> {
    /**
     * 根据用户的id查询用户的按钮
     * @param userId
     * @return
     */
     List<Element> selectAuthorityElementByUserId(@Param("userId") String userId);
     List<Element> selectAllElementPermissions();

}