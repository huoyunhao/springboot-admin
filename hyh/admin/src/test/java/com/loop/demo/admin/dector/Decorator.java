package com.loop.demo.admin.dector;

/**
 * @Auther: 霍运浩
 * @Date: 2019/3/16 0016 21:29
 * @Description:
 */
public class Decorator implements Component{
    private Component mComponent;
    public void decoratorObj(Component component){
        mComponent = component;
    }

    @Override
    public void show() {
        if(mComponent != null){
            mComponent.show();
        }
    }
}
