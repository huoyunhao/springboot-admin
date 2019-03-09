package com.loop.demo.admin.biz;

import com.loop.demo.admin.entity.ResourceAuthority;
import com.loop.demo.admin.mapper.ResourceAuthorityMapper;
import com.loop.demo.common.biz.BaseBiz;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
@Transactional(rollbackFor = Exception.class)
public class ResourceAuthorityBiz extends BaseBiz<ResourceAuthorityMapper, ResourceAuthority> {
}
