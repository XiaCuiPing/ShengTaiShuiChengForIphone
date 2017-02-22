//
//  DSXActivityIndicator.m
//  XiangBaLao
//
//  Created by Apple on 16/2/1.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "DSXActivityIndicator.h"
#import "UIView+Size.h"

@implementation DSXActivityIndicator
@synthesize title = _title;
@synthesize maskView = _maskView;
@synthesize indicatorView = _indicatorView;
@synthesize textLabel = _textLabel;
@synthesize displayMask = _displayMask;

- (instancetype)init{
    if (self = [super init]) {
        _maskView = [[UIView alloc] init];
        _maskView.backgroundColor = [UIColor blackColor];
        _maskView.alpha = 0.4;
        _maskView.hidden = YES;
        
        _contentView = [[UIView alloc] init];
        _contentView.hidden = YES;
        _contentView.backgroundColor = [UIColor colorWithHexString:@"#444444"];
        _contentView.layer.masksToBounds = YES;
        _contentView.layer.cornerRadius = 5.0;
        
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _indicatorView.frame = CGRectMake(0, 0, 45, 45);
        [_contentView addSubview:_indicatorView];
        
        _textLabel = [[UILabel alloc] init];
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.font = [UIFont systemFontOfSize:14.0];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        [_contentView addSubview:_textLabel];
        
        _displayMask = NO;
    }
    return self;
}

+ (instancetype)sharedIndicator{
    static id instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    _textLabel.text = title;
}

- (void)setDisplayMask:(BOOL)displayMask{
    _displayMask = displayMask;
    if (_displayMask) {
        _maskView.hidden = NO;
    }else {
        _maskView.hidden = YES;
    }
}

- (void)show{
    if (!_window) {
        _window = [[[UIApplication sharedApplication] delegate] window];
    }
    _maskView.frame = _window.bounds;
    _contentView.hidden = NO;
    [_window addSubview:_maskView];
    [_window addSubview:_contentView];
    [_indicatorView startAnimating];
    [self layoutSubviews];
}

- (void)showWithTitle:(NSString *)title{
    [self setTitle:title];
    [self show];
}

- (void)showInView:(UIView *)view{
    _window = view.window;
    [self show];
}

- (void)showInView:(UIView *)view withTitle:(NSString *)title{
    [self setTitle:title];
    [self showInView:view];
}

- (void)showInView:(UIView *)view displayMask:(BOOL)displayMask{
    [self setDisplayMask:displayMask];
    [self showInView:view];
}

- (void)showInView:(UIView *)view withTitle:(NSString *)title displayMask:(BOOL)displayMask{
    [self setDisplayMask:displayMask];
    [self showInView:view withTitle:title];
}

- (void)hide{
    [_indicatorView stopAnimating];
    [_maskView removeFromSuperview];
    [_contentView removeFromSuperview];
}

- (void)layoutSubviews{
    if (_title) {
        [_textLabel sizeToFit];
        CGFloat width = _textLabel.width > _indicatorView.width ? _textLabel.width : _indicatorView.width;
        CGFloat height = _indicatorView.frame.size.height + _textLabel.height;
        _contentView.frame = CGRectMake((_window.width - width - 40)/2, (_window.height - height - 35)/2, width + 40, height + 35);
        _indicatorView.frame = CGRectMake((width + 40 - _indicatorView.width)/2, 15, _indicatorView.width, _indicatorView.height);
        _textLabel.frame = CGRectMake(20, _indicatorView.height+22, width, _textLabel.height);
    }else {
        CGFloat width = _indicatorView.frame.size.height + 30;
        CGFloat height = _indicatorView.frame.size.height + 30;
        //NSLog(@"%f:%f", width,height);
        _contentView.frame = CGRectMake((_window.width - width)/2, (_window.height - height)/2, width, height);
        _indicatorView.frame = CGRectMake((width - _indicatorView.width)/2, (height - _indicatorView.height)/2, _indicatorView.width, _indicatorView.height);
    }
}

@end
