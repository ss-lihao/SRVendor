//
//  SRActivityService.m
//  SkinRun
//
//  Created by lxt on 15/6/12.
//  Copyright (c) 2015年 上海商路网络科技有限公司. All rights reserved.
//

#import "SRActivityService.h"
#import "SRKit.h"

@implementation SRActivityService
//声明 WebService 模块路径
NSString* const kPathOfActivity = @"content/post";

/*
 *获取活动或文章列表
 */

+ (instancetype)getActivityContent:(NSString*)type{
    SRActivityService* service = [[SRActivityService alloc]init];
    service.path = kPathOfActivity;
    
    NSString* action = @"getcontent";
    service.body = SRDictionaryWithVariableBindings(action,type);
    
    return service;
}
+ (instancetype)getActivityContentWithType:(NSString*)type page:(int)pageint{
    SRActivityService* service = [[SRActivityService alloc]init];
    service.path = kPathOfActivity;
    
    NSString* action = @"getcontent";
    NSString* page = [NSString stringWithFormat:@"%d", pageint];
    service.body = SRDictionaryWithVariableBindings(action,type,page);
    
    return service;
}

/*
 *获取活动或文章详情
 */
+ (instancetype)getActivityOneContent:(int)idStr{
    SRActivityService* service = [[SRActivityService alloc]init];
    service.path = kPathOfActivity;
    
    NSString* action = @"getonecontent";
    NSString* id = [NSString stringWithFormat:@"%d", idStr];
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    service.body = SRDictionaryWithVariableBindings(action,id);
    
    return service;
}

//获取测试，我的show等详细信息
+ (instancetype)getTestDetail:(int)idNum objectType:(int)objectType uid:(int)uid{
    SRActivityService* service = [[SRActivityService alloc]init];
    service.path = kPathOfActivity;
    
    NSString* action = @"getdetail";
    NSString* idStr = [NSString stringWithFormat:@"%d", idNum];
    NSString* objtypeStr = [NSString stringWithFormat:@"%d", objectType];
    NSString* uidStr = [NSString stringWithFormat:@"%d", uid];
    service.body = SRDictionaryWithVariableBindings(action,idStr,objtypeStr,uidStr);
    
    return service;
}

/*
 *活动分享成功加积分
 */
+ (instancetype)activityAddCredit{
    SRActivityService* service = [[SRActivityService alloc]init];
    service.path = kPathOfActivity;
    
    NSString* action = @"addcredit";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    
    service.body = SRDictionaryWithVariableBindings(action);
    return service;
}

/*
 *分享成功加积分
 */
+ (instancetype)activityAddCredit:(int)objtype1 andPost_id:(int)post_id1{
    SRActivityService* service = [[SRActivityService alloc]init];
    service.path = kPathOfActivity;
    
    NSString* action = @"addcredit";
    NSString *objtype =[NSString stringWithFormat:@"%d",objtype1];
    NSString *post_id=[NSString stringWithFormat:@"%d",post_id1];
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    
    service.body = SRDictionaryWithVariableBindings(action,objtype,post_id);
    return service;
}
//+(instancetype)praiseActivity:(int)objectype postId:(int)postId{
//    SRActivityService* service = [[SRActivityService alloc]init];
//    service.path = kPathOfActivity;
//    
//    NSString* action = @"praise";
//    NSString* objtype = [NSString stringWithFormat:@"%d",objectype];
//    NSString* post_id = [NSString stringWithFormat:@"%d",postId];
//    service.header = [SRWebService encodedAuthorizeTokenInfo ];
//    
//    service.body = SRDictionaryWithVariableBindings(action,objtype,post_id);
//    return service;
//}
//
//+(instancetype)replyActivity:(int)objectype postId:(int)postId parentId:(int)parId content:(NSString*)content image:(NSString*)img{
//    SRActivityService* service = [[SRActivityService alloc]init];
//    service.path = kPathOfActivity;
//    
//    NSString* action = @"reply";
//    NSString* objtype = [NSString stringWithFormat:@"%d",objectype];
//    NSString* post_id = [NSString stringWithFormat:@"%d",postId];
//    NSString* parent_id = [NSString stringWithFormat:@"%d",parId];
//    service.header = [SRWebService encodedAuthorizeTokenInfo ];
//    
//    service.body = SRDictionaryWithVariableBindings(action,objtype,post_id,parent_id,content,img);
//    return service;
//}
//
//+(instancetype)getlistComment:(int)objectype postId:(int)postId page:(int)pagestr{
//    SRActivityService* service = [[SRActivityService alloc]init];
//    service.path = kPathOfActivity;
//    
//    NSString* action = @"getlist";
//    NSString* objtype = [NSString stringWithFormat:@"%d",objectype];
//    NSString* post_id = [NSString stringWithFormat:@"%d",postId];
//    NSString* page = [NSString stringWithFormat:@"%d",pagestr];
//    service.header = [SRWebService encodedAuthorizeTokenInfo ];
//    
//    service.body = SRDictionaryWithVariableBindings(action,objtype,post_id,page);
//    return service;
//}


/*
 *获取美妆志评论
 */
+ (instancetype)getDiaryRemarkList:(int)objtype1 andPost_id:(int)post_id1 Page:(int)pg{
    SRActivityService* service = [[SRActivityService alloc]init];
    service.path = kPathOfActivity;
    
    NSString* action = @"getdiarylist";
    NSString *objtype =[NSString stringWithFormat:@"%d",objtype1];
    NSString *post_id=[NSString stringWithFormat:@"%d",post_id1];
    NSString *page = [NSString stringWithFormat:@"%d",pg];
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    service.body = SRDictionaryWithVariableBindings(action,objtype,post_id,page);
    return service;
}
@end
