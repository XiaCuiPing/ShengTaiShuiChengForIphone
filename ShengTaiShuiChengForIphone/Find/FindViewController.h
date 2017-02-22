//
//  FindViewController.h
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSXSearchBar.h"
#import "CategoryView.h"

@interface FindViewController : UIViewController <CategoryViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    CategoryView *_category;
}

@property(nonatomic, readonly)UITableView *tableView;

@end
