package com.loop.demo.admin.biz;

import com.loop.demo.admin.entity.GateLog;
import com.loop.demo.admin.mapper.GateLogMapper;
import com.loop.demo.common.biz.BaseBiz;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
@Transactional(rollbackFor = Exception.class)
public class GateLogBiz extends BaseBiz<GateLogMapper, GateLog> {

    @Override
    public void insert(GateLog entity) {
        mapper.insert(entity);
    }

}
