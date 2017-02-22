//
//  DSXWebViewController.h
//  XingWeiForIPhone
//
//  Created by Apple on 16/8/6.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSXRefreshControl.h"
#import "UIScrollView+Refresh.h"
#import "RNCachingURLProtocol.h"

NS_ASSUME_NONNULL_BEGIN
@interface DSXWebViewController : UIViewController<UIWebViewDelegate>
@property(nonatomic, readonly)UIWebView *webView;
@property(nonatomic, retain)NSURL *url;
@property(nonatomic, retain)NSURLRequest *request;
@property(nonatomic, assign)BOOL enableRefresh;
@property(nonatomic, assign)BOOL enableLoadMore;
@property(nonatomic, readonly)DSXRefreshHeader *refreshHeaderView;
@property(nonatomic, readonly)DSXRefreshFooter *refreshFooterView;

- (instancetype)init;
//设置刷新项
- (void)setRefreshTarget:(nullable id)target action:(nullable SEL)action;
//设置加载项
- (void)setLoadMoreTarget:(nullable id)target action:(nullable SEL)action;

@end
NS_ASSUME_NONNULL_END
