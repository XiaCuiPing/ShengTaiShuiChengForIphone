//
//  DSXUI.h
//  YuShuiHePan
//
//  Created by songdewei on 15/9/15.
//  Copyright (c) 2015年 yushuihepan. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSBundle+example.h"

typedef NS_ENUM(NSInteger, DSXBarButtonStyle) {
    DSXBarButtonStyleAdd,
    DSXBarButtonStyleBack,
    DSXBarButtonStyleClose,
    DSXBarButtonStyleDelete,
    DSXBarButtonStyleFavor,
    DSXBarButtonStyleLike,
    DSXBarButtonStyleMore,
    DSXBarButtonStyleMessage,
    DSXBarButtonStyleRefresh,
    DSXBarButtonStyleShare
};

typedef NS_ENUM(NSInteger,DSXPopViewStyle){
    DSXPopViewStyleDefault,
    DSXPopViewStyleWarning,
    DSXPopViewStyleSuccess,
    DSXPopViewStyleError
};

UIKIT_EXTERN NSString *const DSXFontStyleThin;
UIKIT_EXTERN NSString *const DSXFontStyleLight;
UIKIT_EXTERN NSString *const DSXFontStyleDemilight;
UIKIT_EXTERN NSString *const DSXFontStyleMedinum;
UIKIT_EXTERN NSString *const DSXFontStyleBold;
UIKIT_EXTERN NSString *const DSXFontStyleBlack;

@interface DSXUI : NSObject
+ (instancetype)standardUI;

+ (UIBarButtonItem *)barButtonWithImage:(NSString *)imageName target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)barButtonWithStyle:(DSXBarButtonStyle)style target:(id)target action:(SEL)action;

- (void)showPopViewWithStyle:(DSXPopViewStyle)style Message:(NSString *)message;

@end
