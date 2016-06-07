//
//  SRActivityService.h
//  SkinRun
//
//  Created by lxt on 15/6/12.
//  Copyright (c) 2015年 上海商路网络科技有限公司. All rights reserved.
//

#import "SRWebService.h"

@interface SRActivityService : SRWebService

/*
 *获取活动或文章列表
 */
+ (instancetype)getActivityContent:(NSString*)type;
+ (instancetype)getActivityContentWithType:(NSString*)type page:(int)pageint;

/*
 *获取活动或文章详情
 */
+ (instancetype)getActivityOneContent:(int)idStr;

//获取测试，我的show等详细信息
+ (instancetype)getTestDetail:(int)idNum objectType:(int)objectType uid:(int)uid;

/*
 *活动分享成功加积分
 */
+ (instancetype)activityAddCredit;

/*
 *分享成功加积分
 */
+ (instancetype)activityAddCredit:(int)objtype1 andPost_id:(int)post_id1;

////点赞
//+(instancetype)praiseActivity:(int)objectype postId:(int)postId;
//
////评论
//+(instancetype)replyActivity:(int)objectype postId:(int)postId parentId:(int)parId content:(NSString*)content image:(NSString*)img;
////获取评论列表
//+(instancetype)getlistComment:(int)objectype postId:(int)postId page:(int)pagestr;

/*
 *获取美妆志评论
 */
+ (instancetype)getDiaryRemarkList:(int)objtype1 andPost_id:(int)post_id1 Page:(int)pg;
@end
