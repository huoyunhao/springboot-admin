package com.loop.demo.admin.mapper;

import com.loop.demo.admin.entity.ResourceAuthority;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface ResourceAuthorityMapper extends Mapper<ResourceAuthority> {
     void deleteByAuthorityIdAndResourceType(@Param("authorityId") String authorityId, @Param("resourceType") String resourceType);
}