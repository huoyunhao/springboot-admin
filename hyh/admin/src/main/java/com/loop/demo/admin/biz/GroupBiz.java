package com.loop.demo.admin.biz;

import com.loop.demo.admin.constants.AdminConstant;
import com.loop.demo.admin.entity.Group;
import com.loop.demo.admin.entity.Menu;
import com.loop.demo.admin.entity.ResourceAuthority;
import com.loop.demo.admin.mapper.GroupMapper;
import com.loop.demo.admin.mapper.MenuMapper;
import com.loop.demo.admin.mapper.ResourceAuthorityMapper;
import com.loop.demo.admin.mapper.UserMapper;
import com.loop.demo.admin.vo.AuthorityMenuTree;
import com.loop.demo.admin.vo.GroupUsers;
import com.loop.demo.common.biz.BaseBiz;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.*;

@Service
@Transactional(rollbackFor = Exception.class)
public class GroupBiz extends BaseBiz<GroupMapper, Group> {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private ResourceAuthorityMapper resourceAuthorityMapper;
    @Autowired
    private MenuMapper menuMapper;

    @Override
    public void insertSelective(Group entity) {
        if (AdminConstant.ROOT == entity.getParentId()) {
            entity.setPath("/" + entity.getCode());
        } else {
            Group parent = this.selectById(entity.getParentId());
            entity.setPath(parent.getPath() + "/" + entity.getCode());
        }
        super.insertSelective(entity);
    }

    @Override
    public void updateById(Group entity) {
        if (AdminConstant.ROOT == entity.getParentId()) {
            entity.setPath("/" + entity.getCode());
        } else {
            Group parent = this.selectById(entity.getParentId());
            entity.setPath(parent.getPath() + "/" + entity.getCode());
        }
        super.updateById(entity);
    }

    /**
     * 根据用户组id获取该用户组关联的用户
     *
     * @param groupId
     * @return
     */
    public GroupUsers getGroupUsers(int groupId) {
        return new GroupUsers(userMapper.selectMemberByGroupId(groupId), userMapper.selectLeaderByGroupId(groupId));
    }

    /**
     * 变更群主所分配用户
     *
     * @param groupId
     * @param members
     * @param leaders
     */
    public void modifyGroupUsers(int groupId, String members, String leaders) {
        //先删除之前关联的成员和用户组关系，领导和用户组关系
        mapper.deleteGroupLeadersById(groupId);
        mapper.deleteGroupMembersById(groupId);
        if (!StringUtils.isEmpty(members)) {
            String[] mem = members.split(",");
            for (String m : mem) {
                //插入成员
                mapper.insertGroupMembersById(groupId, Integer.parseInt(m));
            }
        }
        if (!StringUtils.isEmpty(leaders)) {
            String[] mem = leaders.split(",");
            for (String m : mem) {
                //插入领导
                mapper.insertGroupLeadersById(groupId, Integer.parseInt(m));
            }
        }
    }

    /**
     * 变更群组关联的菜单
     *
     * @param groupId
     * @param menus
     */
    public void modifyAuthorityMenu(int groupId, String[] menus) {
        //先删除该用户组绑定的菜单
        resourceAuthorityMapper.deleteByAuthorityIdAndResourceType(groupId + "", AdminConstant.RESOURCE_TYPE_MENU);
        //获取所有菜单
        List<Menu> menuList = menuMapper.selectAll();
        Map<String, String> map = new HashMap<String, String>();
        for (Menu menu : menuList) {
            map.put(menu.getId().toString(), menu.getParentId().toString());
        }
        //todo 1
        Set<String> relationMenus = new HashSet<String>();
        //菜单去重
        relationMenus.addAll(Arrays.asList(menus));
        ResourceAuthority authority = null;
        for (String menuId : menus) {
            findParentID(map, relationMenus, menuId);
        }
        for (String menuId : relationMenus) {
            authority = new ResourceAuthority(AdminConstant.AUTHORITY_TYPE_GROUP, AdminConstant.RESOURCE_TYPE_MENU);
            authority.setAuthorityId(groupId + "");
            authority.setResourceId(menuId);
            authority.setParentId("-1");
            resourceAuthorityMapper.insertSelective(authority);
        }
    }

    private void findParentID(Map<String, String> map, Set<String> relationMenus, String id) {
        String parentId = map.get(id);
        if (String.valueOf(AdminConstant.ROOT).equals(id)) {
            return;
        }
        relationMenus.add(parentId);
        findParentID(map, relationMenus, parentId);
    }

    /**
     * 分配资源权限
     *
     * @param groupId
     * @param menuId
     * @param elementId
     */
    public void modifyAuthorityElement(int groupId, int menuId, int elementId) {
        ResourceAuthority authority = new ResourceAuthority(AdminConstant.AUTHORITY_TYPE_GROUP, AdminConstant.RESOURCE_TYPE_BTN);
        authority.setAuthorityId(groupId + "");
        authority.setResourceId(elementId + "");
        authority.setParentId("-1");
        resourceAuthorityMapper.insertSelective(authority);
    }

    /**
     * 移除资源权限
     *
     * @param groupId
     * @param menuId
     * @param elementId
     */
    public void removeAuthorityElement(int groupId, int menuId, int elementId) {
        ResourceAuthority authority = new ResourceAuthority();
        authority.setAuthorityId(groupId + "");
        authority.setResourceId(elementId + "");
        authority.setParentId("-1");
        resourceAuthorityMapper.delete(authority);
    }


    /**
     * 获取群主关联的菜单
     *
     * @param groupId
     * @return
     */
    public List<AuthorityMenuTree> getAuthorityMenu(int groupId) {
        List<Menu> menus = menuMapper.selectMenuByAuthorityId(String.valueOf(groupId), AdminConstant.AUTHORITY_TYPE_GROUP);
        List<AuthorityMenuTree> trees = new ArrayList<AuthorityMenuTree>();
        AuthorityMenuTree node = null;
        for (Menu menu : menus) {
            node = new AuthorityMenuTree();
            node.setText(menu.getTitle());
            BeanUtils.copyProperties(menu, node);
            trees.add(node);
        }
        return trees;
    }

    /**
     * 获取群组关联的按钮id数组
     *
     * @param groupId
     * @return
     */
    public List<Integer> getAuthorityElement(int groupId) {
        ResourceAuthority authority = new ResourceAuthority(AdminConstant.AUTHORITY_TYPE_GROUP, AdminConstant.RESOURCE_TYPE_BTN);
        authority.setAuthorityId(groupId + "");
        List<ResourceAuthority> authorities = resourceAuthorityMapper.select(authority);
        List<Integer> ids = new ArrayList<Integer>();
        for (ResourceAuthority auth : authorities) {
            ids.add(Integer.parseInt(auth.getResourceId()));
        }
        return ids;
    }
}
