//
//  AppConfig.h
//  SkinRun
//
//  Created by sl on 15/5/26.
//  Copyright (c) 2015年 上海商路网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#define SRActiveUrl @"http://w1.skinrun.me"

@interface AppConfig : NSObject



+ (BOOL) isVirtualServerMode;

+ (void) setVirtualServerMode:(BOOL)value;

+ (NSString *) getRootOfWebService;

+ (NSString*)getAppVersion;

+ (NSString*)getClient;
+ (NSString*)getWebServiceEntry;

+ (NSString*)getImageBaseUrl;

+ (NSString*)getAppAboutUrl;

//+ (NSString*)getV3AppAboutUrl;

/**
 *  后去标签
 *
 *  @return 返回结果
 */
+ (NSString *)getSign;
@end
