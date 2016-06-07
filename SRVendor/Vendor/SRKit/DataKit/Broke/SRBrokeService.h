//
//  SRBrokeService.h
//  SkinRun
//
//  Created by sl on 16/2/24.
//  Copyright (c) 2016年 上海商路网络科技有限公司. All rights reserved.
//

#import "SRWebService.h"

@interface SRBrokeService : SRWebService

/**
 *  获取爆料列表
 *
 *  @param page1 页码
 *
 *  @return 返回对象
 */
+ (instancetype)getlist:(int)page1 andType:(int)type1;

/**
 *  获取我的爆料
 *
 *  @param page1 页码
 *
 *  @return 返回对象
 */
+ (instancetype)getMyRevelation:(int)page1 andType:(int)type1;

/**
 *  上传订单截图
 *
 *  @param image 订单图片 base64
 *  @param id1   爆料ID
 *
 *  @return 返回对象
 */
+ (instancetype)uploadOrderImage:(NSString *)image
                             id1:(int)id1;


/**
 *  抓取网站信息
 *
 *  @param URL 抓取网站的URL
 *
 *  @return 返回对象
 */
+ (instancetype)grabInfo:(NSString *)URL;

/**
 *  提交爆料 【从grabinfo接口中获取】
 *
 *  @param orderpic1 订单截图 base64
 *  @param name      爆料产品名
 *  @param source    爆料产品来源
 *  @param price     爆料产品价格
 *  @param reason    爆料理由
 *  @param buyurl    爆料产品地址
 *  @param imgurl    爆料的产品图片地址
 *
 *  @return 返回对象
 */
+ (instancetype)submitBroke:(NSString *)orderpic1
                      name1:(NSString *)name
                    source1:(NSString *)source
                     price1:(NSString *)price
                    reason1:(NSString *)reason
                    buyurl1:(NSString *)buyurl
                    imgurl1:(NSString *)imgurl;

/**
 *  爆料详情
 *
 *  @param id1 爆料ID
 *
 *  @return 返回对象
 */
+ (instancetype)brokeDetail:(int)id1;
/**
 *  获取我要爆料条件信息
 *
 *
 *  @return 返回对象
 */
+ (instancetype)getRule;

/**
 *  求众测 参与
 *
 *
 *  @return 返回对象
 */
+ (instancetype)join:(int)id1;
/**
 *  删除我的 爆料
 *
 *
 *  @return 返回对象
 */
+ (instancetype)getDelrevelation:(int)id1;

@end
