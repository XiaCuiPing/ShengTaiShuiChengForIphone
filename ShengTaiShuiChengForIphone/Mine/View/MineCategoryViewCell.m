//
//  MineCategoryViewCell.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/22.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "MineCategoryViewCell.h"

@implementation MineCategoryViewCell

@synthesize imageView = _imageView;
@synthesize titleLabel = _titleLabel;
@synthesize data = _data;
@synthesize view = _view;

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 30)/2, 10, 26, 26)];
        [self addSubview:_imageView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, frame.size.width, 20)];
        _titleLabel.font = [UIFont systemFontOfSize:14.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
    }
    return self;
}

- (void)setData:(NSDictionary *)data{
    _data = data;
    _imageView.image = [UIImage imageNamed:[data objectForKey:@"image"]];
    _titleLabel.text = [data objectForKey:@"title"];
}


@end
