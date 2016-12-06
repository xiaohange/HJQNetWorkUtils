//
//  ViewController.m
//  HJQNetWorkUtilsDemo
//
//  Created by HanJunQiang on 16/7/6.
//  Copyright © 2016年 HaRi. All rights reserved.
//  iOS开发者交流qq群：446310206

#import "ViewController.h"
#import "HJQNetWorkUtils.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 网络监控测试
    [HJQNetWorkUtils netWorkStateWith:self andWorkState:^(NSInteger netState) {
        switch (netState) {
            case 1:
                NSLog(@"手机流量上网");
                break;
            case 2:
                NSLog(@"WIFI上网");
                break;
            default:
                NSLog(@"暂无网络");
                break;
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
