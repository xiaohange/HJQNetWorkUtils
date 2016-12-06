//
//  NetWorkUtils.h
//  NetWorkReachability
//
//  Created by HaRi on 16/5/17.
//  Copyright © 2016年 韩俊强. All rights reserved.
//  iOS开发者交流qq群：446310206

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AFNetworkReachabilityManager.h"
typedef void(^netStateBlock)(NSInteger netState);


@interface HJQNetWorkUtils : NSObject

/**
 网络监测
 @param vc 提醒用户去打开网络的vc放在哪
 @param block 网络监测
 */
+ (void)netWorkStateWith:(UIViewController*)vc andWorkState:(netStateBlock)block;

@end
