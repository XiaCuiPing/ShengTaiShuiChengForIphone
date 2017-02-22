//
//  LoginInputView.h
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/21.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginInputView : UIView

- (instancetype)initWithFrame:(CGRect)frame;

@property(nonatomic)NSString *leftImage;
@property(nonatomic)NSString *placeHolder;
@property(nonatomic)NSString *text;
@property(nonatomic,readonly)UIImageView *leftView;
@property(nonatomic,readonly)UITextField *textField;

@end
