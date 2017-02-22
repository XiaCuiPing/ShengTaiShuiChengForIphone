//
//  CategoryView.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "CategoryView.h"

@implementation CategoryView
@synthesize collectionView = _collectionView;
@synthesize cellSize  = _cellSize;
@synthesize imageSize = _imageSize;
@synthesize dataList  = _dataList;
@synthesize delegate  = _delegate;

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        
        [_collectionView registerClass:[CategoryViewCell class] forCellWithReuseIdentifier:@"cellItem"];
        [self addSubview:_collectionView];
        
    }
    return self;
}

#pragma mark - collectionView delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_dataList count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return _cellSize;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.001;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0.001;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CategoryViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellItem" forIndexPath:indexPath];
    
    cell.imageSize = _imageSize;
    cell.data = [_dataList objectAtIndex:[indexPath row]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *data = [_dataList objectAtIndex:[indexPath row]];
    if (_delegate && [_delegate respondsToSelector:@selector(categoryView:didSelectedItem:)]) {
        [_delegate categoryView:self didSelectedItem:data];
    }
}

#pragma mark - setter
- (void)setDataList:(NSArray *)dataList{
    _dataList = dataList;
    [_collectionView reloadData];
}

@end
