//
//  DSXSearchBar.h
//  XingWeiForIPhone
//
//  Created by Apple on 16/8/11.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSXSearchBar : UISearchBar

@property(nonatomic, readonly)UITextField *textField;

- (instancetype)init;
- (instancetype)initWithFrame:(CGRect)frame;

@end
