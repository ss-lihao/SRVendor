//
//  SRCategoryService.m
//  SkinRun
//
//  Created by LiHao on 16/3/14.
//  Copyright © 2016年 上海商路网络科技有限公司. All rights reserved.
//

#import "SRCategoryService.h"
//声明 WebService 模块路径
NSString* const kPathOfCategory = @"content/diary";

@implementation SRCategoryService

/**
 *  美妆志栏目
 *
 *  @param page1 页码
 *
 *  @return 返回对象
 */
+ (instancetype)getCategoryArray{
    SRCategoryService *service = [[SRCategoryService alloc] init];
    service.path = kPathOfCategory;
    NSString* action = @"category";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action);
    return service;
}

/**
 *  美妆志精选
 *
 *  @param articleId 文章id
 *
 *  @return 返回对象
 */
+ (instancetype)getGeneralGalleryById:(int)pg{
    SRCategoryService *service = [[SRCategoryService alloc] init];
    service.path = kPathOfCategory;
    NSString* action = @"index";
    NSString *page = [NSString stringWithFormat:@"%d",pg];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,page);
    return service;
}

/**
 *  美妆志详情
 *
 *  @param articleId 文章id
 *
 *  @return 返回对象
 */
+ (instancetype)getAritcleDetailById:(int)articleId{
    SRCategoryService *service = [[SRCategoryService alloc] init];
    service.path = kPathOfCategory;
    NSString* action = @"articledetail";
    NSString *id = [NSString stringWithFormat:@"%d",articleId];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,id);
    return service;
}

//articledetail
/**
 *  栏目详情数据
 *
 *  @param idx  id
 *  @param type type
 *
 *  @return 返回对象
 */
+ (instancetype)getCategorydetailData:(int)idx type:(int)type1 page:(int)page1{
    SRCategoryService *service = [[SRCategoryService alloc] init];
    service.path = kPathOfCategory;
    NSString* action = @"categorydata";
    NSString *id = [NSString stringWithFormat:@"%d",idx];
    NSString *type = [NSString stringWithFormat:@"%d",type1];
    NSString *page = [NSString stringWithFormat:@"%d",page1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,id,type,page);
    return service;
    
}

/**
 *  获取栏目头
 *
 *  @param idx 栏目id
 *
 *  @return 返回结果
 */
+ (instancetype)getCategorydetailTop:(int)idx{
    
    SRCategoryService *service = [[SRCategoryService alloc] init];
    service.path = kPathOfCategory;
    NSString* action = @"categorydetail";
    NSString *id = [NSString stringWithFormat:@"%d",idx];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,id);
    return service;
    
}
/**
 *  订阅
 *
 *  @param idx 栏目id
 *
 *  @return 返回结果
 */
+ (instancetype)subScribe:(int)idx{
    SRCategoryService *service = [[SRCategoryService alloc] init];
    service.path = kPathOfCategory;
    NSString* action = @"subscribe";
    NSString *id = [NSString stringWithFormat:@"%d",idx];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,id);
    return service;
    
}
/**
 *  化妆包专题
 *
 *  @param idx 栏目id
 *
 *  @return 返回结果
 */
+ (instancetype)getBagsubject:(int)idx{
    SRCategoryService *service = [[SRCategoryService alloc] init];
    service.path = kPathOfCategory;
    NSString* action = @"bagsubject";
    NSString *id = [NSString stringWithFormat:@"%d",idx];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,id);
    return service;
    
}
/**
 *  文章专题
 *
 *  @param idx 栏目id
 *
 *  @return 返回结果
 */
+ (instancetype)getArticlesubject:(int)idx{
    SRCategoryService *service = [[SRCategoryService alloc] init];
    service.path = kPathOfCategory;
    NSString* action = @"articlesubject";
    NSString *id = [NSString stringWithFormat:@"%d",idx];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,id);
    return service;
    
}
/**
 *  产品专题
 *
 *  @param idx 栏目id
 *
 *  @return 返回结果
 */
+ (instancetype)getProductsubject:(int)idx{
    SRCategoryService *service = [[SRCategoryService alloc] init];
    service.path = kPathOfCategory;
    NSString* action = @"productsubject";
    NSString *id = [NSString stringWithFormat:@"%d",idx];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,id);
    return service;
    
}
/**
 *  投票专题
 *
 *  @param idx 栏目id
 *
 *  @return 返回结果
 */
+ (instancetype)getVotesubject:(int)idx{
    SRCategoryService *service = [[SRCategoryService alloc] init];
    service.path = kPathOfCategory;
    NSString* action = @"votesubject";
    NSString *id = [NSString stringWithFormat:@"%d",idx];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,id);
    return service;
    
}
/**
 *  投票
 *
 *  @param idx 栏目id
 *
 *  @return 返回结果
 */
+ (instancetype)getVote:(int)idx{
    SRCategoryService *service = [[SRCategoryService alloc] init];
    service.path = kPathOfCategory;
    NSString* action = @"vote";
    NSString *id = [NSString stringWithFormat:@"%d",idx];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,id);
    return service;
    
}
@end
