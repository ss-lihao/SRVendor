//
//  SRWebService.h
//  SkinRun
//
//  Created by skin on 6/5/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "SRDataManager.h"
@class SRWebService;

@protocol SRServiceDelegate <NSObject>

@required
- (void)onSuccess:(SRWebService*)sender response:(id)response;
@required
- (void)onFailure:(SRWebService*)sender error:(id)error;

@end

@interface SRWebService : NSObject

// Service Id 区分不同业务接口
@property(nonatomic,readonly)NSString* serviceId;
@property(nonatomic,strong)NSString* path;
@property(nonatomic,strong)NSDictionary* header;
@property(nonatomic,strong)NSDictionary* body;

@property(nonatomic,copy)id(^successFilter)(id response);

@property(nonatomic,weak)id<SRServiceDelegate> delegate;

- (NSString*)getUrl;

/*
 * base64 编码
 * Header 中的参数 Authorization 的值为 Base base64_encode(用户名:密码:appid)
 */
+ (NSDictionary*)encodeAuthorizeLoginInfo:(NSString*)user password:(NSString*)password;

/*
 *   
 *  Header 参数 Authorization= Token 8f8d957b60de3401e44821553b978107
 */
+ (NSDictionary*)encodeAuthorizeTokenInfo:(NSString*)token;

+ (NSDictionary*)encodedAuthorizeTokenInfo;


+ (BOOL)isSuccessOperation:(NSDictionary*)response;

+ (NSException *)dataExceptionWithResponse:(NSDictionary*)response;


/*
 * should set the delegate or else can not got response
 */
- (void)execute;

/*
 * set the success block and failure block directly
 */
- (void)execute:(SRInvokeSuccessBlock)success failure:(SRInvokeFailureBlock)failure ;
@end
