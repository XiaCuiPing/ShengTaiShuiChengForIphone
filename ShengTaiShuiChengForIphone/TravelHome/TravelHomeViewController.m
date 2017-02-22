//
//  TravelHomeViewController.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/22.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "TravelHomeViewController.h"

@interface TravelHomeViewController ()

@end

@implementation TravelHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"旅游之家"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://zhanggp.gotoip2.com/member/travel_family.html"]];
    [self.webView loadRequest:request];
    
    
}


@end
