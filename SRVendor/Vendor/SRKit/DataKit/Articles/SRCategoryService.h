//
//  SRCategoryService.h
//  SkinRun
//
//  Created by LiHao on 16/3/14.
//  Copyright © 2016年 上海商路网络科技有限公司. All rights reserved.
//

#import "SRWebService.h"

@interface SRCategoryService : SRWebService
/**
 *  美妆志栏目
 *
 *  @param page1 页码
 *
 *  @return 返回对象
 */
+ (instancetype)getCategoryArray;


/**
 *  美妆志精选
 *
 *  @param articleId 文章id
 *
 *  @return 返回对象
 */
+ (instancetype)getGeneralGalleryById:(int)pg;


/**
 *  美妆志详情
 *
 *  @param articleId 文章id
 *
 *  @return 返回对象
 */
+ (instancetype)getAritcleDetailById:(int)articleId;

/**
 *  栏目详情数据
 *
 *  @param idx  id
 *  @param type type
 *
 *  @return 返回对象
 */
+ (instancetype)getCategorydetailData:(int)idx1 type:(int)type1 page:(int)page1;

/**
 *  获取栏目头
 *
 *  @param idx 栏目id
 *
 *  @return 返回结果
 */
+ (instancetype)getCategorydetailTop:(int)idx;


/**
 *  订阅
 *
 *  @param idx 栏目id
 *
 *  @return 返回结果
 */
+ (instancetype)subScribe:(int)idx;
/**
 *  化妆包专题
 *
 *  @param idx 栏目id
 *
 *  @return 返回结果
 */
+ (instancetype)getBagsubject:(int)idx;
/**
 *  文章专题
 *
 *  @param idx 栏目id
 *
 *  @return 返回结果
 */
+ (instancetype)getArticlesubject:(int)idx;
/**
 *  产品专题
 *
 *  @param idx 栏目id
 *
 *  @return 返回结果
 */
+ (instancetype)getProductsubject:(int)idx;
/**
 *  投票专题
 *
 *  @param idx 栏目id
 *
 *  @return 返回结果
 */
+ (instancetype)getVotesubject:(int)idx;
/**
 *  投票
 *
 *  @param idx 栏目id
 *
 *  @return 返回结果
 */
+ (instancetype)getVote:(int)idx;
@end
