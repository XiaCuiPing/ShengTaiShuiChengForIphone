//
//  CategoryView.h
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryViewCell.h"

@class CategoryView;
@protocol CategoryViewDelegate <NSObject>

@optional
- (void)categoryView:(CategoryView *)categoryView didSelectedItem:(NSDictionary *)data;

@end

@interface CategoryView : UIView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic,readonly)UICollectionView *collectionView;
//Cell 尺寸
@property(nonatomic, assign)CGSize cellSize;
//图标尺寸
@property(nonatomic, assign)CGSize imageSize;
//分类数据列表
@property(nonatomic, strong)NSArray *dataList;
//代理
@property(nonatomic, assign)id<CategoryViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame;

@end
