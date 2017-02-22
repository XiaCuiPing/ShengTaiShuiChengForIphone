//
//  HomeViewController.h
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryView.h"
#import "LocalView.h"
#import "HomeSearchView.h"
#import "SliderScrollView.h"
#import "TitleTableViewCell.h"
#import "TravelListTableViewCell.h"
#import "HomeAroundViewCell.h"
#import "HomeWeatherViewCell.h"

@interface HomeViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,CategoryViewDelegate,SliderScrollViewDelegate>
{
    HomeSearchView *_searchView;
    LocalView *_localView;
    SliderScrollView *_sliderView;
    CategoryView *_categoryView;
    TravelListTableViewCell *_traveList;
    HomeWeatherViewCell *_homeWeather;
    
    NSArray *_travelList;
    NSArray *_dataArray;
}

@property(nonatomic, retain)UITableView *tableView;

@end
