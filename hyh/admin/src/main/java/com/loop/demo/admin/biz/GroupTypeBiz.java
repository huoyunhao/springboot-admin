package com.loop.demo.admin.biz;

import com.loop.demo.admin.entity.GroupType;
import com.loop.demo.admin.mapper.GroupTypeMapper;
import com.loop.demo.common.biz.BaseBiz;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class GroupTypeBiz extends BaseBiz<GroupTypeMapper, GroupType> {
}
