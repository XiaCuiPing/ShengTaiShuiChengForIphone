//
//  DSXWebViewController.m
//  XingWeiForIPhone
//
//  Created by Apple on 16/8/6.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "DSXWebViewController.h"
#import "UIColor+color.h"
#import "DSXActivityIndicator.h"
#import "DSXUI.h"

@implementation DSXWebViewController
@synthesize webView = _webView;
@synthesize url = _url;
@synthesize request = _request;
@synthesize enableRefresh = _enableRefresh;
@synthesize enableLoadMore = _enableLoadMore;
@synthesize refreshHeaderView = _refreshHeaderView;
@synthesize refreshFooterView = _refreshFooterView;

- (instancetype)init{
    if (self = [super init]) {
        _webView = [[UIWebView alloc] init];
        [_webView loadHTMLString:@"<html><head><title></title></head><body></body></html>" baseURL:nil];
        _refreshHeaderView = [[DSXRefreshHeader alloc] init];
        _refreshFooterView = [[DSXRefreshFooter alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView.delegate = self;
    _webView.frame = self.view.bounds;
    _webView.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
    _webView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _webView.scrollView.showsHorizontalScrollIndicator = NO;
    _webView.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_webView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //[[DSXActivityIndicator sharedIndicator] showViewWithTitle:nil];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //[[DSXActivityIndicator sharedIndicator] hide];
}

- (void)setUrl:(NSURL *)url{
    _url = url;
    [self setRequest:[NSURLRequest requestWithURL:url]];
}

- (void)setRequest:(NSURLRequest *)request{
    _request = request;
    [_webView loadRequest:_request];
}

- (void)setEnableRefresh:(BOOL)enableRefresh{
    _enableRefresh = enableRefresh;
    if (enableRefresh) {
        _webView.scrollView.dsx_header = _refreshHeaderView;
    }else {
        _webView.scrollView.dsx_footer = nil;
    }
}

- (void)setEnableLoadMore:(BOOL)enableLoadMore{
    _enableLoadMore = enableLoadMore;
    if (enableLoadMore) {
        _webView.scrollView.dsx_footer = _refreshFooterView;
    }else {
        _webView.scrollView.dsx_footer = nil;
    }
}

- (void)setRefreshTarget:(id)target action:(SEL)action{
    [_refreshHeaderView setTarget:target action:action];
}

- (void)setLoadMoreTarget:(id)target action:(SEL)action{
    [_refreshFooterView setTarget:target action:action];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
@end
