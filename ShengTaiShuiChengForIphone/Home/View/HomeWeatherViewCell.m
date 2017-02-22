
//
//  HomeWeatherViewCell.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/21.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "HomeWeatherViewCell.h"

@implementation HomeWeatherViewCell

@synthesize weatherImg = _weatherImg;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _weatherImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SWIDTH, 120)];
        [self addSubview:_weatherImg];
    }
    return self;
}

@end
