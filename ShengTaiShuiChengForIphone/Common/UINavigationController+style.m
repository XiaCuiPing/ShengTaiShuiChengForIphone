//
//  UINavigationController+style.m
//  BaJieLvYouForIphone
//
//  Created by zhangwo on 16/8/2.
//  Copyright © 2016年 BaJieLvYou. All rights reserved.
//

#import "UINavigationController+style.h"

@implementation UINavigationController (style)

- (void)setNavBarStyle:(ZWNavigationBarStyle)navBarStyle{
    switch (navBarStyle) {
            
        case 1:
            [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav.png"] forBarMetrics:UIBarMetricsDefault];
            [self.navigationBar setTintColor:[UIColor blackColor]];
            [self.navigationBar setBarStyle:UIBarStyleBlack];
            [self.navigationBar setShadowImage:nil];
            [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
            break;
            
        case 2:
            [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"transparent.png"] forBarMetrics:UIBarMetricsDefault];
            [self.navigationBar setTintColor:[UIColor whiteColor]];
            [self.navigationBar setBarStyle:UIBarStyleDefault];
            [self.navigationBar setShadowImage:[UIImage imageNamed:@"transparent.png"]];
            break;
            
        default:
            [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbg-gray.png"] forBarMetrics:UIBarMetricsDefault];
            [self.navigationBar setBarStyle:UIBarStyleDefault];
            [self.navigationBar setTintColor:[UIColor blackColor]];
            [self.navigationBar setShadowImage:nil];
            break;
    }
}

@end
