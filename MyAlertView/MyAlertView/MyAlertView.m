//
//  MyAlertView.m
//  MyAlertView
//
//  Created by 紫冬 on 13-7-27.
//  Copyright (c) 2013年 qsji. All rights reserved.
//

#import "MyAlertView.h"

@implementation MyAlertView

- (id)initWithFrame:(CGRect)frame
{
    NSLog(@"init");
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        


    }
    return self;
}

-(void)layoutSubviews
{
    NSLog(@"layoutSubviews");
    [super layoutSubviews];
    
    //隐藏子组件
    [self hiddenSubViews];
    
    self.bounds = CGRectMake(0, 0, 250, 200);                //设置大小，注意location是（0,0），默认显示在屏幕中间
    [self setBackgroundColor:[UIColor redColor]];
}

//隐藏UIAlertView的中的子组件
-(void)hiddenSubViews
{
    for (UIView *v in [self subviews])
    {
        if ([v class] == [UIImageView class])    //alertView默认的就是一个暗蓝色的imageView
        {
            [v setHidden:YES];
        }
        if ([v class] == [UILabel class])        //隐藏掉label
        {
            [v setHidden:YES];
        }
        if ([v isKindOfClass:[UIButton class]] ||
            [v isKindOfClass:NSClassFromString(@"UIThreePartButton")])   //隐藏掉button
        {
            [v setHidden:YES];
        }
        if ([v isKindOfClass:[UITextView class]])
        {
            [v setHidden:YES];
        }
//        [v setHidden:YES];
        
//        self.userInteractionEnabled = YES;                       //设置alertView可以相应用户事件
//        self.alertViewStyle = UIAlertViewStylePlainTextInput;    //设置UIAlertView的属性可以接受用户输入
    }
    
    //添加组件
    [self addViews];
}

-(void)addViews
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 50, 35);
    [button setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [self addSubview:button];
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    NSLog(@"drawRect");

}


@end
