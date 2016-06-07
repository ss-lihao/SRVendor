//
//  SRWelfareService.m
//  SkinRun
//
//  Created by icoco7 on 6/8/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import "SRWelfareService.h"
#import "SRKit.h"

//声明 WebService 模块路径
NSString* const kPathOfWelfare = @"welfare";

@implementation SRWelfareService

/*
*获取福利社列表
*/
+ (instancetype)getWelfare:(int)pageint type:(int)type1{
    SRWelfareService* service = [[SRWelfareService alloc]init];
    service.path = kPathOfWelfare;
    
    NSString* action = @"index";
    NSString* page = [NSString stringWithFormat:@"%d", pageint];
    NSString * type =[NSString stringWithFormat:@"%d",type1];
    service.body = SRDictionaryWithVariableBindings(action,page,type);
    
    return service;
}

/*
 *获取福利社详情
 */
+ (instancetype)getWelfareDetail:(int)idNum{
    SRWelfareService* service = [[SRWelfareService alloc]init];
    service.path = kPathOfWelfare;
    
    NSString* action = @"detail";
    NSString* id = [NSString stringWithFormat:@"%d", idNum];
    service.body = SRDictionaryWithVariableBindings(action,id);
    
    return service;
}


/*
 *获取往期福利
 */
+ (instancetype)getOldWelfareList:(int)idNum{
    SRWelfareService* service = [[SRWelfareService alloc]init];
    service.path = kPathOfWelfare;
    
    NSString* action = @"gethistory";
    NSString* page = [NSString stringWithFormat:@"%d", idNum];
    service.body = SRDictionaryWithVariableBindings(action,page);
    
    return service;
}


/*
 *获取福利号
 */
+ (instancetype)receiveWelfare:(int)idNum{
    SRWelfareService* service = [[SRWelfareService alloc]init];
    service.path = kPathOfWelfare;
    
    NSString* action = @"receive";
    NSString* id = [NSString stringWithFormat:@"%d", idNum];
    service.header = [SRWebService encodedAuthorizeTokenInfo ];

    service.body = SRDictionaryWithVariableBindings(action,id);
    
    return service;
}

/*
 *分享福利社
 */
+ (instancetype)shareWelfare:(int)idNum{
    SRWelfareService* service = [[SRWelfareService alloc]init];
    service.path = kPathOfWelfare;
    NSString* id = [NSString stringWithFormat:@"%d", idNum];
    NSString* action = @"share";
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    service.body = SRDictionaryWithVariableBindings(action,id);
    
    return service;
}

/*
 *获取中奖列表 [upd param]
 */
+ (instancetype)getWelfarePrizeList:(int)idNum{
    SRWelfareService* service = [[SRWelfareService alloc]init];
    service.path = kPathOfWelfare;
   // NSString* idStr = [NSString stringWithFormat:@"%d", idNum];
    NSString* action = @"prize";
    NSString* id = [NSString stringWithFormat:@"%d", idNum];
    service.body = SRDictionaryWithVariableBindings(action,id);
    
    return service;
}

/*
 *获取与我相关福利社列表
 */
+ (instancetype)getWelfareAboutMe:(int)pageint{
    SRWelfareService* service = [[SRWelfareService alloc]init];
    service.path = kPathOfWelfare;
    NSString* page = [NSString stringWithFormat:@"%d", pageint];
    NSString* action = @"getlist";
    service.header = [SRWebService encodedAuthorizeTokenInfo ];

    service.body = SRDictionaryWithVariableBindings(action,page);
    
    return service;
}

/*
 *获取我的福利号
 */
+ (instancetype)getWelfareCode:(int)idNum{
    SRWelfareService* service = [[SRWelfareService alloc]init];
    service.path = kPathOfWelfare;
    NSString* id = [NSString stringWithFormat:@"%d", idNum];
    NSString* action = @"getwelfarecode";
    service.header = [SRWebService encodedAuthorizeTokenInfo ];

    service.body = SRDictionaryWithVariableBindings(action,id);
    
    return service;
}

/*
 *获取是否显示滚动条
 */
+ (instancetype)isShowHeaderBar{
    SRWelfareService* service = [[SRWelfareService alloc]init];
    service.path = @"publics/util/runtime";
    //    NSString* idStr = [NSString stringWithFormat:@"%d", idNum];
//    NSString* action = @"prize";
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    service.body = nil;//SRDictionaryWithVariableBindings(adid);
    
    return service;

}

/*
 添加再来一次
 */
+ (instancetype)getWelfareAgain:(int)objtype1 andObjid:(int)objid1{
    
    SRWelfareService* service = [[SRWelfareService alloc]init];
    
    service.path = kPathOfWelfare;
    NSString* objid = [NSString stringWithFormat:@"%d", objid1];
    NSString *objtype =[NSString stringWithFormat:@"%d", objtype1];
    NSString* action = @"again";
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    
    service.body = SRDictionaryWithVariableBindings(action,objtype,objid);
    
    return service;
    
    
}

/*
 提醒活动开始
 */
+ (instancetype)getWelfareTimetask:(int)Wid1{
    
    SRWelfareService* service = [[SRWelfareService alloc]init];
    
    service.path = kPathOfWelfare;
    NSString* wid = [NSString stringWithFormat:@"%d", Wid1];
    NSString* action = @"timetask";
    service.header = [SRWebService encodedAuthorizeTokenInfo ];
    
    service.body = SRDictionaryWithVariableBindings(action,wid);
    
    return service;
    
    
}
@end
