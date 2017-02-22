//
//  HomeSearchView.h
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeSearchView : UIView

- (instancetype)initWithFrame:(CGRect)frame;

@property(nonatomic,readonly)UIImageView *imageView;
@property(nonatomic,readonly)UITextField *textField;

@end
