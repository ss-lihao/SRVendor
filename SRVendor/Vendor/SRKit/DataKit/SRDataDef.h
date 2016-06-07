//
//  SRDataDef.h
//  SkinRun
//
//  Created by skin on 6/26/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 @SRContentType 1文章活动 2皮肤测试 3功效测试 4用户动态show 5福利社 6产品详情 7品牌馆 9视频 10化妆包 11众测 12爆料 99商家
 
 */
typedef NS_OPTIONS(NSInteger, SRContentType) {
    SRContentOfArticle          = 1,
    SRContentOfSkinTest         = 2,
    SRContentOfEffectTest       = 3,
    SRContentOfUserActivity     = 4,
    SRContentOfWelfare          = 5,
    SRContentProduct            = 6,
    SRContentBrand              = 7,
    SRContentAttend             = 9,
    SRCosmeticBag               = 10,
    SRContentPublicTest         =11,
    SRContentBroke              =12,
    SRContentOffcial            = 99,
    
    SRContentOfAny          = (SRContentOfArticle |
                               SRContentOfSkinTest |
                               SRContentOfEffectTest |
                               SRContentOfUserActivity |
                               SRContentOfWelfare |SRContentProduct|SRContentBrand|SRCosmeticBag|SRContentAttend)
};

/*
 @function SRStringFromContentType
 */
NSString *SRStringFromContentType(SRContentType type);

SRContentType SRContentTypeFromCodeString(NSString* code);

@interface SRDataDef : NSObject

@end
