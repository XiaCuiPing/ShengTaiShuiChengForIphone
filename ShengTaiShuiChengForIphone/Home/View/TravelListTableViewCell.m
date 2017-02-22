//
//  TravelListTableViewCell.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "TravelListTableViewCell.h"

@implementation TravelListTableViewCell

@synthesize bigImage = _bigImage;
@synthesize customizedImg = _customizedImg;
@synthesize customizedLabel = _customizedLabel;
@synthesize titleLabel = _titleLabel;
@synthesize detailLabel = _detailLabel;
@synthesize priceLabel = _priceLabel;

@synthesize dataTravel = _dataTravel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _bigImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, SWIDTH-20, 150)];
        [self addSubview:_bigImage];
        
        _customizedImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 120, 40)];
        [self addSubview:_customizedImg];
        
        _customizedLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 110, 15)];
        _customizedLabel.textColor = [UIColor whiteColor];
        _customizedLabel.font = [UIFont systemFontOfSize:13.0];
        [self addSubview:_customizedLabel];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_bigImage.frame.size.width/2-60, 30, 120, 30)];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
        [self addSubview:_titleLabel];
        
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(_bigImage.frame.size.width/2-80, 60, 160, 30)];
        _detailLabel.textColor = [UIColor whiteColor];
        _detailLabel.font = [UIFont systemFontOfSize:12.0];
        [self addSubview:_detailLabel];
        
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(_bigImage.frame.size.width/2-50, 90, 100, 30)];
        _priceLabel.backgroundColor = [UIColor colorWithHexString:@"0xE63829"];
        _priceLabel.textColor = [UIColor whiteColor];
        [self addSubview:_priceLabel];
        
    }
    return self;
}

- (void)setDataTravel:(NSDictionary *)dataTravel
{
    _dataTravel = dataTravel;
//    _bigImage.image = [NSString stringWithFormat:@"%@",[UIImage imageNamed:[dataTravel objectForKey:@"bigImg"]]];
//    _customizedImg.image = [UIImage imageNamed:@"3.jpg"];
//    _customizedImg.image = [NSString stringWithFormat:@"%@",[UIImage imageNamed:[dataTravel objectForKey:@"icon"]]];
    _customizedLabel.text = [NSString stringWithFormat:@"%@",[dataTravel objectForKey:@"cutext"]];
    _titleLabel.text = [NSString stringWithFormat:@"%@",[dataTravel objectForKey:@"title"]];
    _detailLabel.text = [NSString stringWithFormat:@"%@",[dataTravel objectForKey:@"detail"]];
    _priceLabel.text = [NSString stringWithFormat:@"%@",[dataTravel objectForKey:@"price"]];
    
}


@end
