//
//  YMStatesBarHUD.h
//  YMStatesBarHUD
//
//  Created by apple on 2017/1/17.
//  Copyright © 2017年 YaoMin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMStatesBarHUD : NSObject

/// 显示成功提示
+ (void)ym_showSuccessWithTitle:(NSString *)title;

/// 显示错误提示
+ (void)ym_showErrorWithTitle:(NSString *)title;

/// 显示自定义提示
+ (void)ym_showMessageWithTitle:(NSString *)title withImage:(UIImage *)image;

/// 显示正在加载提示
+ (void)ym_showLoadingWithTitle:(NSString *)title;

/// 手动隐藏提示信息
+ (void)ym_hide;

@end
