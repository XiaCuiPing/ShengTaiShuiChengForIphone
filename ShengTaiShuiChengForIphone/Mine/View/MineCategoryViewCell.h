//
//  MineCategoryViewCell.h
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/22.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineCategoryViewCell : UICollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame;
@property(nonatomic, readonly)UIImageView *imageView;
@property(nonatomic, readonly)UILabel *titleLabel;
@property(nonatomic, strong)NSDictionary *data;
@property(nonatomic, readonly)UIView *view;

@end
