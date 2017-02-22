//
//  MineViewController.h
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyHeadView.h"
#import "TitleTableViewCell.h"
#import "MineCategoryView.h"

@interface MineViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate,MineCategoryViewDelegate>
{
    MyHeadView *_headerView;//头部
    MineCategoryView *_categorView;//按钮图标
}

@property(nonatomic, readonly)UITableView *tableView;

@end
