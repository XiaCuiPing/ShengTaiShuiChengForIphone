//
//  LoginInputView.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/21.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "LoginInputView.h"

@implementation LoginInputView

@synthesize text = _text;
@synthesize placeHolder = _placeHolder;
@synthesize leftImage = _leftImage;
@synthesize leftView  = _leftView;
@synthesize textField = _textField;

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _leftView = [[UIImageView alloc] init];
        _leftView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:_leftView];
        
        _textField = [[UITextField alloc] init];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.returnKeyType = UIReturnKeyDone;
        [self addSubview:_textField];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)setLeftImage:(NSString *)leftImage{
    _leftImage = leftImage;
    _leftView.image = [UIImage imageNamed:leftImage];
}

- (void)setPlaceHolder:(NSString *)placeHolder{
    _placeHolder = placeHolder;
    _textField.placeholder = placeHolder;
}

- (void)setText:(NSString *)text{
    _text = text;
    _textField.text = text;
}

- (NSString *)text{
    return _textField.text;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect frame;
    frame.origin.x = 10;
    frame.origin.y = 10;
    frame.size.width = self.frame.size.height - 20;
    frame.size.height = frame.size.width;
    _leftView.frame = frame;
    
    frame.origin.x = _leftView.frame.size.width + 20;
    frame.origin.y = 0;
    frame.size.width = self.frame.size.width - _leftView.frame.size.width - 20;
    frame.size.height = self.frame.size.height;
    _textField.frame = frame;
}

@end
