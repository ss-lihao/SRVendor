//
//  SRCartService.h
//  SkinRun
//
//  Created by LiHao on 15/10/27.
//  Copyright © 2015年 上海商路网络科技有限公司. All rights reserved.
//

#import "SRWebService.h"

@interface SRCartService : SRWebService

/*
 *加入购物车
 */
+ (instancetype)addCart:(int)type Id:(int)id;

/*
 *购物车列表
 */
+ (instancetype)getCartList;
/*
 *购物车红包列表
 */
+ (instancetype)getCartList:(NSString *)listID;
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
                     smallMoney:(NSString *)small_money
                        packet_id:(NSString*)packet_id
                         remark:(NSString*)remark
                           cart:(NSString*)cart
                        channel:(NSString*)channel;
/*
 *订单产品列表
 */
+ (instancetype)getOrderGoods:(NSString*)order_id;

/**
 获取确认订单红包
 */
+ (instancetype)getConfirmOrderGoods:(NSString*)order_id;

/*
 *重新支付
 */
+ (instancetype)getRepay:(NSString*)order_id
             andIsCredit:(int)is_credit1
               addressID:(int)addressID
              smallMoney:(NSString *)small_money
                 packet_id:(NSString*)packet_id
                  remark:(NSString*)remark
                 channel:(NSString*)channel;
@end
