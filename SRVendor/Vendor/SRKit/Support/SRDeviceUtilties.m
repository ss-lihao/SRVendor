//
//  SRDeviceUtilties.m
//  SkinRun
//
//  Created by skin on 6/5/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import "SRDeviceUtilties.h"
#import <UIKit/UIKit.h>
#import <AdSupport/AdSupport.h>
#import "SSKeychain.h"

@implementation SRDeviceUtilties


+ (NSString *)getUniqueDeviceIdentifierAsString{

    NSString *appName=[[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey];
    
    NSString *strApplicationUUID = [SSKeychain passwordForService:appName account:@"incoding"];
    if (strApplicationUUID == nil)
    {
        strApplicationUUID  = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        [SSKeychain setPassword:strApplicationUUID forService:appName account:@"incoding"];
    }
    
    return strApplicationUUID;
}


+ (NSString*)getDeviceId{
    
    return [SRDeviceUtilties getUniqueDeviceIdentifierAsString];
    
}
@end
