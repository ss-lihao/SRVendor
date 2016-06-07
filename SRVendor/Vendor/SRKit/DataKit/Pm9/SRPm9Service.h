//
//  SRPm9Service.h
//  SkinRun
//
//  Created by icoco7 on 6/8/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import "SRWebService.h"

@interface SRPm9Service : SRWebService

/*
 *获取历史列表
 */
+ (instancetype)getPm9History:(int)pageint;

/*
 *保存聊天内容
 */
+ (instancetype)savePm9Conversation:(NSString*)uid userId:(int)userIdint messageId:(NSString*)messageId groupId:(int)groupIdint type:(NSNumber*)typeint nickname:(NSString*)nickname username:(NSString*)username content:(NSString*)content message:(NSString*)message_details messagetime:(NSString*)messagetime timestamp:(NSString*)timestamp  createTime:(NSString*)createTime updateTime:(NSString*)updateTime topicid:(int)topicidint;
//获取当期晚9点
+ (instancetype)getPm9List;

/*
 *获取单个晚9点信息
 */
+ (instancetype)getPm9One:(int)id;

/*
 *晚9点分享成功加积分
 */
+ (instancetype)pm9AddCredit;

/*
 *晚9点分享成功加积分 最新接口
 */
+ (instancetype)pm9AddCredit:(int)objtype1 andPost_id:(int)post_id1;

@end

