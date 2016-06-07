//
//  SRDataException.m
//  SkinRun
//
//  Created by skin on 6/10/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import "SRDataException.h"

NSString * const SRExceptionDomain = @"com.skinrun.DataKit.ExceptionDomain";

@implementation SRDataException
@synthesize code;

+ (SRDataException *)exceptionWithCode:(int)code name:(NSString *)name reason:(NSString *)reason userInfo:(NSDictionary *)userInfo{
    
    SRDataException* exception = (SRDataException*)[SRDataException exceptionWithName:name reason:reason userInfo:userInfo];
    [exception setCode:code];
    return exception;
}

- (void)setCode:(int)value{
    code = value;
}

- (NSString*)description{
    NSString* result = [super description];
    NSString* msg = [NSString stringWithFormat:@"code=[%d],name=[%@],reason=[%@],userInfo=[%@]", self.code,self.name,self.reason, self.userInfo];
    result =[NSString stringWithFormat:@"%@\n%@",msg, result];
    return  result;
    
}

- (void)dealloc{
    
    NSLog(@"dealloc %@", self);
    
}

@end
