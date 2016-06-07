//
//  SRDataException.h
//  SkinRun
//
//  Created by skin on 6/10/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const SRExceptionDomain;


@interface SRDataException : NSException{
@private
    int		 code;

}
@property (readonly, assign) int  code;


+ (SRDataException *)exceptionWithCode:(int)code name:(NSString *)name reason:(NSString *)reason userInfo:(NSDictionary *)userInfo;

@end
