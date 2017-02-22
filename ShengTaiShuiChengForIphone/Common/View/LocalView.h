//
//  LocalView.h
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocalView : UIView

//定位
- (instancetype)initWithFrame:(CGRect)frame;

@property(nonatomic,readonly)UILabel *textLabel;
@property(nonatomic,readonly)UIImageView *imageView;

@end
