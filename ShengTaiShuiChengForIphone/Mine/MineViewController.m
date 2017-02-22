//
//  MineViewController.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor bgColor]];
    
    self.automaticallyAdjustsScrollViewInsets = NO;//不允许自动设置tableView的高度
    self.navigationController.delegate = self;
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.height = SHEIGHT - self.tabBarController.tabBar.height;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_tableView];
    [self setHeadView];
    
    [_tableView registerClass:[TitleTableViewCell class] forCellReuseIdentifier:@"titleCell"];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"categorCell"];
    [_tableView registerClass:[TitleTableViewCell class] forCellReuseIdentifier:@"listCell"];
    
    //按钮
    _categorView = [[MineCategoryView alloc] initWithFrame:CGRectMake(0, 0, SWIDTH, 70)];
    _categorView.mineDelegate = self;
    
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

- (void)setHeadView{
    _headerView = [[MyHeadView alloc] initWithFrame:CGRectMake(0, 0, SWIDTH, 200)];
    _tableView.tableHeaderView = _headerView;
//    if ([[UserStatus sharedStatus] isLogined]) {
//        [_headerView.imageView sd_setImageWithURL:[NSURL URLWithString:[[UserStatus sharedStatus] userpic]]];
//        [_headerView.textLabel setText:[[BJUserStatus sharedStatus] username]];
//
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showSetting)];
//        [_headerView.imageView addGestureRecognizer:tap];
//        [_headerView.imageView setUserInteractionEnabled:YES];
//
//    }
    if ([[UserStatus sharedStatus] logged]) {
//        [_headerView.imageView sd_setImageWithURL:[NSURL URLWithString:[[UserStatus sharedStatus] userpic]]];
        [_headerView.textLabel setText:[[UserStatus sharedStatus] username]];
        
    }else{
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showLogin)];
        UIImageView *avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine-headPortrait.png"]];
        [_headerView setImageView:avatar];
        [_headerView addGestureRecognizer:tap];
        [_headerView setUserInteractionEnabled:YES];
    }
}

- (void)mineCategoryView:(MineCategoryView *)mineCategoryView didSelectedItem:(NSDictionary *)data
{
    NSInteger tag = [[data objectForKey:@"id"] integerValue];
    if ([[UserStatus sharedStatus] logged]) {
        switch (tag) {
            case 1:
                
                break;
                
            default:
                break;
        }
    }
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 1;
    }
    if (section == 2) {
        return 4;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 45;
    }
    if (indexPath.section == 1) {
        return 72;
    }
    if (indexPath.section == 2) {
        return 45;
    }
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleCell" forIndexPath:indexPath];
        cell.title = @"全部订单";
        cell.detail = @"查看所有订单";
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        return cell;
    }
    if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"categorCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        [cell addSubview:_categorView];
        return cell;
    }
    if (indexPath.section == 2) {
        TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        
        if (indexPath.row == 0) {
            cell.image = [UIImage imageNamed:@"mine-information.png"];
            cell.title = @"设置";

        }else if (indexPath.row == 1)
        {
            cell.image = [UIImage imageNamed:@"mine-collection.png"];
            cell.title = @"我的收藏";
        }else if (indexPath.row == 2)
        {
            cell.image = [UIImage imageNamed:@"mine-friends.png"];
            cell.title = @"我的好友";
        }else
        {
            float cacheSize = (float)[[SDImageCache sharedImageCache] getSize]/1048576;
            cell.image = [UIImage imageNamed:@"mine-history.png"];
            cell.title = @"清除缓存";
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2fMB",cacheSize];
        }
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO animated:YES];
    
    if (indexPath.section == 3) {
        if (indexPath.row == 3) {
            [[SDImageCache sharedImageCache] clearDisk];
            [[DSXUI standardUI] showPopViewWithStyle:DSXPopViewStyleDefault Message:@"已成功清除缓存"];
            [_tableView reloadData];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}

#pragma mark -
- (void)userStatusChanged{
    [self setHeadView];
    [_tableView reloadData];
}

- (void)showLogin{
//    [[UserStatus sharedStatus] showLoginFromViewController:self];
}

#pragma mark - navigationController delegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController == self) {
        self.navigationController.navigationBarHidden = YES;
    }else {
        self.navigationController.navigationBarHidden = NO;
    }
}

@end
