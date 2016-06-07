//
//  SRContentService.h
//  SkinRun
//
//  Created by 肌肤管家 on 15/6/9.
//  Copyright (c) 2015年 上海商路网络科技有限公司. All rights reserved.
//

#import "SRWebService.h"


@interface SRContentService : SRWebService



/*
 * 发布信息
 */
+ (instancetype)send:(int)brandid brand_name:(NSString*)brand_name goodid:(int)goodid  product_name:(NSString*)product_name price:(CGFloat)price1 img:(NSString*)img content:(NSString*)content;

/*
 * 回复／评论 新的
 */
+ (instancetype)reply:(int)objtype1 post_id:(int)post_id1 parent_id:(int)parent_id1 content:(NSString*)content andUid1:(int)uid1 andImg:(NSString *)img;
//老的
+ (instancetype)reply:(int)objtype1 post_id:(int)post_id1 parent_id:(int)parent_id1 content:(NSString*)content image:(NSString*)img;

/*
 * 获取回复／评论列表
 */
+ (instancetype)getList:(int)objtype1 post_id:(int)post_id1 page:(int)pageIndex;

/*
 * 对主题进行点赞
 */
+ (instancetype)praise:(int)objtype1 post_id:(int)post_id1;
/*
 *  肌肤测试专用对主题进行点赞
 */
+ (instancetype)praise:(int)objtype1 post_id:(int)post_id1 andUid:(int)uid1;

/*
 * 获取我／他发布的show
 */
+ (instancetype)getMyShow:(int)uid1 page:(int)page1;

/*
 * 添加收藏
 */
+ (instancetype)addFavorite:(int)objtype1 post_id:(int)post_id1;

/*
 * 获取我的收藏列表
 */
+ (instancetype)getMyFavorite:(int)page1;

+ (instancetype)getMyFavorite:(int)page1 type:(int)type1;

/*
 * 删除我的收藏
 */
+ (instancetype)deleteFavorite:(int)id1;

/*
 * 获取活动或文章列表
 */
+ (instancetype)getContent:(NSString*)type;

/*
 * 获取活动或文章详情
 */
+ (instancetype)getOneContent:(int)contentId;

/*
 * 获取测试，我的show，等详细信息
 * 1文章活动 2皮肤测试 3功效测试 4用户动态 5福利社
 */
+ (instancetype)getDetail:(int)id1 objtype:(int)objtype1 andUid:(int)uid1;

/*
 * 删除自己发布的show
 */
+ (instancetype)deleteShow:(int)id1 objType:(int)objtype1;

+ (instancetype)getMyShow:(int)uid1 page:(int)page1 info_center_type:(int)info_center_type1;

@end
