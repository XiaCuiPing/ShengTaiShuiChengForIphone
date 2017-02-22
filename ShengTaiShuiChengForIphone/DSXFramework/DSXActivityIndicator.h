//
//  DSXActivityIndicator.h
//  XiangBaLao
//
//  Created by Apple on 16/2/1.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface DSXActivityIndicator : NSObject{
    @private
    UIWindow *_window;
    UIView *_contentView;
}
@property(nonatomic, strong)NSString *title;
@property(nonatomic, assign)BOOL displayMask;
@property(nonatomic, readonly)UIView *maskView;
@property(nonatomic, readonly)UIView *loadingView;
@property(nonatomic, readonly)UILabel *textLabel;
@property(nonatomic, readonly)UIActivityIndicatorView *indicatorView;

- (instancetype)init;
+ (instancetype)sharedIndicator;

- (void)show;
- (void)showWithTitle:(nullable NSString *)title;
- (void)showInView:(UIView *)view;
- (void)showInView:(UIView *)view withTitle:(nullable NSString *)title;
- (void)showInView:(UIView *)view displayMask:(BOOL)displayMask;
- (void)showInView:(UIView *)view withTitle:(nullable NSString *)title displayMask:(BOOL)displayMask;
- (void)hide;

@end
NS_ASSUME_NONNULL_END
