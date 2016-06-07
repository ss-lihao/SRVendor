//
//  SRProductService.h
//  SkinRun
//
//  Created by icoco7 on 6/6/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import "SRWebService.h"

@interface SRProductService : SRWebService

/*
 * 搜索品牌名称
 */
+ (instancetype)getbrand:(NSString*)keyword;

/*
 * 搜索产品名称
 */
+ (instancetype)getProduct:(NSString*)keyword brand_id:(int)brand_id1 catid:(NSInteger)catid1;

/*
 * 添加品牌
 */
+ (instancetype)addbrand :(NSString*)brand_name;

/*
 * 添加产品
 */
+ (instancetype)addproduct:(NSString*)name bid:(int)bid price:(CGFloat)price1;



/*
 * 产品详情详细数据
 */
+ (instancetype)productDetailData:(int)product_id1 page:(int)page1 uid:(int)uid1;
/*
 * 相关产品
 */
+ (instancetype)productRelation:(int )bid1 page:(int)page1;
/*
 * 品牌页
 */
+ (instancetype)brandPage:(int )bid_1;
/**
 * 产品详情页
 */
+ (instancetype)homeProductDetailData:(int)product_id1 andPage:(int)page1;
@end
