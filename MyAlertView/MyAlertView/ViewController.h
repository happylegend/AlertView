//
//  ViewController.h
//  MyAlertView
//
//  Created by 紫冬 on 13-7-12.
//  Copyright (c) 2013年 qsji. All rights reserved.
//

/*
 该项目主要介绍了两个用法：
 第一种：直接使用UIAlertView，利用代理，要实现UIAlertViewDelegate的代理协议
 第二种：继承UIAlertView，实现自定义AlertView
 
 UIAlertView的一般作用：作为模式窗口，或者是提示对话框
 
 */

#import <UIKit/UIKit.h>
#import "MyAlertView.h"

@interface ViewController : UIViewController<UIAlertViewDelegate>
{
    UIAlertView *mAlertView;
}

@property(nonatomic, retain)UIAlertView *mAlertView;

@end
