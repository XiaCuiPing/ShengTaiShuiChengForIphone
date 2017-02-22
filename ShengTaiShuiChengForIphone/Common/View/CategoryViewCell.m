//
//  CategoryViewCell.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "CategoryViewCell.h"

@implementation CategoryViewCell

@synthesize imageSize  = _imageSize;
@synthesize imageView  = _imageView;
@synthesize titleLabel = _titleLabel;
@synthesize data = _data;

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        [_imageView setContentMode:UIViewContentModeScaleToFill];
        [self addSubview:_imageView];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor blackColor];
        [self addSubview:_titleLabel];
        
    }
    return self;
}

//setter方法
- (void)setData:(NSDictionary *)data{
    if (data) {
        UIImage *image = [UIImage imageNamed:[data objectForKey:@"icon"]];
        _imageView.image = image;
        _titleLabel.text = [data objectForKey:@"title"];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat x = (self.frame.size.width - _imageSize.width)/2;
    _imageView.frame = CGRectMake(x, 10, _imageSize.width, _imageSize.height);
    
    _titleLabel.frame = CGRectMake(0, 20+_imageSize.height, self.frame.size.width, 30);
}

@end
