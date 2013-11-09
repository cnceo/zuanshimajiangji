//
//  WebRequest.m
//  钻石麻将
//
//  Created by 向 文品 on 13-11-8.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "WebRequest.h"
#import "Reachability.h"
#define PRELINK @"http://www.ysapp.cn/mahjongApp/Api/index.php?s=Index/"
@implementation WebRequest
+(NSURL *)getMenuItemsRequest
{
    NSString *url=[NSString stringWithFormat:@"%@menu_list",PRELINK];
    return [NSURL URLWithString:url];
}
//判断网络是否连接
+(BOOL) isConnectionAvailable{
    
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            //NSLog(@"notReachable");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    return isExistenceNetwork;
}
@end
