//
//  ViewController.m
//  YMStatesBarHUD-demo
//
//  Created by apple on 2017/1/18.
//  Copyright © 2017年 YaoMin. All rights reserved.
//

#import "ViewController.h"
#import "YMStatesBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
/// success
- (IBAction)success:(id)sender {
    [YMStatesBarHUD ym_showSuccessWithTitle:@"hello"];
}
/// error
- (IBAction)error:(id)sender {
    [YMStatesBarHUD ym_showErrorWithTitle:@"加载失败"];
}
/// message
- (IBAction)message:(id)sender {
    [YMStatesBarHUD ym_showMessageWithTitle:@"网络出错" withImage:nil];
}
/// loading
- (IBAction)loading:(id)sender {
    [YMStatesBarHUD ym_showLoadingWithTitle:@"正在加载中..."];
}
/// hide
- (IBAction)hide:(id)sender {
    [YMStatesBarHUD ym_hide];
}

@end
