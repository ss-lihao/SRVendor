//
//  SRTrainingPlan.h
//  SkinRun
//
//  Created by 肌肤管家 on 15/9/23.
//  Copyright (c) 2015年 上海商路网络科技有限公司. All rights reserved.
//

#import "SRWebService.h"

@interface SRTrainingPlan : SRWebService

/*
 *训练列表
 */
+ (instancetype)getTraining:(int)type1 page:(int)page1;
+ (instancetype)getTraining;

/*
 *训练计划列表
 */
+ (instancetype)getTraining:(int)tid1;

/*
 *获取训练计划详情
 */
+ (instancetype)getTrainingTid:(int)tid1;


/*
 *设置用户训练记录
 tid1===训练ID
 did1===训练计划ID
 vid1===训练动作ID
 day_number1===训练第几天
 is_lastvideo1===是否最后一个视频
 is_lastday1===是否最后一天
 */
+ (instancetype)getTraining:(int)tid1 andDid:(int)did1 andVid:(int)vid1 andDay_number:(int)day_number1 andIs_lastvideo:(int)is_lastvideo1 andIs_lastday:(int)is_lastday1;


/*
 *训练参与人员
 */
+ (instancetype)getJoinList:(int)tid1 andPabg:(int)page1;

///*
// *设置训练参与人数
// */
//+ (instancetype)getJoinCount:(int)tid1;


/*
 *设置用户训练记录
 */
+ (instancetype)getVideoDetails:(NSString*)tid did:(NSString*)did vid:(NSString*)vid day_number:(NSString*)day_number is_lastvideo:(NSString*)is_lastvideo is_lastday:(NSString*)is_lastday;
/*
 * 训练 show
 */
+ (instancetype)getShowTrain:(NSString*)img andContent:(NSString*)Content andObjid:(int)objid1;

@end
