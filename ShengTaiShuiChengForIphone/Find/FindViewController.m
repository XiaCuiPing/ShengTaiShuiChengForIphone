//
//  FindViewController.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/20.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController ()

@end

@implementation FindViewController

@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor bgColor]];
    
    UIBarButtonItem *moreButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon-info.png"] style:UIBarButtonItemStyleDone target:self action:@selector(showMessage)];
    self.navigationItem.rightBarButtonItem = moreButton;
    
    DSXSearchBar *searchBar = [[DSXSearchBar alloc] init];
    searchBar.placeholder = @"目的地/话题等标签";
    searchBar.tintColor = [UIColor whiteColor];
    searchBar.textField.backgroundColor = [UIColor whiteColor];
    searchBar.textField.textColor = [UIColor colorWithHexString:@"0x9C9C9D"];
//    searchBar.textField.layer.masksToBounds = YES;
    searchBar.textField.layer.cornerRadius = 13.0;
    [searchBar.textField setValue:[UIColor colorWithHexString:@"#CCCCCC"] forKeyPath:@"_placeholderLabel.textColor"];
    self.navigationItem.titleView = searchBar;
    
    //按钮
    _category = [[CategoryView alloc] initWithFrame:CGRectMake(0, 0, SWIDTH, 140)];
    _category.backgroundColor = [UIColor whiteColor];
    CGFloat cellWidth = SWIDTH/4-0.01;
    _category.cellSize = CGSizeMake(cellWidth, 140);
    _category.imageSize = CGSizeMake(60, 60);
    NSString *path = [[NSBundle mainBundle] pathForResource:@"FindCategory" ofType:@"plist"];
    NSArray *dataLists = [NSArray arrayWithContentsOfFile:path];
    
    _category.dataList = dataLists;
    _category.delegate = self;
    [self.view addSubview:_category];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = _category;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"aCell"];
    
}


- (void)showMessage
{

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aCell" forIndexPath:indexPath];
    return cell;
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
    return 10;
}



@end
