//
//  MyAlertView.h
//  MyAlertView
//
//  Created by 紫冬 on 13-7-27.
//  Copyright (c) 2013年 qsji. All rights reserved.
//

/*
 由于系统的UIAlertView只能显示固定的样子，所以我们要向显示我们需要的UI，那么就必须要继承UIAlertView，重新设计UIAlertView
 我们要重写一个View，可以在三个方法中来实现：
 第一个是：初始化函数init中
 第二个是：加载布局子View的函数layoutSubviews中
 第三个是：重绘view的drawRect:(CGRect)rect函数中
 
 三个函数区别：
 一般情况下：init函数作用侧重于初始化成员变量
           layoutSubviews用来加载需要添加的子组件
           drawRect:(CGRect)rect进行重绘
 
 函数的调用顺序是：子类init，父类layoutSubViews，父类drawRect，子类layoutSubViews，子类drawRect
 
 重写步骤：
 第一：先把UIAlertView上面的组件都隐藏
 第二：自定义alertView的大小和其他属性，比如self.bounds = CGRectMake(0, 0, 250, 200);
 第三：添加控件
 
 注意，如果把隐藏子组件的函数hiddenSubViews写在init，layoutSubViews，和drawRect中，效果是不同的，因为UIAlertView的子组件的加载是在layoutSubViews中，在init中还没有这些子组件，所以在init中
 调用hiddenSubViews是无法隐藏子组件的
 不过默认的情况，也即是如果使用[[MyAlertView alloc] init]
 而不是[[UIAlertView alloc] initWithTitle:@"提示" message:@"确定退出吗？" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"保存", @"退出", nil];
 那么alertView显示的时候，仍然是没有任何内容的
 */

#import <UIKit/UIKit.h>

@interface MyAlertView : UIAlertView

@end
