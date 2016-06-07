//
//  AppConfig.m
//  SkinRun
//
//  Created by sl on 15/5/26.
//  Copyright (c) 2015年 上海商路网络科技有限公司. All rights reserved.
//

#import "AppConfig.h"
#import "Resource.h"
#import <CommonCrypto/CommonDigest.h>
#define key @"96D9QQRW65A21UQXXXMV6MBL4MAF78T3VH19NFKW86BWYCA7ASC8AAZV5BNQQRJ1"


//#define RSApiRootUrl    @"http://base.api.skinrun.me"
//#define RSApiRootUrl  @"http://192.168.1.251"
#define RSApiRootUrl  @"http://v33.api.skinrun.me"
//#define RSApiRootUrl  @"http://v31.api.skinrun.me"  //3.1地址


@implementation AppConfig


static BOOL _isVirtualServer = false;
+ (BOOL) isVirtualServerMode{
    return _isVirtualServer;
}

+ (void)setVirtualServerMode:(BOOL)value{
    _isVirtualServer = value;
}

+ (NSString *)getRootOfWebService{
    
    if ([AppConfig isVirtualServerMode]) {
        return @"http://127.0.0.1";
    }
    return RSApiRootUrl;
}


+ (NSString*)getAppVersion{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
//    return @"3.0.0";
    return version;
}

+ (NSString*)getImageBaseUrl{
    
    return RSApiRootUrl;
}

+ (NSString*)getWebServiceEntry{
    
    return RSApiRootUrl;
}

+ (NSString*)getAppAboutUrl{
    
    return [NSString stringWithFormat:@"%@/h5/help/about",RSApiRootUrl];
//    return @"http://v32.api.skinrun.me/h5/help/about";
}
+ (NSString*)getAppV3AboutUrl{
    return [NSString stringWithFormat:@"%@/h5/help/about",RSApiRootUrl];
}
+ (NSString *)getClient{
    return @"1";
}


/**
 *  后去标签
 *
 *  @return 返回结果
 */
+ (NSString *)getSign{
    //获取系统时间
    NSDate * date = [NSDate date];
    
    double millSecond = [date timeIntervalSince1970];
    
    NSString *dateString = [NSString stringWithFormat:@"%f",millSecond];
    //获取系统时间毫秒级字符串
    dateString = [[dateString componentsSeparatedByString:@"."] firstObject];
    
    //    AppDelegate * delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [[NSUserDefaults standardUserDefaults] setObject:dateString forKey:@"TIME"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    //获取系统版本
    NSString * version = [AppConfig getAppVersion];
    //获取客户端平台编号
    NSString * client = [AppConfig getClient];
    NSString * sign =[AppConfig MD5:[NSString stringWithFormat:@"%@%@%@%@",version,client,dateString,key]] ;
    return sign;
    
    return @"";
}

+ (NSString *)MD5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (unsigned int)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


@end
