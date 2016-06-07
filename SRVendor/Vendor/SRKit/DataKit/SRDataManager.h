//
//  SRDataManager.h
//  SkinRun
//
//  Created by skin on 6/5/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@class SRWebService;


typedef void(^SRInvokeSuccessBlock)(id response);
typedef void(^SRInvokeFailureBlock)(NSError *error);
typedef id(^SRFilterBlock)(id response);

@interface SRDataManager : NSObject

+ (instancetype)sharedInstance;

/*
 * Must define the property 'delegate' of the service if call this method
 */
- (void)invokeService:(SRWebService*)service ;

/*
 * define the success block and failure block directly
 */
- (void)invokeService:(SRWebService*)service success:(SRInvokeSuccessBlock)success failure:(SRInvokeFailureBlock)failure ;


#pragma mark
#pragma mark -User Token
- (void)setUserToken:(NSString*)value;

- (NSString*)getUserToken;

@end
