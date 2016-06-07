//
//  SRPublicTestService.h
//  SkinRun
//
//  Created by sl on 16/2/19.
//  Copyright (c) 2016年 上海商路网络科技有限公司. All rights reserved.
//

#import "SRWebService.h"

@interface SRPublicTestService : SRWebService
/**
 *  众测首页
 *
 *  @param status1 状态
 *  @param page1   页码
 *
 *  @return 返回结果
 */
+ (instancetype)index:(int)status1 page:(int)page1;
/**
 *  我的众测
 *
 *  @param status 状态
 *  @param page   页码
 *
 *  @return 返回结果
 */
+ (instancetype)myCrowdTest:(int)status1 page:(int)page1;

/**
 *  众测详情
 *
 *  @param id1 id
 *
 *  @return 返回结果
 */
+ (instancetype)getDetail:(int)id1;

/**
 *  产品(想要. 想试用)
 *
 *  @param id1 id
 *
 *  @return 返回结果
 */
+ (instancetype)getWanted:(int)id1 andType:(int)type1;
/**
 *  用户测评
 *
 *  @param id1 id
 *
 *  @return 返回结果
 */
+ (instancetype)getUsertest:(int)id1 andPege:(int)page1;


/**
 *  申请记录
 *
 *  @param id1 id
 *
 *  @return 返回结果
 */
+ (instancetype)getApplyrecord:(int)id1 andPege:(int)page1;

/**
 *  请求众测问题
 *
 *  @param reqId id
 *
 *  @return 返回结果
 */
+ (instancetype)getRequestion:(int)reqId;


/**
 *  提交众测答案
 *
 *  @param reqId id
 *
 *  @return 返回结果
 */
+ (instancetype)submitRequestion:(int)reqId remark:(NSString*)remark answers:(NSString*)answers;

/**
 *  绑定众测答案
 *
 *  @param reqId id
 *
 *  @return 返回结果
 */
+ (instancetype)bindShare:(int)reqId;

/**
 *  申请状态
 *
 *  @param id1 id
 *
 *  @return 返回结果
 */
+ (instancetype)allowapply:(int)id1;
@end