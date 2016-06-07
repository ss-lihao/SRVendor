//
//  SRCartService.m
//  SkinRun
//
//  Created by LiHao on 15/10/27.
//  Copyright © 2015年 上海商路网络科技有限公司. All rights reserved.
//

#import "SRCartService.h"

//声明 WebService 模块路径
NSString* const kPathOfCart = @"cart";

@implementation SRCartService

/*
 *添加到购物车
 */
+ (instancetype)addCart:(int)type Id:(int)id{
    SRCartService* service = [[SRCartService alloc]init];
    service.path = kPathOfCart;
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString* action = @"addcart";
    NSString* obj_type = [NSString stringWithFormat:@"%d", type];
    NSString * obj_id =[NSString stringWithFormat:@"%d",id];
    service.body = SRDictionaryWithVariableBindings(action,obj_type,obj_id);
    
    return service;
}

/*
 *购物车列表
 */
+ (instancetype)getCartList{
    SRCartService* service = [[SRCartService alloc]init];
    service.path = kPathOfCart;
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString* action = @"getcartlist";
    service.body = SRDictionaryWithVariableBindings(action);
    
    return service;
}

/*
 *购物车红包列表
 */
+ (instancetype)getCartList:(NSString *)listID{
    SRCartService* service = [[SRCartService alloc]init];
    service.path = kPathOfCart;
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString* action = @"getcartlist";
    NSString *type = [NSString stringWithFormat:@"%d",2];
    NSString *id = listID;
    service.body = SRDictionaryWithVariableBindings(action,type,id);
    
    return service;
}
/**
 *  提交支付
 *
 *  @param is_credit1 是否使用金币支付(1:是;0 否)
 *  @param addressID  收货地址 ID
 *  @param cart       [{"cart_id":"1","goods_count":"3"},{"cart_id":"2","goods_count":" 2"}]
 *  @param channel    支付类型
 *
 *  @return 返回结果
 */
+ (instancetype)getVerifyCart:(int)is_credit1
                    addressID:(int)addressID
                   smallMoney:(NSString*)small_money
                    packet_id:(NSString*)packet_id
                       remark:(NSString*)remark
                         cart:(NSString*)cart
                      channel:(NSString*)channel{
    SRCartService* service = [[SRCartService alloc]init];
    service.path = kPathOfCart;
    NSString* action = @"getverifycart";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString * is_credit =[NSString stringWithFormat:@"%d",is_credit1];
    NSString * address_id =[NSString stringWithFormat:@"%d",addressID];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,is_credit,address_id,small_money,remark,packet_id,cart,channel);
    
    return service;
    

}
/*
 *订单产品列表
 */
+ (instancetype)getOrderGoods:(NSString*)order_id{
    SRCartService* service = [[SRCartService alloc]init];
    service.path = kPathOfCart;
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString* action = @"ordergoods";
    //NSString* type = @"2";
    service.body = SRDictionaryWithVariableBindings(action,order_id);
    
    return service;
}


/*
 *订单产品列表
 */
+ (instancetype)getConfirmOrderGoods:(NSString*)order_id{
    SRCartService* service = [[SRCartService alloc]init];
    service.path = kPathOfCart;
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString* action = @"ordergoods";
    NSString* type = @"2";
    service.body = SRDictionaryWithVariableBindings(action,type,order_id);
    
    return service;
}


/*
 *重新支付
 */
+ (instancetype)getRepay:(NSString*)order_id
             andIsCredit:(int)is_credit1
               addressID:(int)addressID
              smallMoney:(NSString *)small_money
                packet_id:(NSString*)packet_id
                  remark:(NSString*)remark
                 channel:(NSString*)channel{
    SRCartService* service = [[SRCartService alloc]init];
    service.path = kPathOfCart;
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString* action = @"repay";
    NSString * address_id =[NSString stringWithFormat:@"%d",addressID];
    NSString * is_credit =[NSString stringWithFormat:@"%d",is_credit1];
    service.body = SRDictionaryWithVariableBindings(action,order_id,is_credit,packet_id,remark,small_money,channel,address_id);
    
    return service;
}
@end
