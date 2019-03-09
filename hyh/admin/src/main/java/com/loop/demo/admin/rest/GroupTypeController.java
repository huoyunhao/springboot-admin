package com.loop.demo.admin.rest;

import com.loop.demo.admin.biz.GroupTypeBiz;
import com.loop.demo.admin.entity.GroupType;
import com.loop.demo.common.rest.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 */
@RestController
@RequestMapping("groupType")
public class GroupTypeController extends BaseController<GroupTypeBiz, GroupType> {

}
