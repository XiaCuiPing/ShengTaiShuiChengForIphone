//
//  UserStatus.m
//  XingWeiForIPhone
//
//  Created by Apple on 16/9/6.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "UserStatus.h"

@implementation UserStatus
@synthesize uid = _uid;
@synthesize username = _username;
@synthesize email  = _email;
@synthesize mobile = _mobile;
@synthesize userinfo = _userinfo;
@synthesize logged = _logged;

- (instancetype)init{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

//单例
+ (instancetype)sharedStatus{
    static id instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

- (void)updateStatus:(id)params complete:(void (^)(id _Nonnull))complete{
    [[DSXHttpManager sharedManager] GET:@"&c=member&a=getinfo" parameters:params progress:nil
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    if ([responseObject isKindOfClass:[NSDictionary class]]) {
                                        if ([[responseObject objectForKey:@"errno"] intValue] == 0) {
                                            [[NSUserDefaults standardUserDefaults] setObject:[responseObject objectForKey:@"data"] forKey:@"userinfo"];
                                            [self setup];
                                        }
                                    }
                                    if(complete) complete(responseObject);
                                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    NSLog(@"%@", error);
                                }];
}

- (void)setup{
    _userinfo = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"userinfo"];
    _uid = [_userinfo objectForKey:@"uid"];
    _username = [_userinfo objectForKey:@"username"];
    _email = [_userinfo objectForKey:@"email"];
    _mobile = [_userinfo objectForKey:@"mobile"];
    _userpic = [_userinfo objectForKey:@"userip"];
    
    if ([_uid intValue] > 0 && [_username length] > 0) {
        _logged = YES;
    }else {
        _logged = NO;
    }
}
//显示登录页面
- (void)viewLoginFrom:(UIViewController *)viewController{
//    LoginViewController *loginView = [[LoginViewController alloc] init];
//    DSXNavigationController *navigation = [[DSXNavigationController alloc] initWithRootViewController:loginView];
//    [viewController presentViewController:navigation animated:YES completion:nil];
}
//登录
- (void)login:(id)params success:(void (^)(id _Nonnull))success failed:(void (^)(id _Nonnull))failed{
    if(params == nil) return;
    [[DSXHttpManager sharedManager] POST:@"&c=member&a=login" parameters:params
                                progress:nil
                                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                     if ([responseObject isKindOfClass:[NSDictionary class]]) {
                                         if ([[responseObject objectForKey:@"errno"] intValue] == 0) {
                                             [[NSUserDefaults standardUserDefaults] setObject:[responseObject objectForKey:@"data"] forKey:@"userinfo"];
                                             [self setup];
                                         }
                                     }
                                     if(success) success(responseObject);
                                 }
                                 failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                     if(failed) failed(error);
                                 }];
}
//登出
- (void)logout{
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"userinfo"];
    [DSXCookieHelper clearCookies];
    [self setup];
}
- (void)logout:(void (^)(id _Nonnull))success failed:(void (^)(id _Nonnull))failed{
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"userinfo"];
    [DSXCookieHelper clearCookies];
    [self setup];
    [[DSXHttpManager sharedManager] GET:@"&c=member&a=logout"
                         parameters:nil progress:nil
                            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                if(success) success(responseObject);
                            }
                            failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                if(failed) failed(error);
                            }];
}
//更新用户信息
- (void)update:(id)params success:(void (^)(id _Nonnull))success failed:(void (^)(id _Nonnull))failed{
    [[DSXHttpManager sharedManager] POST:@"&c=member&c=update"
                              parameters:params progress:nil
                                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                     if(success) success(responseObject);
                                 }
                                 failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                     if(failed) failed(error);
                                 }];
}
//获取签名
- (NSString *)getSign{
    if (_logged) {
        return [[AUTHKEY stringByAppendingString:_uid] md5];
    }else {
        return @"";
    }
}

@end
