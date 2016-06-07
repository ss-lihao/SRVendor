//
//  SRProductService.m
//  SkinRun
//
//  Created by icoco7 on 6/6/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import "SRProductService.h"
#import "SRKit.h"

//声明 WebService 模块路径
NSString* const  kPathOfProduct = @"product";
//http://qa.v3.api.skinrun.me/product?client=1&version=3.0


@implementation SRProductService



/*
 * 搜索品牌名称
 */
+ (instancetype)getbrand:(NSString*)keyword {
    SRProductService* service = [[SRProductService alloc]init];
    service.path = kPathOfProduct;
    
    
    NSString* action = @"getbrand";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,keyword);
    
    
    return service;
}

/*
 * 搜索产品名称
 */
+ (instancetype)getProduct:(NSString*)keyword brand_id:(int)brand_id1 catid:(NSInteger)catid1{
    SRProductService* service = [[SRProductService alloc]init];
    service.path = kPathOfProduct;
    
    NSString* action = @"getproduct";
    
    NSString *catid = [NSString stringWithFormat:@"%zi",catid1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    NSDictionary* params = SRDictionaryWithVariableBindings(action,keyword,catid);
    
    NSString *brand_id=[NSString stringWithFormat:@"%d",brand_id1];
    if (brand_id1 > 0) {
        
        params =SRDictionaryWithVariableBindings(action,keyword,brand_id,catid);
    }
    
    service.body = params;
    
    
    return service;
}



/*
 * 添加品牌
 */
+ (instancetype)addbrand :(NSString*)brand_name {
    SRProductService* service = [[SRProductService alloc]init];
    service.path = kPathOfProduct;
    
    NSString* action = @"addbrand";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,brand_name);
    
    
    return service;
}



/*
 * 添加产品
 */
+ (instancetype)addproduct:(NSString*)name bid:(int )bid1 price:(CGFloat)price1{
    SRProductService* service = [[SRProductService alloc]init];
    service.path = kPathOfProduct;
    
    NSString* action = @"addproduct";
    NSString *bid=[NSString stringWithFormat:@"%d",bid1];
    NSString *price=[NSString stringWithFormat:@"%1.f",price1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,name,bid,price);
    
    return service;
}



/*
 * 产品详情详细数据
 */
+ (instancetype)productDetailData:(int)product_id1 page:(int)page1 uid:(int)uid1{
    SRProductService* service = [[SRProductService alloc]init];
    service.path = @"skintest/effect";
    NSString* action = @"getProductlist";
    NSString *product_id=[NSString stringWithFormat:@"%d",product_id1];
    NSString *page=[NSString stringWithFormat:@"%i",page1];
//    NSString *uid = [NSString stringWithFormat:@"%i",uid1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,product_id ,page);
    return service;
}
/*
 * 相关产品
 */
+ (instancetype)productRelation:(int )bid1 page:(int)page1
{
    SRProductService* service = [[SRProductService alloc]init];
    service.path = kPathOfProduct;
    NSString * action = @"brandProduct";
    NSString *bid=[NSString stringWithFormat:@"%d",bid1];
    NSString *page=[NSString stringWithFormat:@"%d",page1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,bid,page);
    return service;
}
/*
 * 品牌页
 */
+ (instancetype)brandPage:(int )bid_1
{
    SRProductService* service = [[SRProductService alloc]init];
    service.path = kPathOfProduct;
    NSString * action = @"brandDetail";
    NSString *bid=[NSString stringWithFormat:@"%d",bid_1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,bid);
    return service;
}
/*
 * 产品详情页
 */
+ (instancetype)homeProductDetailData:(int)product_id1 andPage:(int)page1 {
    SRProductService* service = [[SRProductService alloc]init];
    service.path =kPathOfProduct;
    NSString* action = @"productDetail";
    NSString *id=[NSString stringWithFormat:@"%d",product_id1];
    NSString *page=[NSString stringWithFormat:@"%d",page1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action, id,page);
    return service;
}
@end
