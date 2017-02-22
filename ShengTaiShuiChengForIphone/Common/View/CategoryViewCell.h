//
//  CategoryViewCell.h
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewCell : UICollectionViewCell

//图标尺寸
@property(nonatomic,assign)CGSize imageSize;
//imageView
@property(nonatomic, readonly)UIImageView *imageView;
//title标签
@property(nonatomic, readonly)UILabel *titleLabel;
//分类数据
@property(nonatomic, strong)NSDictionary *data;

- (instancetype)initWithFrame:(CGRect)frame;

@end
