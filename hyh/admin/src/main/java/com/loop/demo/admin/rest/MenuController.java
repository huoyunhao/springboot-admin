package com.loop.demo.admin.rest;

import com.loop.demo.admin.biz.MenuBiz;
import com.loop.demo.admin.biz.UserBiz;
import com.loop.demo.admin.constants.AdminConstant;
import com.loop.demo.admin.entity.Menu;
import com.loop.demo.admin.vo.AuthorityMenuTree;
import com.loop.demo.admin.vo.MenuTree;
import com.loop.demo.common.rest.BaseController;
import com.loop.demo.common.util.TreeUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("menu")
public class MenuController extends BaseController<MenuBiz, Menu> {
    @Autowired
    private UserBiz userBiz;


    /**
     *获取所有菜单菜单树
     * @param title
     * @return
     */
    @RequestMapping(value = "/tree", method = RequestMethod.GET)
    @ResponseBody
    public List<MenuTree> getTree(String title) {
        Example example = new Example(Menu.class);
        if (StringUtils.isNotBlank(title)) {
            example.createCriteria().andLike("title", "%" + title + "%");
        }
        return getMenuTree(baseBiz.selectByExample(example), AdminConstant.ROOT);
    }





    private List<MenuTree> getMenuTree(List<Menu> menus,int root) {
        List<MenuTree> trees = new ArrayList<MenuTree>();
        MenuTree node = null;
        for (Menu menu : menus) {
            node = new MenuTree();
            BeanUtils.copyProperties(menu, node);
            node.setLabel(menu.getTitle());
            trees.add(node);
        }
        return TreeUtil.bulid(trees,root) ;
    }


}
