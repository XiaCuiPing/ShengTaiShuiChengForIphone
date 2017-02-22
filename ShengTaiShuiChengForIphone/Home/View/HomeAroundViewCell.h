//
//  HomeAroundViewCell.h
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeAroundViewCell : UITableViewCell

@property(nonatomic, readonly)UIView *bgview;
@property(nonatomic, readonly)UIImageView *imageViews;
@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)UILabel *onstituteLabel;//占地面积
@property(nonatomic, strong)UILabel *distanceLabel;//距离
@property(nonatomic, readonly)UIImageView *localImage;
@property(nonatomic, strong)UILabel *priceLabel;
@property(nonatomic, strong)UILabel *addressLabel;

@property(nonatomic, strong)NSDictionary *travelData;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;



@end
