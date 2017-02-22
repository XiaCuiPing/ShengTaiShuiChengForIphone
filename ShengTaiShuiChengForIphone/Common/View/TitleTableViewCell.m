//
//  TitleTableViewCell.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "TitleTableViewCell.h"

@implementation TitleTableViewCell

@synthesize image  = _image;
@synthesize title  = _title;
@synthesize detail = _detail;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier]) {
        self.textLabel.font = [UIFont systemFontOfSize:16.0];
        self.detailTextLabel.font = [UIFont systemFontOfSize:13.0];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    self.textLabel.text = title;
}

- (void)setDetail:(NSString *)detail{
    _detail = detail;
    self.detailTextLabel.text = detail;
}

- (void)setImage:(UIImage *)image{
    _image = image;
    self.imageView.image = image;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (_image) {
        self.imageView.frame = CGRectMake(10, (self.frame.size.height-20)/2, 20, 20);
        self.textLabel.frame = CGRectMake(35, 0, self.textLabel.frame.size.width, self.frame.size.height);
    }else {
        self.textLabel.frame = CGRectMake(10, 0, self.textLabel.frame.size.width, self.frame.size.height);
    }
    
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
