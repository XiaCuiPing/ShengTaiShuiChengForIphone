
//
//  HomeSearchView.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "HomeSearchView.h"

@implementation HomeSearchView

@synthesize imageView = _imageView;
@synthesize textField = _textField;

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 10.0;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, frame.size.width-55, frame.size.height)];
        _textField.placeholder = @"搜索目的地/景点/酒店等";
        _textField.textColor = [UIColor whiteColor];
        _textField.font = [UIFont systemFontOfSize:13.0];
        _textField.returnKeyType = UIReturnKeySearch;
        [self addSubview:_textField];
        
    }
    return self;
}

@end
