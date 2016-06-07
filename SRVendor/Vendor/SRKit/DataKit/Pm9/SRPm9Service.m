//
//  SRPm9Service.m
//  SkinRun
//
//  Created by icoco7 on 6/8/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import "SRPm9Service.h"
#import "SRKit.h"

//声明 WebService 模块路径
NSString* const kPathOfPm9 = @"pm9";

@implementation SRPm9Service

/*
 *获取历史列表
 */
+ (instancetype)getPm9History:(int)pageint{
    SRPm9Service* service = [[SRPm9Service alloc]init];
    service.path = kPathOfPm9;
    
    NSString* action = @"history";
    NSString* page = [NSString stringWithFormat:@"%d", pageint];
    service.body = SRDictionaryWithVariableBindings(action,page);
    
    return service;
}


/*
 *保存聊天内容
 */
+ (instancetype)savePm9Conversation:(NSString*)uid userId:(int)userIdint messageId:(NSString*)messageId groupId:(int)groupIdint type:(NSNumber*)typeint nickname:(NSString*)nickname username:(NSString*)username content:(NSString*)content message:(NSString*)message_details messagetime:(NSString*)messagetime timestamp:(NSString*)timestamp  createTime:(NSString*)createTime updateTime:(NSString*)updateTime topicid:(int)topicidint{
    
    SRPm9Service* service = [[SRPm9Service alloc]init];
    service.path = kPathOfPm9;
    
    NSString* action = @"addpm9msg";
    NSString* userId = [NSString stringWithFormat:@"%d", userIdint];
    NSString* groupId = [NSString stringWithFormat:@"%d", groupIdint];
    NSString* type = [NSString stringWithFormat:@"%@", typeint];
    NSString* topicid = [NSString stringWithFormat:@"%d", topicidint];

    
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    
    service.body = SRDictionaryWithVariableBindings(action,uid,userId,messageId,groupId,type,nickname,username,content,message_details,messagetime,timestamp,createTime,updateTime,topicid);
    
    return service;
}

//获取当期晚9点
+ (instancetype)getPm9List{
    SRPm9Service* service = [[SRPm9Service alloc]init];
    service.path = kPathOfPm9;
    
    NSString* action = @"getlist";
    
    service.body = SRDictionaryWithVariableBindings(action);
    
    return service;
}

/*
 *获取单个晚9点信息
 */
+ (instancetype)getPm9One:(int)idN{
    SRPm9Service* service = [[SRPm9Service alloc]init];
    service.path = kPathOfPm9;
    
    NSString* action = @"getone";
    NSString* id = [NSString stringWithFormat:@"%d", idN];
    service.body = SRDictionaryWithVariableBindings(action,id);
    
    return service;
}

/*
 *晚9点分享成功加积分
 */
+ (instancetype)pm9AddCredit{
    SRPm9Service* service = [[SRPm9Service alloc]init];
    service.path = kPathOfPm9;
    
    NSString* action = @"addcredit";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    
    service.body = SRDictionaryWithVariableBindings(action);
    
    return service;
}
/*
 :(int)objtype1 andPost_id:(int)post_id1
 NSString *objtype =[NSString stringWithFormat:@"%d",objtype1];
 NSString *post_id=[NSString stringWithFormat:@"%d",post_id1];
*/
/*
 *晚9点分享成功加积分 最新接口
 */
+ (instancetype)pm9AddCredit:(int)objtype1 andPost_id:(int)post_id1{
    SRPm9Service* service = [[SRPm9Service alloc]init];
    service.path = kPathOfPm9;
    
    NSString* action = @"addcredit";
    NSString *objtype =[NSString stringWithFormat:@"%d",objtype1];
    NSString *post_id=[NSString stringWithFormat:@"%d",post_id1];
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    
    service.body = SRDictionaryWithVariableBindings(action,objtype,post_id);
    
    return service;
}
@end
