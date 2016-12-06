//
//  NetWorkUtils.m
//  NetWorkReachability
//
//  Created by HaRi on 16/5/17.
//  Copyright © 2016年 韩俊强. All rights reserved.
//  iOS开发者交流qq群：446310206

#import "HJQNetWorkUtils.h"

@implementation HJQNetWorkUtils

#pragma mark----网络检测
+ (void)netWorkStateWith:(UIViewController*)vc andWorkState:(netStateBlock)block;
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    // 提示：要监控网络连接状态，必须要先调用单例的startMonitoring方法
    [manager startMonitoring];
    
    //检测的结果
    __block typeof(self) bself = self;
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (status==0||status==-1) {
            
            //弹出提示框
            [bself showWarningView:vc];
            
            //将netState值传入block中
            block(status);
            
        }else{
            //将netState值传入block中
            block(status);
        }
    }];
}

#pragma mark---网络断开时弹出提示框
+ (void)showWarningView:(UIViewController*)vc
{
    UIAlertController *alertVC = [[UIAlertController alloc]init];
    alertVC.message = @"网络断开，请检查网络设置";
    alertVC.title = @"提示";
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    // 去设置
    UIAlertAction *goToSettingAction = [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSURL*url=[NSURL URLWithString:@"Prefs:root=WIFI"];
        Class LSApplicationWorkspace = NSClassFromString(@"LSApplicationWorkspace");
        [[LSApplicationWorkspace performSelector:@selector(defaultWorkspace)] performSelector:@selector(openSensitiveURL:withOptions:) withObject:url withObject:nil];
    }];
    [alertVC addAction:cancleAction];
    [alertVC addAction:goToSettingAction];

    // show
    [vc presentViewController:alertVC animated:YES completion:nil];
}

@end
