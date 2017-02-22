//
//  DSXRegionPicker.m
//  XingWeiForIPhone
//
//  Created by songdewei on 2016/12/17.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "DSXRegionPicker.h"

@implementation DSXRegionPicker
@synthesize backgroundView = _backgroundView;
@synthesize contentView = _contentView;
@synthesize toolbar = _toolbar;
@synthesize pickerView = _pickerView;
@synthesize province = _province;
@synthesize city = _city;
@synthesize county = _county;
@synthesize delegate = _delegate;

- (instancetype)init{
    if (self = [super init]) {
        //半透明背景
        _backgroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backgroundView.backgroundColor = [UIColor colorWithImage:@"translucent-60.png"];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
        [_backgroundView addGestureRecognizer:tap];
        //内容视图
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 300)];
        _contentView.backgroundColor = [UIColor whiteColor];
        
        //Toolbar
        _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        [_contentView addSubview:_toolbar];
        
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"   取消" style:UIBarButtonItemStyleDone target:self action:@selector(close)];
        UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"确定   " style:UIBarButtonItemStyleDone target:self action:@selector(done)];
        [_toolbar setItems:@[cancelItem,spaceItem,doneItem]];
        
        //UIPickerView
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, _contentView.height-49)];
        _pickerView.delegate = self;
        [_contentView addSubview:_pickerView];
    }
    return self;
}

- (void)showInView:(UIView *)view{
    _window = view.window;
    [_window addSubview:_backgroundView];
    [_window addSubview:_contentView];
    [UIView animateWithDuration:0.3f animations:^{
        _contentView.originY = SCREEN_HEIGHT - 300;
    } completion:^(BOOL finished) {
        //加载省份数据
        _provinceList = [[NSUserDefaults standardUserDefaults] arrayForKey:@"_provincelist"];
        if ([_provinceList count] == 0) {
            
        }else {
            NSInteger row = [self getRow:_provinceList name:_province];
            [_pickerView reloadComponent:0];
            [self pickerView:_pickerView didSelectRow:row inComponent:0];
        }
        //代理方法
        if (_delegate && [_delegate respondsToSelector:@selector(dsx_regionPickerAfterShow:)]) {
            [_delegate dsx_regionPickerAfterShow:self];
        }
    }];
}

- (void)close{
    [_backgroundView removeFromSuperview];
    [_contentView removeFromSuperview];
    _contentView.originY = SCREEN_HEIGHT;
    if (_delegate && [_delegate respondsToSelector:@selector(dsx_regionPickerAfterClose:)]) {
        [_delegate dsx_regionPickerAfterClose:self];
    }
}

- (void)done{
    _province = [[_provinceList objectAtIndex:[_pickerView selectedRowInComponent:0]] objectForKey:@"name"];
    _city = [[_cityList objectAtIndex:[_pickerView selectedRowInComponent:1]] objectForKey:@"name"];
    _county = [[_countyList objectAtIndex:[_pickerView selectedRowInComponent:2]] objectForKey:@"name"];
    NSDictionary *region = @{@"province":_province,@"city":_city,@"county":_county};
    if (_delegate && [_delegate respondsToSelector:@selector(dsx_regionPicker:didPickedRegion:)]) {
        [_delegate dsx_regionPicker:self didPickedRegion:region];
    }
    [self close];
}

- (NSInteger)getRow:(NSArray *)array name:(NSString *)name{
    NSInteger row = 0;
    for (NSDictionary *dict in array) {
        if ([[dict objectForKey:@"name"] isEqualToString:name]) {
            row = [array indexOfObject:dict];
            break;
        }
    }
    return row;
}

#pragma mark - pickerView delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return [_provinceList count];
    }else if (component == 1){
        return [_cityList count];
    }else {
        return [_countyList count];
    }
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *title = @"";
    if (component == 0) {
        title = [[_provinceList objectAtIndex:row] objectForKey:@"name"];
    }else if (component == 1){
        title = [[_cityList objectAtIndex:row] objectForKey:@"name"];
    }else {
        title = [[_countyList objectAtIndex:row] objectForKey:@"name"];
    }
    title = (NSString *)title;
    NSAttributedString *titleString = [[NSAttributedString alloc] initWithString:title attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0]}];
    return titleString;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        NSDictionary *info = [_provinceList objectAtIndex:row];
        NSString *fid = [info objectForKey:@"id"];
        NSString *key = [NSString stringWithFormat:@"_citylist_%@", fid];
        _cityList = [[NSUserDefaults standardUserDefaults] arrayForKey:key];
        if ([_cityList count] == 0) {
            
        }else {
            NSInteger row = [self getRow:_cityList name:_city];
            [_pickerView reloadComponent:1];
            [self pickerView:pickerView didSelectRow:row inComponent:1];
        }
        
    }else if (component == 1){
        NSDictionary *info = [_cityList objectAtIndex:row];
        NSString *fid = [info objectForKey:@"id"];
        NSString *key = [NSString stringWithFormat:@"_countylist_%@", fid];
        _countyList = [[NSUserDefaults standardUserDefaults] arrayForKey:key];
        if ([_countyList count] == 0) {
            
        }else {
            NSInteger row = [self getRow:_countyList name:_county];
            [_pickerView reloadComponent:2];
            [self pickerView:pickerView didSelectRow:row inComponent:2];
        }
    }
}

@end
