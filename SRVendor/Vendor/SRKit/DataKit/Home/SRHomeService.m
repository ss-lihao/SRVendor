//
//  SRHomeService.m
//  SkinRun
//
//  Created by 肌肤管家 on 15/6/15.
//  Copyright (c) 2015年 上海商路网络科技有限公司. All rights reserved.
//

#import "SRHomeService.h"
#import "SRKit.h"

//声明 WebService 模块路径
NSString* const kPathOfHome = @"home";
//http://qa.v3.api.skinrun.me/home?client=1&version=3.0

@implementation SRHomeService
/*
 * 1.19 .首页--首页发现
 */
+ (instancetype)getGetdiscover{
    
    SRHomeService* service = [[SRHomeService alloc]init];
    service.path = kPathOfHome;
    
    NSString* action = @"getdiscover";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action);
    
    return service;
}
/*
 * 1.20 .首页--换一批 获取小哥推荐
 */
+ (instancetype)getRecommend{
    
    SRHomeService* service = [[SRHomeService alloc]init];
    service.path = kPathOfHome;
    
    NSString* action = @"getrecommend";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action);
    
    return service;
}
/*
 * 11.1 .首页--动态
 */
+ (instancetype)getFeed:(int)page1 {
    
    SRHomeService* service = [[SRHomeService alloc]init];
    service.path = kPathOfHome;
    
    NSString* action = @"getfeed";
    NSString *page=[NSString stringWithFormat:@"%d",page1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,page);

    return service;
}
/*
 * 1.19 .精选动态分页
 */
+ (instancetype)getJxdt:(int)page1{
    
    SRHomeService* service = [[SRHomeService alloc]init];
    service.path = kPathOfHome;
    
    NSString* action = @"jxdt";
      NSString *page=[NSString stringWithFormat:@"%d",page1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,page);
    
    return service;
}

/*
 * 11.2 .首页--首页关注
 */
+ (instancetype)getFollow:(int)page1 {
    
    SRHomeService* service = [[SRHomeService alloc]init];
    service.path = kPathOfHome;
    
    NSString* action = @"getfollow";
    NSString *page=[NSString stringWithFormat:@"%d",page1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,page);
    
    return service;
}

/*
 * 11.2 .首页--首页搜索用户,加关注
 */
+ (instancetype)getHomeList:(int)page1 keyword:(NSString *)keyword{
    
    SRHomeService* service = [[SRHomeService alloc]init];
    service.path =@"member/friend";
    
    NSString* action = @"gethomelist";
    NSString *page=[NSString stringWithFormat:@"%d",page1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,page,keyword);
    
    return service;
}


/*
 * 11.2 .首页--首页搜索用户(默认推荐用户)
 */
+ (instancetype)getreCommendUser:(int)page1 {
    
    SRHomeService* service = [[SRHomeService alloc]init];
    service.path = kPathOfHome;
    
    NSString* action = @"getrecommenduser";
    NSString *page=[NSString stringWithFormat:@"%d",page1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,page);
    
    return service;
}
@end
