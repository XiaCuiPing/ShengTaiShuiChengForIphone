//
//  UINavigationController+style.m
//  XingWeiForIPhone
//
//  Created by Apple on 16/9/9.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "UINavigationController+style.h"

@implementation UINavigationController(style)

- (void)setStyle:(DSXNavigationStyle)style{
    switch (style) {
        case DSXNavigationStyleTransparent:
            [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"transparent.png"] forBarMetrics:UIBarMetricsDefault];
            [self.navigationBar setShadowImage:[UIImage imageNamed:@"transparent.png"]];
            break;
            
        default:
            [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbg.png"] forBarMetrics:UIBarMetricsDefault];
            [self.navigationBar setShadowImage:[UIImage imageNamed:@"navbg.png"]];
            break;
    }
}

@end
