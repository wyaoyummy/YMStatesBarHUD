# YMStatesBarHUD
简单的状态栏左侧飞出提示框

## 显示成功提示
```objc
    [YMStatesBarHUD ym_showSuccessWithTitle:@"hello"];
``

## 显示错误提示
```objc
    [YMStatesBarHUD ym_showErrorWithTitle:@"加载失败"];
``

## 显示一般信息提示(可自定义图片)
```objc
    [YMStatesBarHUD ym_showMessageWithTitle:@"网络出错" withImage:nil];
``

## 显示加载提示
```objc
    [YMStatesBarHUD ym_showLoadingWithTitle:@"正在加载中..."];
``

## 隐藏
```objc
    [YMStatesBarHUD ym_hide];
``
