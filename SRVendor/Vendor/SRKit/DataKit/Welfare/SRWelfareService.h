//
//  SRWelfareService.h
//  SkinRun
//
//  Created by icoco7 on 6/8/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import "SRWebService.h"

@interface SRWelfareService : SRWebService

/*
 *获取福利社列表
 */
+ (instancetype)getWelfare:(int)pageint type:(int)type1;

/*
 *获取福利社详情
 */
+ (instancetype)getWelfareDetail:(int)idNum;

/*
 *领取福利号
 */
+ (instancetype)receiveWelfare:(int)idNum;

/*
 *分享福利号
 */
+ (instancetype)shareWelfare:(int)idNum;

/*
 *获取中奖列表
 */
+ (instancetype)getWelfarePrizeList:(int)idNum;

/*
 *获取与我相关福利社列表
 */
+ (instancetype)getWelfareAboutMe:(int)pageint;

/*
 *获取我的福利号
 */
+ (instancetype)getWelfareCode:(int)idNum;

/*
 *获取往期福利
 */
+ (instancetype)getOldWelfareList:(int)idNum;

/*
 *获取是否显示滚动条
 */
+ (instancetype)isShowHeaderBar;

/*
 添加再来一次
 */
+ (instancetype)getWelfareAgain:(int)objtype1 andObjid:(int)objid1;
/*
 提醒活动开始
 */
+ (instancetype)getWelfareTimetask:(int)Wid1;

@end
