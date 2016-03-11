//
//  DTNetHelper.m
//  DuiTang
//
//  Created by Dylan on 3/7/16.
//  Copyright © 2016 Monky. All rights reserved.
//

#import "DTNetHelper.h"

static DTNetHelper * _shareManager;
@implementation DTNetHelper



+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // AFHTTPSessionManager 单例对象，可以在程序短时间内发起多个请求时，降低系统开销
        _shareManager = [[super allocWithZone:NULL] initWithBaseURL:[NSURL URLWithString:nil]];// 这里使用 BaseUrl ，是让 AFNetworking 减少每次请求服务器时候，提升查找目标服务器地址的速度，而且这里建议直接使用 ip 地址。
        // 设置网络请求 SSL 功能，使用（HTTPS）时开启
        //		_shareManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        // 设置请求内容的序列化方式
        _shareManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        // 设置网络超时的时间，10秒。
        _shareManager.requestSerializer.timeoutInterval = 10;
        // 设置服务器返回数据的序列化方式
        _shareManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        // 设置可接受的服务器返回数据的格式
        _shareManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
        
        // 当手机处于无网络状态时，必须给出提示，不然会被拒绝。
        [self isReachToWeb];
    });
    
    
    return _shareManager;
}

+ (void)isReachToWeb {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: {
                
                
                break;
            }
            case AFNetworkReachabilityStatusNotReachable: {
                
                NSLog(@"无网络");
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN: {
                
                
                NSLog(@"手机网络");
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi: {
                
                NSLog(@"WIFI网络");
                break;
            }
        }
        
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}


// 封装 Post 请求，成功和失败在一个 block 里面处理
+ (void)postWithParam:(NSDictionary *)params andPath:(NSString *)path andComplete:(void (^)(BOOL success, id result))complete {
    [[[self shareManager] operationQueue] cancelAllOperations];
    [[self shareManager] POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // 请求成功，block 返回服务器返回的数据。
        // 这里是因为服务器返回数据不一定为字符串或者是 json 数据，所以不做其他处理，直接返回，如果是其他需求，也可以再继续进行其他处理
        complete(YES, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // 网络请求失败，返回失败原因
        complete(NO, error.localizedDescription);
    }];
}

// 封装 Get 请求，成功和失败分开处理
+ (void)getDataWithParam:(NSDictionary *)params andPath:(NSString *)path andComplete:(void (^)(BOOL success, id result))complete {
    
    [[self shareManager] GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        complete(YES, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // 网络请求失败，返回失败原因
        complete(NO, error.localizedDescription);
    }];
}


@end
