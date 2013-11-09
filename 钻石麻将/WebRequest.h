//
//  WebRequest.h
//  钻石麻将
//
//  Created by 向 文品 on 13-11-8.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebRequest : NSObject
//菜单页面
+(NSURL *)getMenuItemsRequest;
//判断网络是否连接
+(BOOL) isConnectionAvailable;
//登录
+(NSURL *)getLoginRequest;
//注册
+(NSURL *)getRegisterRequest;
//手机验证
+(NSURL *)getPhoneTestRequest;
//重设密码
+(NSURL *)getResetPasswordRequest;
//首页大图
+(NSURL *)getMainPictureRequest;
@end
