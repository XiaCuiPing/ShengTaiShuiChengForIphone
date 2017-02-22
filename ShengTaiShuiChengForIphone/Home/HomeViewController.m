//
//  HomeViewController.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //定位
    UITapGestureRecognizer *localTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showDistrict)];
    _localView = [[LocalView alloc]initWithFrame:CGRectMake(0, 29, 60, 29)];
    [_localView addGestureRecognizer:localTap];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithCustomView:_localView];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    //搜索框
    _searchView = [[HomeSearchView alloc] initWithFrame:CGRectMake(0, 0, 280, 29)];
    _searchView.textField.delegate = self;
    self.navigationItem.titleView = _searchView;
    
    UIBarButtonItem *moreButton = [DSXUI barButtonWithStyle:DSXBarButtonStyleMore target:self action:@selector(showMessage)];
    self.navigationItem.rightBarButtonItem = moreButton;
    
    //图片轮播
    _sliderView = [[SliderScrollView alloc] initWithFrame:CGRectMake(0,0, SWIDTH, SWIDTH*0.4)];
    _sliderView.groupid = 13;
    _sliderView.num = 4;
    _sliderView.delegate = self;
    [_sliderView loaddata];
    
    //按钮
    _categoryView = [[CategoryView alloc] initWithFrame:CGRectMake(0, 0, SWIDTH, 120)];
    CGFloat cellWidth = SWIDTH/4-0.01;
    _categoryView.cellSize = CGSizeMake(cellWidth, 120);
    _categoryView.imageSize = CGSizeMake(60, 60);
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HomeMenu" ofType:@"plist"];
    NSArray *dataLists = [NSArray arrayWithContentsOfFile:path];
    
    _categoryView.dataList = dataLists;
    _categoryView.delegate = self;
    
    //天气实时对比
    _homeWeather = [[HomeWeatherViewCell alloc] initWithFrame:CGRectMake(0, 0, SWIDTH, 120)];
    
    //
//    NSString *pathaa = [[NSBundle mainBundle] pathForResource:@"RecommendImage" ofType:@"plist"];
//    _dataArray = [NSArray arrayWithContentsOfFile:pathaa];
//
    
    //旅游推荐
    [[DSXHttpManager sharedManager] GET:@"&c=ad&a=travellist" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
//            if ([responseObject objectForKey:@"errno"]) {
//                
//            }
            _dataArray = [responseObject objectForKey:@"data"];
            NSLog(@"%@",_dataArray);
            [_tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    NSString *patha = [[NSBundle mainBundle] pathForResource:@"TravelPlist" ofType:@"plist"];
    _travelList = [NSArray arrayWithContentsOfFile:patha];
    
    //tableView
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = _sliderView;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_tableView];
    
    //注册单元格
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"categoryCell"];//分类菜单
    [_tableView registerClass:[TitleTableViewCell class] forCellReuseIdentifier:@"atitleCell"];
    [_tableView registerClass:[HomeWeatherViewCell class] forCellReuseIdentifier:@"weatherCell"];
    [_tableView registerClass:[TitleTableViewCell class] forCellReuseIdentifier:@"btitleCell"];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"buttonCell"];
    [_tableView registerClass:[TravelListTableViewCell class] forCellReuseIdentifier:@"travelCell"];
    [_tableView registerClass:[TitleTableViewCell class] forCellReuseIdentifier:@"ctitleCell"];
    [_tableView registerClass:[HomeAroundViewCell class] forCellReuseIdentifier:@"aroundCell"];
    
}

#pragma mark -
- (void)locationChangeWithName:(NSString *)name{
    _localView.textLabel.text = name;
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)showDistrict
{

}

- (void)showMessage
{

}

#pragma mark - categoryView delegate
///按钮
- (void)categoryView:(CategoryView *)categoryView didSelectedItem:(NSDictionary *)data{
    NSString *ID = [data objectForKey:@"id"];
    if ([ID isEqualToString:@"0"]) {
       
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section == 1)
    {
        return 2;
    }
    else if (section == 2)
    {
        return 6;
    }
    else
    {
        return 5;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 120;
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return 50;
        }
        else
        {
            return 120;
        }
    }else if (indexPath.section == 2)
    {
        if (indexPath.row == 0) {
            return 50;
        }
        else if(indexPath.row == 1)
        {
            return 40;
        }
        else
        {
            return 160;
        }
    }else
    {
        if (indexPath.row == 1) {
            return 50;
        }
        else
        {
            return 120;
        }
    }
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"categoryCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell addSubview:_categoryView];
        return cell;
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"atitleCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.image = [UIImage imageNamed:@"home-icon-purple.png"];
            cell.title = @"天气实时对比";
            cell.detail = @"更换城市";
            return cell;
        }else
        {
            HomeWeatherViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weatherCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.weatherImg.image = [UIImage imageNamed:@"home_weather.png"];
            return cell;
        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"btitleCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.image = [UIImage imageNamed:@"home-icon-purple.png"];
            cell.title = @"旅游推荐";
        }else if(indexPath.row == 1)
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"buttonCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        else
        {
            NSDictionary *dic = [_dataArray objectAtIndex:(indexPath.row -2)];
            
            TravelListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"travelCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            cell.bigImage.image = [dic objectForKey:@"bigImg"];
//            cell.customizedImg.image = [dic objectForKey:@"icon"];
            cell.customizedLabel.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"cutext"]];
//
            cell.titleLabel.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"title"]];
            cell.detailLabel.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"detail"]];
            cell.priceLabel.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"price"]];
            cell.dataTravel = dic;
            return cell;
        }
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ctitleCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.image = [UIImage imageNamed:@"home-icon-purple.png"];
            cell.title = @"周边游推荐";
        }else
        {
            NSDictionary *travelData = [_travelList objectAtIndex:indexPath.row-1];
//            NSLog(@"%@",travelData);
            HomeAroundViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aroundCell" forIndexPath:indexPath];
//            cell.imageViews.image = [NSString stringWithFormat:@"%@",[travelData objectForKey:@"image"]];
//            cell.imageViews.image = [UIImage imageNamed:@"%@",[travelData objectForKey:@"image"]];
//            cell.imageViews.image = [NSString stringWithFormat:@"%@"];
            cell.titleLabel.text = [NSString stringWithFormat:@"%@",[travelData objectForKey:@"title"]];
            cell.onstituteLabel.text = [NSString stringWithFormat:@"%@",[travelData objectForKey:@"acreage"]];
            cell.distanceLabel.text = [NSString stringWithFormat:@"%@",[travelData objectForKey:@"dist"]];
            cell.priceLabel.text = [NSString stringWithFormat:@"%@",[travelData objectForKey:@"price"]];
            cell.addressLabel.text = [NSString stringWithFormat:@"%@",[travelData objectForKey:@"address"]];
            cell.travelData = travelData;
            return cell;
        }
    }
    return [[UITableViewCell alloc] init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}



@end
