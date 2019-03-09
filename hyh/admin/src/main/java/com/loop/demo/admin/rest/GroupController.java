package com.loop.demo.admin.rest;

import com.loop.demo.admin.biz.GroupBiz;
import com.loop.demo.admin.biz.ResourceAuthorityBiz;
import com.loop.demo.admin.constants.AdminConstant;
import com.loop.demo.admin.entity.Group;
import com.loop.demo.admin.vo.AuthorityMenuTree;
import com.loop.demo.admin.vo.GroupTree;
import com.loop.demo.admin.vo.GroupUsers;
import com.loop.demo.common.msg.ObjectRestResponse;
import com.loop.demo.common.rest.BaseController;
import com.loop.demo.common.util.TreeUtil;
import io.swagger.annotations.Api;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;

/**
 *
 */
@RestController
@RequestMapping("group")
public class GroupController extends BaseController<GroupBiz, Group> {

    /**
     *  根据用户组的名字或者用户组的类型模糊查询获取用户组信息
     * @param name
     * @param groupType
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public List<Group> list(String name,String groupType) {
        if(StringUtils.isBlank(name)&&StringUtils.isBlank(groupType)) {
            return new ArrayList<Group>();
        }
        Example example = new Example(Group.class);
        if (StringUtils.isNotBlank(name)) {
            example.createCriteria().andLike("name", "%" + name + "%");
        }
        if (StringUtils.isNotBlank(groupType)) {
            example.createCriteria().andEqualTo("groupType", groupType);
        }

        return baseBiz.selectByExample(example);
    }


    /**
     * 为用户组分配用户传入用户组id  成员id字符串  领导id字符串
     * eg user?members=4,5&leaders=4
     * @param id
     * @param members
     * @param leaders
     * @return
     */
    @RequestMapping(value = "/{id}/user", method = RequestMethod.PUT)
    @ResponseBody
    public ObjectRestResponse modifiyUsers(@PathVariable int id, String members, String leaders){
        baseBiz.modifyGroupUsers(id, members, leaders);
        return new ObjectRestResponse().rel(true);
    }

    /**
     * 根据用户组id获取该角色组关联的成员和领导
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}/user", method = RequestMethod.GET)
    @ResponseBody
    public ObjectRestResponse<GroupUsers> getUsers(@PathVariable int id){
        return new ObjectRestResponse<GroupUsers>().rel(true).data(baseBiz.getGroupUsers(id));
    }

    /**
     * 分配菜单  传入用户组id和菜单ids
     * @param id
     * @param menuTrees
     * @return
     */
    @RequestMapping(value = "/{id}/authority/menu", method = RequestMethod.POST)
    @ResponseBody
    public ObjectRestResponse modifyMenuAuthority(@PathVariable  int id, String menuTrees){
        String [] menus = menuTrees.split(",");
        baseBiz.modifyAuthorityMenu(id, menus);
        return new ObjectRestResponse().rel(true);
    }

    /**
     * 根据角色组的id得到该角色组的菜单
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}/authority/menu", method = RequestMethod.GET)
    @ResponseBody
    public ObjectRestResponse<List<AuthorityMenuTree>> getMenuAuthority(@PathVariable  int id){
        return new ObjectRestResponse().data(baseBiz.getAuthorityMenu(id)).rel(true);
    }

    /**
     * 分配按钮通过
     * @param id 用户组id
     * @param menuId 菜单id
     * @param elementId  按钮或者url id
     * @return
     */
    @RequestMapping(value = "/{id}/authority/element/add", method = RequestMethod.POST)
    @ResponseBody
    public ObjectRestResponse addElementAuthority(@PathVariable  int id,int menuId, int elementId){
        baseBiz.modifyAuthorityElement(id,menuId,elementId);
        return new ObjectRestResponse().rel(true);
    }

    /**
     * 取消分配按钮通过
     * @param id 用户组id
     * @param menuId 菜单id
     * @param elementId 按钮或者url id
     * @return
     */
    @RequestMapping(value = "/{id}/authority/element/remove", method = RequestMethod.POST)
    @ResponseBody
    public ObjectRestResponse removeElementAuthority(@PathVariable int id,int menuId, int elementId){
        baseBiz.removeAuthorityElement(id,menuId,elementId);
        return new ObjectRestResponse().rel(true);
    }

    /**
     * 根据角色组的id 得到获取群组关联的按钮id数组
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}/authority/element", method = RequestMethod.GET)
    @ResponseBody
    public ObjectRestResponse<List<Integer>> getElementAuthority(@PathVariable  int id){
        return new ObjectRestResponse().data(baseBiz.getAuthorityElement(id)).rel(true);
    }

    /**
     * 根据角色组类型获取角色组树形结构
     * @param name
     * @param groupType
     * @return
     */
    @RequestMapping(value = "/tree", method = RequestMethod.GET)
    @ResponseBody
    public List<GroupTree> tree(String name, String groupType) {
        if(StringUtils.isBlank(name)&&StringUtils.isBlank(groupType)) {
            return new ArrayList<GroupTree>();
        }
        Example example = new Example(Group.class);
        if (StringUtils.isNotBlank(name)) {
            example.createCriteria().andLike("name", "%" + name + "%");
        }
        if (StringUtils.isNotBlank(groupType)) {
            example.createCriteria().andEqualTo("groupType", groupType);
        }
        return  getTree(baseBiz.selectByExample(example), AdminConstant.ROOT);
    }


    private List<GroupTree> getTree(List<Group> groups,int root) {
        List<GroupTree> trees = new ArrayList<GroupTree>();
        GroupTree node = null;
        for (Group group : groups) {
            node = new GroupTree();
            node.setLabel(group.getName());
            BeanUtils.copyProperties(group, node);
            trees.add(node);
        }
        return TreeUtil.bulid(trees,root) ;
    }
}
