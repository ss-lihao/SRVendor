//
//  NSDictionary+SRHelper.h
//  SkinRun
//
//  Created by icoco7 on 6/7/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SRHelper)

- (NSString *) stringValueForPath:(NSString *)path;

- (NSString *) stringValueForPath:(NSString *)path defaultValue:(NSString *)defaultValue;

- (NSArray *) arrayValueForPath:(NSString *)path;

- (NSArray *) arrayValueForPath:(NSString *)path defaultValue:(NSArray *)defaultValue;

- (NSObject *) objectValueForPath:(NSString *)path;

- (NSObject *) objectValueForPath:(NSString *)path defaultValue:(NSObject *)defaultValue;

@end
