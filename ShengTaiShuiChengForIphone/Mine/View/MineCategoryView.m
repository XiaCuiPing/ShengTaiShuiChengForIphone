//
//  MineCategoryView.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/22.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "MineCategoryView.h"

@implementation MineCategoryView

@synthesize mineDelegate = _mineDelegate;

- (instancetype)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    if (self = [self initWithFrame:frame collectionViewLayout:layout]) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor whiteColor];
        [self registerClass:[MineCategoryViewCell class] forCellWithReuseIdentifier:@"catCell"];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"MineCategor" ofType:@"plist"];
        _categoryList = [[NSArray alloc] initWithContentsOfFile:path];
        _cellWidth = SWIDTH/4 - 0.01;
    }
    return self;
}

#pragma mark - collectionview delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_categoryList count];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0001;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0001;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(_cellWidth, 70);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *data = [_categoryList objectAtIndex:indexPath.row];
    MineCategoryViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"catCell" forIndexPath:indexPath];
    cell.data = data;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *data = [_categoryList objectAtIndex:indexPath.row];
    if ([_mineDelegate respondsToSelector:@selector(mineCategoryView:didSelectedItem:)]) {
        [_mineDelegate mineCategoryView:self didSelectedItem:data];
    }
}


@end
