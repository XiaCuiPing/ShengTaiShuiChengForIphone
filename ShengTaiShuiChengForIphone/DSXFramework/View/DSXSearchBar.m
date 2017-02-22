//
//  DSXSearchBar.m
//  XingWeiForIPhone
//
//  Created by Apple on 16/8/11.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "DSXSearchBar.h"

@implementation DSXSearchBar
@synthesize textField = _textField;

- (instancetype)init{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //[self setTintColor:[UIColor clearColor]];
        [self setBarTintColor:[UIColor clearColor]];
        for (UIView *subview in self.subviews) {
            for (UIView *view in subview.subviews) {
                if ([view isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                    [view removeFromSuperview];
                }
                if ([view isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
                    _textField = (UITextField *)view;
                }
            }
        }
    }
    return self;
}

@end
