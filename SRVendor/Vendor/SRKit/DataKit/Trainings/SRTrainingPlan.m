//
//  SRTrainingPlan.m
//  SkinRun
//
//  Created by 肌肤管家 on 15/9/23.
//  Copyright (c) 2015年 上海商路网络科技有限公司. All rights reserved.
//

#import "SRTrainingPlan.h"
#import "SRKit.h"


//声明 WebService 模块路径
NSString* const kPathOfTraining = @"train";
@implementation SRTrainingPlan
/*
 *获取训练列表
 */
+ (instancetype)getTraining:(int)type1 page:(int)page1{
    SRTrainingPlan* service = [[SRTrainingPlan alloc]init];
    service.path = kPathOfTraining;
    
    NSString* action = @"base";
    NSString* page = [NSString stringWithFormat:@"%d", page1];
    NSString * type =[NSString stringWithFormat:@"%d",type1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    service.body = SRDictionaryWithVariableBindings(action,page,type);
    
    return service;
}

/*
 *获取训练列表
 */
+ (instancetype)getTraining{
    SRTrainingPlan* service = [[SRTrainingPlan alloc]init];
    service.path = kPathOfTraining;
    
    NSString* action = @"base";
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    service.body = SRDictionaryWithVariableBindings(action);
    return service;
}

/*
 *训练计划列表
 */
+ (instancetype)getTraining:(int)tid1{
    SRTrainingPlan* service = [[SRTrainingPlan alloc]init];
    service.path = kPathOfTraining;
    
    NSString* action = @"days";
    NSString * tid =[NSString stringWithFormat:@"%d",tid1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    service.body = SRDictionaryWithVariableBindings(action,tid);
    
    return service;
}

/*
 *获取训练计划详情
 */
+ (instancetype)getTrainingTid:(int)tid1{
    SRTrainingPlan* service = [[SRTrainingPlan alloc]init];
    service.path = kPathOfTraining;
    
    NSString* action = @"daysDetails";
    NSString * tid =[NSString stringWithFormat:@"%d",tid1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,tid);
    
    return service;
}
/*
 *设置用户训练记录
 tid1===训练ID
 did1===训练计划ID
 vid1===训练动作ID
 day_number1===训练第几天
 is_lastvideo1===是否最后一个视频
 is_lastday1===是否最后一天
 */
+ (instancetype)getTraining:(int)tid1 andDid:(int)did1 andVid:(int)vid1 andDay_number:(int)day_number1 andIs_lastvideo:(int)is_lastvideo1 andIs_lastday:(int)is_lastday1{
    SRTrainingPlan* service = [[SRTrainingPlan alloc]init];
    service.path = kPathOfTraining;
    
    NSString* action = @"videoDetails";
    NSString * tid =[NSString stringWithFormat:@"%d",tid1];
    NSString * did =[NSString stringWithFormat:@"%d",did1];
    NSString * vid =[NSString stringWithFormat:@"%d",vid1];
    NSString * day_number =[NSString stringWithFormat:@"%d",day_number1];
    NSString * is_lastvideo =[NSString stringWithFormat:@"%d",is_lastvideo1];
    NSString * is_lastday =[NSString stringWithFormat:@"%d",is_lastday1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    service.body = SRDictionaryWithVariableBindings(action,tid,did,vid,day_number,is_lastday,is_lastvideo);
    
    return service;
}

/*
 *训练参与人员
 */
+ (instancetype)getJoinList:(int)tid1 andPabg:(int)page1{
    SRTrainingPlan* service = [[SRTrainingPlan alloc]init];
    service.path = kPathOfTraining;
    
    NSString* action = @"joinList";
    NSString * tid =[NSString stringWithFormat:@"%d",tid1];
    NSString *page =[NSString stringWithFormat:@"%d",page1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    service.body = SRDictionaryWithVariableBindings(action,tid,page);
    
    return service;
}

///*
// *设置训练参与人数
// */
//+ (instancetype)getJoinCount:(int)tid1 {
//    SRTrainingPlan* service = [[SRTrainingPlan alloc]init];
//    service.path = kPathOfTraining;
//    
//    NSString* action = @"joinCount";
//    NSString * tid =[NSString stringWithFormat:@"%d",tid1];
//
//    
//    service.header = [SRWebService encodedAuthorizeTokenInfo ];
//    service.body = SRDictionaryWithVariableBindings(action,tid);
//    
//    return service;
//}
/*
 *设置用户训练记录
 */
+ (instancetype)getVideoDetails:(NSString*)tid did:(NSString*)did vid:(NSString*)vid day_number:(NSString*)day_number is_lastvideo:(NSString*)is_lastvideo is_lastday:(NSString*)is_lastday{
    SRTrainingPlan* service = [[SRTrainingPlan alloc]init];
    service.path = kPathOfTraining;
    
    NSString* action = @"videoDetails";
//    NSString * tid =[NSString stringWithFormat:@"%d",tid1];
//     NSString * did =[NSString stringWithFormat:@"%d",did1];
//     NSString * vid =[NSString stringWithFormat:@"%d",vid1];
//     NSString * day_number =[NSString stringWithFormat:@"%d",day_number1];
//     NSString * is_lastvideo =[NSString stringWithFormat:@"%d",is_lastvideo1];
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    service.body = SRDictionaryWithVariableBindings(action,tid,did,vid,day_number,is_lastvideo,is_lastday);
    
    return service;
}
/*
 * 训练 show
 */
+ (instancetype)getShowTrain:(NSString*)img andContent:(NSString*)content andObjid:(int)objid1{
    SRTrainingPlan* service = [[SRTrainingPlan alloc]init];
    service.path = kPathOfTraining;

    NSString* action = @"showTrain";


    NSString *objid =[NSString stringWithFormat:@"%d",objid1];
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    service.body = SRDictionaryWithVariableBindings(action,img,content,objid);

    return service;
}
@end
