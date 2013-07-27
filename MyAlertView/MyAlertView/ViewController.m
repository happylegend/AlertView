//
//  ViewController.m
//  MyAlertView
//
//  Created by 紫冬 on 13-7-12.
//  Copyright (c) 2013年 qsji. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mAlertView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //创建一个UIAlertView

//    self.mAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确定退出吗？" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"保存", @"退出", nil];
//    self.mAlertView.tag = 0;
//    [self.mAlertView show];
//    [mAlertView release];
    
    MyAlertView *myAlertView = [[MyAlertView alloc] init];
    [myAlertView show];    
    [myAlertView release];
    /*     
     如果写了mAlertView = nil;这句表达式以后，那么就会出现一些意外，为什么呢？因为我们赋值为了nil，所以，以后在其他地方，比如在下面的回调函数中，所有的mAlertView的值都将是0x00000000也即是nil。所以在下面的
     判断语句中[alertView isEqual: mAlertView]，alertView的值是该alertView创建时候返还的内存地址值，也即是在mAlertView赋值为nil之前的值，因为mAlertView也指向在内存中的该alertView，
     并且release之后，mAlertView的值仍然是表示我们创建的该alertView的内存地址值，release仅仅是将计数器减一，并没有重新设置mAlertView的指针值。然而意外就出现在了赋值为nil，当我们release以后，
     然后再赋值为nil，那么此时alertView就和mAlertView不相等了，alertView还是表示该弹出框的内存地址值，但是mAlertView已经被我们赋值为nil了。
     
     如果我们alloc一个对象，使用完了以后，将这个对象release掉，引用计数器减一。那么什么时候，将这块内存释放掉呢？答案是当引用计数器为0的时候，表示没有指针指向这块内存了，所以系统就要把它回收掉。
     那么如果我们创建一个UIView，show以后，然后调用release。那么为什么这个创建的view没有立马被回收掉，仍然显示着呢？
     那么这里就需要分两种情况：可视化类对象与不可视化类对象
     1.如果是不可视化类对象，当我们alloc以后，使用完了以后，release以后，如果计数器为0，那么这个时候立马就将这块内存释放掉
     2.如果是可可视化对象，当我们alloc后，调用show显示出来，release以后，即时计数器为0，也不会立马将这块内存释放掉，当关闭该窗体时，就会释放，另外，当我们将这个view添加到父窗体时候，
     此时父窗体也持有了该view的指针地址，即引用，此时计数器增加1
    */
}

-(void)dealloc
{
    [super dealloc];
}

// Called when a button is clicked. The view will be automatically dismissed after this call returns
//点击alertView上面的某一个按钮的时候，响应该按钮，按钮是根据alertview的序号即索引来获取的，从左到右，依次从0开始，这个回调函数是比较有用的
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"调用了 - (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex");
    
    NSLog(@"buttonIndex is:　%ld", (long)buttonIndex);
    
    if ([alertView isEqual: mAlertView])    //之所以要判断是哪个alertView，因为当有多个alertView的时候，必须要区分
    {
        if ((long)buttonIndex == 0)
        {
            NSLog(@"点击了取消按钮");
        }
        else if ((long)buttonIndex == 1)
        {
            NSLog(@"点击了保存按钮");
        }
        else
        {
            NSLog(@"点击了退出按钮");
        }
    }
}


//// Called when we cancel a view (eg. the user clicks the Home button). This is not called when the user clicks the cancel button.
//// If not defined in the delegate, we simulate a click in the cancel button
- (void)alertViewCancel:(UIAlertView *)alertView
{
    NSLog(@"调用了 - (void)alertViewCancel:(UIAlertView *)alertView");
}

// before animation and showing view
//动画之前，正要显示alertView的时候调用
- (void)willPresentAlertView:(UIAlertView *)alertView  
{
    NSLog(@"调用了- (void)willPresentAlertView:(UIAlertView *)alertView");
}

// after animation
//弹出alertView之后，也即是弹出alertView的动画结束之后
- (void)didPresentAlertView:(UIAlertView *)alertView
{
    NSLog(@"调用了- (void)didPresentAlertView:(UIAlertView *)alertView");
}

// before animation and hiding view
//dismiss该alertView，正要隐藏该alertView，但是在隐藏的动画效果之前调用
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex 
{
    NSLog(@"调用了 - (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex");
}

// after animation
//隐藏该alertView,动画结束之后
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex  
{
    NSLog(@"调用了 - (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex");
}

// Called after edits in any of the default fields added by the style
- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    NSLog(@"调用了 - (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView");
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
