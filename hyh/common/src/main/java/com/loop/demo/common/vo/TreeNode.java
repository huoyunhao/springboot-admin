package com.loop.demo.common.vo;

import java.util.ArrayList;
import java.util.List;

/**
 */
public class TreeNode {
    protected int id;
    protected int parentId;
    List<TreeNode> children = new ArrayList<TreeNode>();
    public List<TreeNode> getChildren() {
        return children;
    }

    public void setChildren(List<TreeNode> children) {
        this.children = children;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public void add(TreeNode node){
        children.add(node);
    }
}
