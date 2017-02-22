//
//  DSXRegionPicker.h
//  XingWeiForIPhone
//
//  Created by songdewei on 2016/12/17.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class DSXRegionPicker;
@protocol DSXRegionPickerDelegate <NSObject>

@optional
- (void)dsx_regionPickerAfterShow:(DSXRegionPicker *)picker;
- (void)dsx_regionPickerAfterClose:(DSXRegionPicker *)picker;
- (void)dsx_regionPicker:(DSXRegionPicker *)picker didPickedRegion:(NSDictionary *)region;

@end

@interface DSXRegionPicker : NSObject<UIPickerViewDelegate,UIPickerViewDataSource>{
    @private
    UIWindow *_window;
    NSArray *_provinceList,*_cityList,*_countyList;
}

@property(nonatomic, readonly)UIView *backgroundView;
@property(nonatomic, readonly)UIView *contentView;
@property(nonatomic, readonly)UIToolbar *toolbar;
@property(nonatomic, readonly)UIPickerView *pickerView;
@property(nonatomic, strong)NSString *province;
@property(nonatomic, strong)NSString *city;
@property(nonatomic, strong)NSString *county;
@property(nonatomic, assign)id<DSXRegionPickerDelegate>delegate;

- (instancetype)init;
- (void)showInView:(UIView *)view;
- (void)close;

@end
