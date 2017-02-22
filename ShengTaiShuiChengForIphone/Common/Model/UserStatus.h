//
//  UserStatus.h
//  XingWeiForIPhone
//
//  Created by Apple on 16/9/6.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface UserStatus : NSObject

@property(nonatomic, readonly)NSString *uid;
@property(nonatomic,strong)NSString *userpic;
@property(nonatomic, readonly)NSString *username;
@property(nonatomic, readonly)NSString *email;
@property(nonatomic, readonly)NSString *mobile;
@property(nonatomic, readonly)NSDictionary *userinfo;
@property(nonatomic, readonly)BOOL logged;

- (instancetype)init;
+ (instancetype)sharedStatus;

//显示登录页面
- (void)viewLoginFrom:(UIViewController *)viewController;
//更新登录状态
- (void)updateStatus:(nullable id)params complete:(nullable void (^)(id responseObject))complete;
//登录
- (void)login:(id)params success:(nullable void (^)(id responseObject))success failed:(nullable void (^)(id error))failed;
//退出登录
- (void)logout;
- (void)logout:(nullable void(^)(id responseObject))success failed:(nullable void (^)(id error))failed;
//更新用户信息
- (void)update:(id)params success:(nullable void (^)(id responseObject))success failed:(nullable void (^)(id error))failed;
//获取签名
- (NSString *)getSign;

@end
NS_ASSUME_NONNULL_END
