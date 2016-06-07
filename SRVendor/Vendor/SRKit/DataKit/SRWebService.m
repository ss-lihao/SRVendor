//
//  SRWebService.m
//  SkinRun
//
//  Created by skin on 6/5/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import "SRWebService.h"
#import "RKURLEncodedSerialization.h"
#import "NSDictionary+SRHelper.h"
#import "CKStringUtils.h"

#import "SRDataManager.h"
#import "SRDataException.h"
#import "AppConfig.h"
#import "SRKit.h"

//#define RSApiRootUrl  @"http://qa.v3.api.skinrun.me"

@implementation SRWebService{

    NSDictionary * _timeAndSign;
}
@synthesize serviceId;
@synthesize path;
@synthesize header;
@synthesize body;
                                          
@synthesize delegate;

//http://qa.v3.api.skinrun.me/member?client=1&version=3.0&appid=1

-(id) init{
    self = [super init];
    if (self) {
        self.header = [SRWebService encodedAuthorizeTokenInfo];
    }
    return self;
}

- (NSString*)getUrl{
    NSString* root = [AppConfig getRootOfWebService] ;//RSApiRootUrl;
    NSString* appInfo = [self getAppInfo];
//    NSString* queryString = RKPercentEscapedQueryStringFromStringWithEncoding(appInfo,NSUTF8StringEncoding);
    NSString* url = [NSString stringWithFormat:@"%@/%@?%@",root, path,appInfo];
    return url;
}


- (NSString*)getAppInfo{
    //TODO
    NSString * timeString = [[NSUserDefaults standardUserDefaults] objectForKey:@"TIME"];
    return[NSString stringWithFormat:@"appid=1&client=1&version=%@&time=%@",[AppConfig getAppVersion],timeString];
    
}

- (void)generateSerivceId{
    //@TODO
    serviceId = [body objectForKey:@"action"];
}

- (void)setBody:(NSDictionary *)value{
    body = value;
    
    [self generateSerivceId];
}

/*
 *  base64 编码
 *  Header 中的参数 Authorization 的值为 Base base64_encode(用户名:密码:appid)
 */
+ (NSDictionary*)encodeAuthorizeLoginInfo:(NSString*)user password:(NSString*)password{
    NSString *str = [NSString stringWithFormat:@"%@:%@:1", user, password];
    NSString *base64 = [[str dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0];
    NSDictionary *dict = @{@"Authorization":[@"Base " stringByAppendingString:base64]};
    return dict;
}

/*
 *Ø
 *  Header 参数 Authorization= Token 8f8d957b60de3401e44821553b978107
 *
 *
 *  sign
 */
+ (NSDictionary*)encodeAuthorizeTokenInfo:(NSString*)token{
    if (token==nil) {
        token = @"";
    }
    NSString *str = [NSString stringWithFormat:@"%@",token];

    NSDictionary *dict = @{@"Authorization":[@"Token " stringByAppendingString:str],@"sign":[AppConfig getSign]};
    return dict;
}

+ (NSDictionary*)encodedAuthorizeTokenInfo{
    NSString* token = [[SRDataManager sharedInstance]getUserToken];
    return [SRWebService encodeAuthorizeTokenInfo:token];
}


+ (BOOL)isSuccessOperation:(NSDictionary*)response{
    if (nil == response) {
        return false;
    }
    NSDictionary* dict =(NSDictionary*)response;
    NSString* code = [dict stringValueForPath:@"code"];
    
    return [@"200" isEqualToString:code] || [@"201" isEqualToString:code];
    
}

+ (NSException *)dataExceptionWithResponse:(NSDictionary*)response{
    
//    id value = [response objectForKey:@"data"];
//    if ([value isKindOfClass:[NSArray class]]&&[value count]==0) {
//        SRDataException* exception = [SRDataException exceptionWithCode:9999 name:@"9999" reason:@"暂无数据" userInfo:response];
//        return  exception;
//    }
//    else{
        if ([SRWebService isSuccessOperation:response]) {
            return nil;
        }
//    }
    
    NSDictionary* dict =(NSDictionary*)response;
    NSString* code =   [dict stringValueForPath:@"code"];
    code = [CKStringUtils safeString:code defaultValue:@"0"];
    int c = [code intValue];
    NSString* msg = [dict stringValueForPath:@"message"];
    msg = [CKStringUtils safeString:msg defaultValue:SRExceptionDomain];
   //@ msg = [CKStringUtils decodeUTF8String:msg];
    
    SRDataException* exception = [SRDataException exceptionWithCode:c name:code reason:msg userInfo:dict];
    return  exception;
    
}

- (void)execute{
    
    [[SRDataManager sharedInstance] invokeService:self];
}

/*
 * set the success block and failure block directly
 */
- (void)execute:(SRInvokeSuccessBlock)success failure:(SRInvokeFailureBlock)failure {
    [[SRDataManager sharedInstance] invokeService:self success:success failure:failure];
}

- (void)dealloc{
    self.header = nil;
    self.path = nil;
    self.body = nil;
    self.successFilter = nil;
    NSLog(@"dealloc %@", self);
}




@end
