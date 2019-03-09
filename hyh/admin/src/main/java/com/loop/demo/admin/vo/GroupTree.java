package com.loop.demo.admin.vo;


import com.loop.demo.common.vo.TreeNode;

public class GroupTree extends TreeNode {
    String label;

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
