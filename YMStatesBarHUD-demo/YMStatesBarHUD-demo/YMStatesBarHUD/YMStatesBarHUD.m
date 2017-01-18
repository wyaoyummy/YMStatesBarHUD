//
//  YMStatesBarHUD.m
//  YYMStatesBarHUD
//
//  Created by apple on 2017/1/17.
//  Copyright © 2017年 YaoMin. All rights reserved.
//

#import "YMStatesBarHUD.h"

// title字体大小
#define YMTitleFontSize [UIFont systemFontOfSize:12]
// 窗口弹出动画时间
static CGFloat const YMAnimationDuration = 0.25f;
// 窗口等待时间
static CGFloat const YMTimerDuration = 2.5f;

@implementation YMStatesBarHUD

// 全局window
static UIWindow *window_;
// 全局定时器
static NSTimer *timer_;

+ (void)setUpWindow
{
    // 窗口高度
    CGFloat winH = 20;
    CGFloat winW = [UIScreen mainScreen].bounds.size.width;
    CGRect winFrame = CGRectMake(-winW, 0, winW, winH);
    
    // 添加窗口
    window_.hidden= YES;
    window_ = [[UIWindow alloc] init];
    window_.frame = winFrame;
    window_.windowLevel = UIWindowLevelAlert;
    window_.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"YMStatesBarHUD.bundle/bg"]];
    window_.hidden = NO;
    
    // 添加动画
    winFrame.origin.x = 0;
    [UIView animateWithDuration:YMAnimationDuration animations:^{
        window_.frame = winFrame;
    }];
}

/// 显示消息提示
+ (void)ym_showMessageWithTitle:(NSString *)title withImage:(UIImage *)image
{
    // 停止上一次定时器
    [timer_ invalidate];
    
    // 创建window
    [self setUpWindow];
    
    // 添加btn
    UIButton *msgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (image) {
        [msgBtn setImage:image forState:UIControlStateNormal];
        msgBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [msgBtn setTitle:title forState:UIControlStateNormal];
    msgBtn.titleLabel.font = YMTitleFontSize;
    [msgBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [window_ addSubview:msgBtn];
    msgBtn.frame = window_.bounds;
    
    // 加载定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:YMTimerDuration target:self selector:@selector(ym_hide) userInfo:nil repeats:NO];
}

/// 显示成功提示
+ (void)ym_showSuccessWithTitle:(NSString *)title
{
    [self ym_showMessageWithTitle:title withImage:[UIImage imageNamed:@"YMStatesBarHUD.bundle/success"]];
}

/// 显示失败提示
+ (void)ym_showErrorWithTitle:(NSString *)title
{
    [self ym_showMessageWithTitle:title withImage:[UIImage imageNamed:@"YMStatesBarHUD.bundle/error"]];
}

/// 显示加载提示
+ (void)ym_showLoadingWithTitle:(NSString *)title
{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 创建window
    [self setUpWindow];
    
    // 创建label
    UIButton *messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [window_ addSubview:messageBtn];
    [messageBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [messageBtn setTitle:title forState:UIControlStateNormal];
    messageBtn.titleLabel.font = YMTitleFontSize;
    messageBtn.frame = window_.bounds;
    
    // 创建指示器
    UIActivityIndicatorView *activityIndecator = [[UIActivityIndicatorView alloc] init];
    [window_ addSubview:activityIndecator];
    activityIndecator.color = [UIColor grayColor];
    [activityIndecator startAnimating];
    CGSize messageBtnSize = [messageBtn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:YMTitleFontSize}];
    activityIndecator.center = CGPointMake(([UIScreen mainScreen].bounds.size.width - messageBtnSize.width) * 0.5 - 15, 10);
  
}

/// 手动隐藏提示信息
+ (void)ym_hide
{
    [UIView animateWithDuration:YMAnimationDuration animations:^{
        CGRect winFrame = window_.frame;
        winFrame.origin.x = - window_.frame.size.width;
        window_.frame = winFrame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

@end
