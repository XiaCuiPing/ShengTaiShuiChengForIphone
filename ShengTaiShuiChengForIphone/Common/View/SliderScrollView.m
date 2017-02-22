//
//  SliderScrollView.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "SliderScrollView.h"

@implementation SliderScrollView
@synthesize groupid = _groupid;
@synthesize num     = _num;
@synthesize scrollView  = _scrollView;
@synthesize pageControl = _pageControl;

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.bounces = NO;
        [self addSubview:_scrollView];
        
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height-30, self.frame.size.width, 20)];
        [_pageControl addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_pageControl];
        
    }
    return self;
}

- (void)loaddata{
    NSString *keyName = [NSString stringWithFormat:@"gid_%d",_groupid];
    [self showImageWithArray:[[NSUserDefaults standardUserDefaults] arrayForKey:keyName]];
    [[DSXHttpManager sharedManager] GET:@"&c=carousel&a=showcarousel" parameters:@{@"gid":@(_groupid),@"num":@(_num)} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"errno"] intValue] == 0) {
                _dataList = [responseObject objectForKey:@"data"];
                NSLog(@"%@",_dataList);
                [self showImageWithArray:_dataList];
                [[NSUserDefaults standardUserDefaults] setObject:_dataList forKey:keyName];
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

- (void)showImageWithArray:(NSArray *)array{
    if ([array count] == 0) {
        return;
    }
    for (UIView *subview in _scrollView.subviews) {
        [subview removeFromSuperview];
    }
    CGFloat x = 0;
    for (int i=0;i<[array count]; i++) {
        NSDictionary *dict = [array objectAtIndex:i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, self.frame.size.width, self.frame.size.height)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:[dict objectForKey:@"pic"]]];
        [imageView setContentMode:UIViewContentModeScaleToFill];
        [imageView setTag:i];
        [_scrollView addSubview:imageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTap:)];
        [imageView addGestureRecognizer:tap];
        [imageView setUserInteractionEnabled:YES];
        x+= self.frame.size.width;
    }
    _scrollView.contentSize = CGSizeMake(self.frame.size.width*[_dataList count], 0);
    _pageControl.numberOfPages = [_dataList count];
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(autoPlay) userInfo:nil repeats:YES];
}


- (void)imageViewTap:(UITapGestureRecognizer *)tap{
//    NSLog(@"%ld",tap.view.tag);
    if ([_delegate respondsToSelector:@selector(SliderViewScrollView:didSelectedItemWithData:)]) {
        [_delegate SliderViewScrollView:self didSelectedItemWithData:[_dataList objectAtIndex:tap.view.tag]];
    }
}

- (void)pageControlClick:(UIPageControl *)sender{
    [self scrollTo:sender.currentPage];
}

- (void)autoPlay{
    NSInteger index = _pageControl.currentPage;
    index++;
    [self scrollTo:index];
}

- (void)scrollTo:(NSInteger)index{
    BOOL animated = YES;
    if (index >= _pageControl.numberOfPages) {
        index = 0;
        animated = NO;
    }else {
        animated = YES;
    }
    _pageControl.currentPage = index;
    [_scrollView setContentOffset:CGPointMake(self.frame.size.width*index, 0) animated:animated];
}

#pragma mark - scrollView delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = self.scrollView.contentOffset.x/self.frame.size.width;
    [self scrollTo:index];
}

@end
