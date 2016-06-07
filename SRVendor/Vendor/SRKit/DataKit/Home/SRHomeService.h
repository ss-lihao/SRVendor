//
//  SRHomeService.h
//  SkinRun
//
//  Created by 肌肤管家 on 15/6/15.
//  Copyright (c) 2015年 上海商路网络科技有限公司. All rights reserved.
//

#import "SRWebService.h"

@interface SRHomeService : SRWebService

/*
 * 11.2 .首页--首页发现
 */
+ (instancetype)getGetdiscover;
/*
 * 1.20 .首页--换一批 获取小哥推荐
 */
+ (instancetype)getRecommend;
/*
 * 1.19 .精选动态分页
 */
+ (instancetype)getJxdt:(int)page1;
/*
 * 11.1 .首页--动态
 */
+ (instancetype)getFeed:(int)page1;

/*
 * 11.2 .首页--首页关注
 */
+ (instancetype)getFollow:(int)page1;

/*
 * 11.2 .首页--首页搜索用户,加关注
 */
+ (instancetype)getHomeList:(int)page1 keyword:(NSString *)keyword;

/*
 * 11.2 .首页--首页搜索用户(默认推荐用户)
 */
+ (instancetype)getreCommendUser:(int)page1;

@end
