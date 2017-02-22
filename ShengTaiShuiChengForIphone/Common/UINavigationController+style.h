//
//  UINavigationController+style.h
//  BaJieLvYouForIphone
//
//  Created by zhangwo on 16/8/2.
//  Copyright © 2016年 BaJieLvYou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZWNavigationBarStyle) {
    ZWNavigationBarStyleDefault = 0,
    ZWNavigationBarStyleGray = 0,
    ZWNavigationBarStyleOrange = 1,
    ZWNavigationBarStyleTransparent = 2
};

@interface UINavigationController (style)

- (void)setNavBarStyle:(ZWNavigationBarStyle)navBarStyle;

@end
