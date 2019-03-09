package com.loop.demo.admin.rest;

import com.github.pagehelper.PageHelper;
import com.loop.demo.admin.biz.GateLogBiz;
import com.loop.demo.admin.entity.GateLog;
import com.loop.demo.common.msg.TableResultResponse;
import com.loop.demo.common.rest.BaseController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.entity.Example;

/**
 * ${DESCRIPTION}
 *
 */
@RestController
@RequestMapping("gateLog")
public class GateLogController extends BaseController<GateLogBiz, GateLog> {
}

