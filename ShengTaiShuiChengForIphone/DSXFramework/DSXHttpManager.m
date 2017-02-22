//
//  DSXHttpManager.m
//  LADZhangWo
//
//  Created by Apple on 16/1/21.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "DSXHttpManager.h"

@implementation DSXHttpManager

- (instancetype)init{
    if (self = [super init]) {
        self.afManager = [AFHTTPSessionManager manager];
    }
    return self;
}
+ (instancetype)sharedManager{
    static id instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

- (nullable NSURLSessionDataTask *)GET:(NSString *)URLString
                            parameters:(nullable id)parameters
                              progress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                               success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure{
    
    CLLocationCoordinate2D coordinate = [[DSXCLLocationManager sharedManager] coordinate];
    URLString = [SITEAPI stringByAppendingFormat:@"&longitude=%f&latitude=%f%@",coordinate.longitude,coordinate.latitude,URLString];
    return [self.afManager GET:URLString parameters:parameters progress:downloadProgress success:success failure:failure];
}

- (nullable NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))uploadProgress success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    CLLocationCoordinate2D coordinate = [[DSXCLLocationManager sharedManager] coordinate];
    URLString = [SITEAPI stringByAppendingFormat:@"&longitude=%f&latitude=%f%@",coordinate.longitude,coordinate.latitude,URLString];
    return [self.afManager POST:URLString parameters:parameters progress:uploadProgress success:success failure:failure];
}

- (nullable NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> _Nonnull))block progress:(void (^)(NSProgress * _Nonnull))uploadProgress success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    CLLocationCoordinate2D coordinate = [[DSXCLLocationManager sharedManager] coordinate];
    URLString = [SITEAPI stringByAppendingFormat:@"&longitude=%f&latitude=%f%@",coordinate.longitude,coordinate.latitude,URLString];
    return [self.afManager POST:URLString parameters:parameters constructingBodyWithBlock:block progress:uploadProgress success:success failure:failure];
}

@end
