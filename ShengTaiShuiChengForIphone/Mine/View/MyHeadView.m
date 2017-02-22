//
//  MyHeadView.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/21.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "MyHeadView.h"

@implementation MyHeadView

@synthesize imageView = _imageView;
@synthesize textLabel = _textLabel;

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mine-head.png"]];
        UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SWIDTH, 200)];
        bgImageView.image = [UIImage imageNamed:@"mine-head.png"];
        bgImageView.userInteractionEnabled = YES;
        [self addSubview:bgImageView];
        
        self.imageView = [[UIImageView alloc] init];
        self.textLabel = [[UILabel alloc] init];
        self.textLabel.textColor = [UIColor colorWithHexString:@"0xE63829"];
//        self.textLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    }
    return self;
}

- (void)setImageView:(UIImageView *)imageView{
    if (imageView) {
        _imageView = imageView;
        _imageView.frame = CGRectMake(0, 0, 60, 60);
        _imageView.layer.cornerRadius = 30;
        _imageView.layer.masksToBounds = YES;
        CGPoint center = self.center;
        center.y = center.y - 15;
        _imageView.center = center;
        [self addSubview:_imageView];
    }
}

- (void)setTextLabel:(UILabel *)textLabel{
    if (textLabel) {
        _textLabel = textLabel;
        CGPoint center = self.center;
        _textLabel.frame = CGRectMake(0, center.y+15, self.frame.size.width, 30);
        _textLabel.font = [UIFont systemFontOfSize:14.0];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.text = @"您还未登录，点击登录";
        [self addSubview:_textLabel];
    }
}

@end
