//
//  SliderScrollView.h
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>

//图片轮播
@class SliderScrollView;
@protocol SliderScrollViewDelegate <NSObject>

@optional
- (void)SliderViewScrollView:(SliderScrollView *)sliderView didSelectedItemWithData:(NSDictionary *)data;

@end

@interface SliderScrollView : UIView <UIScrollViewDelegate>
{
@private
    NSArray *_dataList;
}

- (instancetype)initWithFrame:(CGRect)frame;
- (void)loaddata;

@property(nonatomic,assign)int groupid;
@property(nonatomic,assign)int num;
@property(nonatomic,readonly)UIScrollView *scrollView;
@property(nonatomic,retain)UIPageControl *pageControl;
//@property(nonatomic,strong)NSArray *dataList;

@property(nonatomic,assign)id<SliderScrollViewDelegate>delegate;

@end
