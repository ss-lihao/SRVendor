//
//  SRDataDef.m
//  SkinRun
//
//  Created by skin on 6/26/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import "SRDataDef.h"


NSString *SRStringFromContentType(SRContentType type)
{
    switch (type) {
        case SRContentOfArticle:      return @"文章活动";
        case SRContentOfSkinTest:     return @"皮肤测试";
        case SRContentOfEffectTest:   return @"功效测试";
        case SRContentOfUserActivity: return @"用户动态";
        case SRContentOfWelfare:      return @"福利社";
        case SRCosmeticBag:          return @"化妆包";
        case SRContentOfAny:          return @"未定义";
            
        default:                     break;
    }
    return nil;
}

SRContentType SRContentTypeFromCodeString(NSString* code){
    int i = [code intValue];
    switch (i) {
        case SRContentOfArticle:   return SRContentOfArticle;
        case SRContentOfSkinTest:     return SRContentOfSkinTest;
        case SRContentOfEffectTest:   return SRContentOfEffectTest;
        case SRContentOfUserActivity: return SRContentOfUserActivity;
        case SRContentOfWelfare:      return SRContentOfWelfare;
        case SRContentAttend:         return SRContentAttend;
        case SRCosmeticBag:          return SRCosmeticBag;
        case SRContentPublicTest:      return SRContentPublicTest;
        case SRContentOfAny:          return SRContentOfAny;

        default:                     break;
    }
    return SRContentOfAny;
}

@implementation SRDataDef

@end
