//
//  SRDataManager.m
//  SkinRun
//
//  Created by skin on 6/5/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import "SRDataManager.h"
#import "AFURLRequestSerialization.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "AppResource.h"
#import "SRWebService.h"

NSString *const kRSAuthorizedToekn =@"RSAuthorizedToekn";

@interface SRDataManager ()
{
    AFHTTPRequestOperationManager * _operator;
    
    NSString* _token;
}
@end

@implementation SRDataManager

+ (instancetype)sharedInstance {
    static SRDataManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[self alloc] init];
        
        [_instance setupWorkspace];
        
        NSLog(@"create:%@",_instance);
    });
    
    return _instance;
}

- (AFHTTPRequestOperationManager*) getRequestOperator{
    if (nil == _operator) {
        _operator = [AFHTTPRequestOperationManager manager];
    }
    return _operator;
}

- (void)setupJsonMode:(AFHTTPRequestOperationManager*) operator{
    operator.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    operator.requestSerializer = [AFJSONRequestSerializer serializer];
    
    operator.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operator.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Accept"];
    
    [operator.requestSerializer setValue:@"application/json; charset=utf-8"forHTTPHeaderField:@"Content-Type"];
}

- (void)setupWorkspace{
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    [self setupJsonMode:[self getRequestOperator]];
}


- (void)setHeader:(AFHTTPRequestOperationManager*)operator header:(NSDictionary*)header{
    if (nil == header) {
        return;
    }
    [header enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [operator.requestSerializer setValue:obj forHTTPHeaderField:key];
    }];
}



- (void)post:(NSString*)url  params:(NSDictionary*)params  success:(SRInvokeSuccessBlock)success successFilter:(SRFilterBlock)successFilter failure:(SRInvokeFailureBlock)failure {
    
    NSLog(@"url:%@, param:%@",url, params);
     
    [_operator POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"success->operation:[%@],\n JSON:[%@]", operation, responseObject);
        NSException* exception = [SRWebService dataExceptionWithResponse:responseObject];
        
        if (nil != exception) {
            //@step
            responseObject = exception;
        }
        
        if (successFilter) {
            NSLog(@"successFilter->before JSON: %@", responseObject);
            responseObject = successFilter(responseObject);
            NSLog(@"successFilter->done JSON: %@", responseObject);
        }
        
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure->operation:[%@],\n error:[%@]", operation, error);
        
        failure( error);
    }];
    
    
}

- (void)setRequestHeader:(NSDictionary*)header{
    [self setHeader:_operator header:header];
}
- (NSString *)encodeToPercentEscapeString: (NSString *) input
{
    // Encode all the reserved characters, per RFC 3986
    // (<http://www.ietf.org/rfc/rfc3986.txt>)
    NSString *outputStr = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            (CFStringRef)input,
                                            NULL,
                                            (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                            kCFStringEncodingUTF8));
    return outputStr;
}
- (void)post:(NSString*)url  params:(NSDictionary*)params header:(NSDictionary*)header success:(SRInvokeSuccessBlock)success successFilter:(SRFilterBlock)successFilter failure:(SRInvokeFailureBlock)failure {
    if (nil != header) {
        [self setHeader:_operator header:header];
        NSLog(@"header:[%@]",header);
    }
    
    //@step
    [self post:url params:params  success:success  successFilter:successFilter failure:failure];
}


#pragma mark
#pragma mark -invokeService
- (void)invokeService:(SRWebService*)service{
    [self invokeService:service success:^(id response) {
        if (service.delegate && [service.delegate respondsToSelector:@selector(onSuccess:response:) ]){
            [service.delegate onSuccess:service response:response];
        }
    } failure:^(NSError *error) {
        if (service.delegate && [service.delegate respondsToSelector:@selector(onFailure:error:) ]){
            [service.delegate onFailure:service error:error];
        }
    }];
}

- (void)invokeService:(SRWebService*)service success:(SRInvokeSuccessBlock)success failure:(SRInvokeFailureBlock)failure {
    
    NSString* url = [service getUrl];
    NSDictionary* params = service.body;
    NSDictionary* header = service.header;
    SRFilterBlock successFilter = service.successFilter;
    
    [self post:url params:params header: header success:success successFilter: successFilter failure:failure];
}


#pragma mark 
#pragma mark -User Token

- (void)setUserToken:(NSString*)value{
    _token = value;
    AppResourceSet(kRSAuthorizedToekn, _token);
    //@step
    if (nil == value) {
        NSDictionary* item = [SRWebService encodeAuthorizeTokenInfo:@""];
        [self setRequestHeader:item];
    }
}

- (NSString*)getUserToken{
    if (nil ==_token) {
        _token = (NSString*)AppResourceGet(kRSAuthorizedToekn, _token);
    }
    return _token;
}
@end
