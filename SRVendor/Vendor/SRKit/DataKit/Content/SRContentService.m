//
//  SRContentService.m
//  SkinRun
//
//  Created by 肌肤管家 on 15/6/9.
//  Copyright (c) 2015年 上海商路网络科技有限公司. All rights reserved.
//

#import "SRContentService.h"
#import "SRKit.h"

//声明 WebService 模块路径
NSString* const  kPathOfContent = @"content/post";
//http://qa.v3.api.skinrun.me/content/post?client=1&version=3.0


@implementation SRContentService

/*
 * 发布信息
 */
+ (instancetype)send:(int)brandid brand_name:(NSString*)brand_name goodid:(int)goodid  product_name:(NSString*)product_name price:(CGFloat)price1 img:(NSString*)img content:(NSString*)content
{
    SRContentService* service = [[SRContentService alloc]init];
    service.path = kPathOfContent;
    
    NSString* action = @"send";
    
    NSString* brand_id=[NSString stringWithFormat:@"%d",brandid];
    
    
    NSString* product_id =[NSString stringWithFormat:@"%d",goodid];
    NSString* price  =[NSString stringWithFormat:@"%f",price1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
   // NSLog(@"%@=======%@", brand_name,product_name);
    if (brandid<1&&goodid<1) {
        
        
        service.body = SRDictionaryWithVariableBindings(action,brand_name,product_name,price,img,content);
    }else if (goodid<1){
        service.body = SRDictionaryWithVariableBindings(action,brand_id,product_name,price,img,content);
    }else
    {
        service.body = SRDictionaryWithVariableBindings(action,brand_id,product_id,price,img,content);
    }
    
    return service;
}

/*
 * 回复／评论
 */

+ (instancetype)reply:(int)objtype1 post_id:(int)post_id1 parent_id:(int)parent_id1 content:(NSString*)content andUid1:(int)uid1 andImg:(NSString *)img
{
    SRContentService* service = [[SRContentService alloc]init];
    service.path = kPathOfContent;
    
    NSString* action = @"reply";
    
    NSString* objtype =[NSString stringWithFormat:@"%d",objtype1];
    NSString* post_id =[NSString stringWithFormat:@"%d",post_id1];
    NSString* parent_id  =[NSString stringWithFormat:@"%d",parent_id1];
    NSString* uid  =[NSString stringWithFormat:@"%d",uid1];

    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,objtype,post_id,parent_id,content,uid,img);
    
    
    return service;
}

+ (instancetype)reply:(int)objtype1 post_id:(int)post_id1 parent_id:(int)parent_id1 content:(NSString*)content image:(NSString*)img
{
    SRContentService* service = [[SRContentService alloc]init];
    service.path = kPathOfContent;
    
    NSString* action = @"reply";
    
    NSString* objtype =[NSString stringWithFormat:@"%d",objtype1];
    NSString* post_id =[NSString stringWithFormat:@"%d",post_id1];
    NSString* parent_id  =[NSString stringWithFormat:@"%d",parent_id1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,objtype,post_id,parent_id,content, img);
    
    
    return service;
}


/*
 * 获取回复／评论列表
 */
+ (instancetype)getList:(int)objtype1 post_id:(int)post_id1 page:(int)pageIndex
{
    SRContentService* service = [[SRContentService alloc]init];
    service.path = kPathOfContent;
    
    NSString* action = @"getlist";
    
    NSString* objtype =[NSString stringWithFormat:@"%d",objtype1];
    NSString* post_id =[NSString stringWithFormat:@"%d",post_id1];
    NSNumber* page = [NSNumber numberWithInt:pageIndex];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,objtype,post_id,page);
    
    return service;
}

/*
 * 对主题进行点赞
 */
+ (instancetype)praise:(int)objtype1 post_id:(int)post_id1
{
    SRContentService* service = [[SRContentService alloc]init];
    service.path = kPathOfContent;
    
    NSString* action = @"praise";
    
    
    NSString* objtype =[NSString stringWithFormat:@"%d",objtype1];
    NSString* post_id =[NSString stringWithFormat:@"%d",post_id1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,objtype,post_id);
    
    return service;
}
/*
 * 对主题进行点赞
 */
+ (instancetype)praise:(int)objtype1 post_id:(int)post_id1 andUid:(int)uid1
{
    SRContentService* service = [[SRContentService alloc]init];
    service.path = kPathOfContent;
    
    NSString* action = @"praise";
    
    
    NSString* objtype =[NSString stringWithFormat:@"%d",objtype1];
    NSString* post_id =[NSString stringWithFormat:@"%d",post_id1];
    NSString *uid =[NSString stringWithFormat:@"%d",uid1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,objtype,post_id,uid);
    
    return service;
}
/*
 * 获取我／他发布的show
 */
+ (instancetype)getMyShow:(int)uid1 page:(int)page1
{
    SRContentService* service = [[SRContentService alloc]init];
    service.path = @"content/";
    
    NSString* action = @"getmyshow";
    
    NSString* uid =[NSString stringWithFormat:@"%d",uid1];
    NSString* page =[NSString stringWithFormat:@"%d",page1];
 
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,uid,page);
    
    return service;
}

/*
 * 获取个人主页 已经包含了功效测试和show的数据
 *
 * info_center_type = 1 是标识个人主页的
 */
+ (instancetype)getMyShow:(int)uid1 page:(int)page1 info_center_type:(int)info_center_type1
{
    SRContentService* service = [[SRContentService alloc]init];
    service.path = @"content/";
    
    NSString* action = @"getmyshow";
    
    NSString* uid =[NSString stringWithFormat:@"%d",uid1];
    NSString* page =[NSString stringWithFormat:@"%d",page1];
    NSString* info_center_type = [NSString stringWithFormat:@"%d",info_center_type1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,uid,page,info_center_type);
    return service;
}

/*
 * 添加收藏
 */
+ (instancetype)addFavorite:(int)objtype1 post_id:(int)post_id1
{
    SRContentService* service = [[SRContentService alloc]init];
    service.path = @"member/favorite";
    
    NSString* action = @"addfavorite";
    

    NSString* objtype =[NSString stringWithFormat:@"%d",objtype1];
    NSString* post_id =[NSString stringWithFormat:@"%d",post_id1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,objtype,post_id);
    
    return service;
}


/*
 * 获取我的收藏列表
 */
+ (instancetype)getMyFavorite:(int)page1
{
    SRContentService* service = [[SRContentService alloc]init];
    service.path = @"member/favorite";
    
    NSString* action = @"getmyfavorite";
   
    NSString* page =[NSString stringWithFormat:@"%d",page1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,page);
    
    return service;
}

/**
 *  获取我的收藏3.1
 *
 *  @param page1 页
 *  @param type1 类型
 *
 *  @return 返回对象
 */
+ (instancetype)getMyFavorite:(int)page1 type:(int)type1{

    SRContentService* service = [[SRContentService alloc]init];
    service.path = @"member/favorite";
    
    NSString* action = @"getmyfavorite";
    
    NSString * page = [NSString stringWithFormat:@"%d",page1];
    NSString * type = [NSString stringWithFormat:@"%d",type1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,page,type);
    
    return service;
    
}

/*
 * 删除我的收藏
 */
+ (instancetype)deleteFavorite:(int)id1
{
    SRContentService* service = [[SRContentService alloc]init];
    service.path = @"member/favorite";
    
    NSString* action = @"deletefavorite";
    
    NSString* deleteId =[NSString stringWithFormat:@"%d",id1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = [NSDictionary dictionaryWithObjectsAndKeys:action,@"action",deleteId, @"id",
                    nil];
    
    return service;
}

/*
 * 获取活动或文章列表
 */
+ (instancetype)getContent:(NSString*)type
{
    SRContentService* service = [[SRContentService alloc]init];
    service.path = kPathOfContent;
    
    NSString* action = @"getcontent";
    
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,type);
    
    return service;
}

/*
 * 获取活动或文章详情
 */
+ (instancetype)getOneContent:(int)contentId
{
    SRContentService* service = [[SRContentService alloc]init];
    service.path = kPathOfContent;
    
    NSString* action = @"getonecontent";
    NSString* str =[NSString stringWithFormat:@"%d",contentId];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = [NSDictionary dictionaryWithObjectsAndKeys:action,@"action",str, @"id", nil];
    
    return service;
}


/*
 * 获取测试，我的show，等详细信息
 * 1文章活动 2皮肤测试 3功效测试 4用户动态 5福利社
 */
+ (instancetype)getDetail:(int)id1 objtype:(int)objtype1 andUid:(int)uid1
{
    SRContentService* service = [[SRContentService alloc]init];
    service.path = kPathOfContent;
    
    NSString* action = @"getdetail";
    NSString* id=[NSString stringWithFormat:@"%d",id1];
    NSString* objtype=[NSString stringWithFormat:@"%d",objtype1];
    NSString *uid =[NSString stringWithFormat:@"%d",uid1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,id,objtype,uid);
    
    return service;
}


/*
 * 删除自己发布的show
 */
+ (instancetype)deleteShow:(int)id1 objType:(int)objtype1
{
    SRContentService* service = [[SRContentService alloc]init];
    service.path = kPathOfContent;
    
    NSString* action = @"deleteshow";
    NSString* id=[NSString stringWithFormat:@"%d",id1];
    NSString* objtype=[NSString stringWithFormat:@"%d",objtype1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,id,objtype);
    
    return service;
}
@end
