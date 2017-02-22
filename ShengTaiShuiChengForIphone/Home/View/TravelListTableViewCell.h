//
//  TravelListTableViewCell.h
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TravelListTableViewCell : UITableViewCell

@property(nonatomic, readonly)UIImageView *bigImage;//大图
@property(nonatomic, readonly)UIImageView *customizedImg;//定制图片
@property(nonatomic, strong)UILabel *customizedLabel;
@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)UILabel *detailLabel;
@property(nonatomic, strong)UILabel *priceLabel;

@property(nonatomic, strong)NSDictionary *dataTravel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
