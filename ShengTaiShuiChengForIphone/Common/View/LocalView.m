//
//  LocalView.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "LocalView.h"

@implementation LocalView

@synthesize textLabel = _textLabel;
@synthesize imageView = _imageView;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, frame.size.height)];
        _textLabel.text = @"六盘水";
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.font = [UIFont systemFontOfSize:14.0];
        _textLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_textLabel];
        
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(46, 9, 12, 12)];
        _imageView.image = [UIImage imageNamed:@"pop-more.png"];
        [self addSubview:_imageView];
    }
    return self;
}

@end
