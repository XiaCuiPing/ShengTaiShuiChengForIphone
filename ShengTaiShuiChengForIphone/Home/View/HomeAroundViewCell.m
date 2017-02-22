//
//  HomeAroundViewCell.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "HomeAroundViewCell.h"

@implementation HomeAroundViewCell

@synthesize bgview = _bgview;
@synthesize imageViews = _imageViews;
@synthesize titleLabel = _titleLabel;
@synthesize onstituteLabel = _onstituteLabel;
@synthesize distanceLabel = _distanceLabel;
@synthesize localImage = _localImage;
@synthesize priceLabel = _priceLabel;
@synthesize addressLabel = _addressLabel;

@synthesize travelData = _travelData;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _bgview = [[UIView alloc] init];
        [self addSubview:_bgview];
        
        _imageViews = [[UIImageView alloc] init];
        _imageViews.backgroundColor = [UIColor clearColor];
        [_bgview addSubview:_imageViews];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor colorWithHexString:@"0xE63829"];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
        [_bgview addSubview:_titleLabel];
        
        _onstituteLabel = [[UILabel alloc] init];
        _onstituteLabel.textColor = [UIColor colorWithHexString:@"0x737273"];
        _onstituteLabel.font = [UIFont systemFontOfSize:12.0];
        [_bgview addSubview:_onstituteLabel];
        
        _distanceLabel = [[UILabel alloc] init];
        _distanceLabel.textColor = [UIColor colorWithHexString:@"0x2CA6E0"];
        _distanceLabel.font = [UIFont systemFontOfSize:13.0];
        [_bgview addSubview:_distanceLabel];
        
        _localImage = [[UIImageView alloc] init];
        _localImage.image = [UIImage imageNamed:@"icon-local"];
        [_bgview addSubview:_localImage];
        
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.textColor = [UIColor colorWithHexString:@"0xE63829"];
        _priceLabel.font = [UIFont systemFontOfSize:16.0];
        [_bgview addSubview:_priceLabel];
        
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.textColor = [UIColor colorWithHexString:@"0x737273"];
        _addressLabel.font = [UIFont systemFontOfSize:12.0];
        [_bgview addSubview:_addressLabel];
        
//        NSString *patha = [[NSBundle mainBundle] pathForResource:@"RecommendImage" ofType:@"plist"];
//        NSArray *array = [NSArray arrayWithContentsOfFile:patha];
    }
    return self;
}

- (void)setTravelData:(NSDictionary *)travelData
{
    _travelData = travelData;
    
    NSLog(@"%@",travelData);
    
    [_imageViews sd_setImageWithURL:[NSURL URLWithString:[travelData objectForKey:@"pic"]]];
    [_titleLabel setText:[travelData objectForKey:@"title"]];
    [_onstituteLabel setText:[travelData objectForKey:@"summary"]];
    [_distanceLabel setText:[travelData objectForKey:@"distance"]];
//    [_localImage sd_setImageWithURL:[NSURL URLWithString:[travelData objectForKey:@""]]];
    [_priceLabel setText:[NSString stringWithFormat:@"￥%@起",[travelData objectForKey:@"fare"]]];
    [_addressLabel setText:[travelData objectForKey:@"address"]];
    
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    [_priceLabel sizeToFit];
    [_addressLabel sizeToFit];
    
    CGFloat imageWidth = self.frame.size.height-20;
    CGFloat imageHeight = imageWidth;
    CGFloat W = _bgview.frame.size.width-(imageWidth+30);
    
    _bgview.frame = CGRectMake(0, 0, SWIDTH, 120);
    _imageViews.frame = CGRectMake(15, 10, imageWidth, imageHeight);
    _titleLabel.frame = CGRectMake(imageWidth+25, 5, W, 20);
    _onstituteLabel.frame = CGRectMake(imageWidth+25, 40, W, 20);
    _distanceLabel.frame = CGRectMake(imageWidth+25, 70, 100, 20);
    _localImage.frame = CGRectMake(imageWidth+130, 70, 15, 15);
    _priceLabel.frame = CGRectMake(_bgview.frame.size.width-95, 70, 80, 20);
    _addressLabel.frame = CGRectMake(imageWidth+25, 90, W, 20);
    
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
    
}

@end
