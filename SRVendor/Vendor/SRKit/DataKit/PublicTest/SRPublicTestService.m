//
//  SRPublicTestService.m
//  SkinRun
//
//  Created by sl on 16/2/19.
//  Copyright (c) 2016年 上海商路网络科技有限公司. All rights reserved.
//

#import "SRPublicTestService.h"
//声明 WebService 模块路径
NSString* const kPathOfPublicTest = @"crowdtest";
@implementation SRPublicTestService

/**
 *  众测首页
 *
 *  @param status1 状态
 *  @param page1   页码
 *
 *  @return 返回对象
 */
+ (instancetype)index:(int)status1 page:(int)page1{
    SRPublicTestService * service = [[SRPublicTestService alloc]init];
    service.path = kPathOfPublicTest;
    NSString* action = @"index";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString *page=[NSString stringWithFormat:@"%d",page1];
    NSString *status=[NSString stringWithFormat:@"%d",status1];
    service.body = SRDictionaryWithVariableBindings(action,status,page);
    return service;
    
}
/**
 *  我的众测
 *
 *  @param status 状态
 *  @param page   页码
 *
 *  @return 返回结果
 */
+ (instancetype)myCrowdTest:(int)status1 page:(int)page1{
    
    SRPublicTestService * service = [[SRPublicTestService alloc]init];
    service.path = kPathOfPublicTest;
    NSString* action = @"mycrowdtest";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString *page=[NSString stringWithFormat:@"%d",page1];
    NSString *status=[NSString stringWithFormat:@"%d",status1];
    service.body = SRDictionaryWithVariableBindings(action,status,page);
    return service;
}

/**
 *  众测详情
 *
 *  @param id1 id
 *
 *  @return 返回结果
 */
+ (instancetype)getDetail:(int)id1{
    
    SRPublicTestService *service = [[SRPublicTestService alloc] init];
    service.path = kPathOfPublicTest;
    NSString *action = @"detail";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString *id=[NSString stringWithFormat:@"%d",id1];
    service.body = SRDictionaryWithVariableBindings(action,id);
    return service;
}


/**
 *  产品(想要. 想试用)
 *
 *  @param id1 id
 *
 *  @return 返回结果
 */
+ (instancetype)getWanted:(int)id1 andType:(int)type1{
    SRPublicTestService *service = [[SRPublicTestService alloc] init];
    service.path = @"content/post";
    NSString *action = @"wanted";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString *id=[NSString stringWithFormat:@"%d",id1];
    NSString *type=[NSString stringWithFormat:@"%d",type1];
    service.body = SRDictionaryWithVariableBindings(action,id,type);
    return service;
    
}


/**
 *  用户测评
 *
 *  @param id1 id
 *
 *  @return 返回结果
 */
+ (instancetype)getUsertest:(int)id1 andPege:(int)page1{
    SRPublicTestService *service = [[SRPublicTestService alloc] init];
    service.path = kPathOfPublicTest;
    NSString *action = @"usertest";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString *id=[NSString stringWithFormat:@"%d",id1];
    NSString *page=[NSString stringWithFormat:@"%d",page1];
    service.body = SRDictionaryWithVariableBindings(action,id,page);
    return service;
    
}
/**
 *  申请记录
 *
 *  @param id1 id
 *
 *  @return 返回结果
 */
+ (instancetype)getApplyrecord:(int)id1 andPege:(int)page1{
    SRPublicTestService *service = [[SRPublicTestService alloc] init];
    service.path = kPathOfPublicTest;
    NSString *action = @"applyrecord";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString *id=[NSString stringWithFormat:@"%d",id1];
    NSString *page=[NSString stringWithFormat:@"%d",page1];
    service.body = SRDictionaryWithVariableBindings(action,id,page);
    return service;
}


/**
 *  请求众测问题
 *
 *  @param reqId id
 *
 *  @return 返回结果
 */
+ (instancetype)getRequestion:(int)reqId{
    SRPublicTestService * service = [[SRPublicTestService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/index",kPathOfPublicTest];
    NSString* action = @"getquestions";
    NSString *id=[NSString stringWithFormat:@"%d",reqId];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,id);
    return service;
    
}


/**
 *  提交众测答案
 *
 *  @param reqId id
 *
 *  @return 返回结果
 */
+ (instancetype)submitRequestion:(int)reqId remark:(NSString*)remark answers:(NSString*)answers{
    SRPublicTestService * service = [[SRPublicTestService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/index",kPathOfPublicTest];
    NSString* action = @"saveapply";
    NSString *id=[NSString stringWithFormat:@"%d",reqId];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,id,remark,answers);
    return service;
    
}

/**
 *  绑定众测答案
 *
 *  @param reqId id
 *
 *  @return 返回结果
 */
+ (instancetype)bindShare:(int)reqId{
    SRPublicTestService * service = [[SRPublicTestService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/index",kPathOfPublicTest];
    NSString* action = @"shareback";
    NSString *id=[NSString stringWithFormat:@"%d",reqId];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,id);
    return service;
    
}

/**
 *  申请状态
 *
 *  @param id1 id
 *
 *  @return 返回结果
 */
+ (instancetype)allowapply:(int)id1{

    SRPublicTestService *service = [[SRPublicTestService alloc] init];
    service.path = kPathOfPublicTest;
    NSString *action = @"allowapply";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString *id=[NSString stringWithFormat:@"%d",id1];
    service.body = SRDictionaryWithVariableBindings(action,id);
    return service;
}
@end
