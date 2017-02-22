//
//  MineCategoryView.h
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/22.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MineCategoryViewCell.h"

@class MineCategoryView;
@protocol MineCategoryViewDelegate <NSObject>

@optional
- (void)mineCategoryView:(MineCategoryView *)mineCategoryView didSelectedItem:(NSDictionary *)data;

@end

@interface MineCategoryView : UICollectionView <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSArray *_categoryList;
    CGFloat _cellWidth;
}
//代理
@property(nonatomic, assign)id<MineCategoryViewDelegate> mineDelegate;
- (instancetype)initWithFrame:(CGRect)frame;
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout;

@end
