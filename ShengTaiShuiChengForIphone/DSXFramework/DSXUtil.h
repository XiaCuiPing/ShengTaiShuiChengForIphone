//
//  DSXUtil.h
//  YuShuiHePan
//
//  Created by songdewei on 15/10/5.
//  Copyright © 2015年 yushuihepan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DSXCLLocationManager.h"
#import "NSString+Encryption.h"

@interface DSXUtil : NSObject

+ (instancetype)sharedUtil;
+ (void)nslogData:(NSData *)data;
+ (NSString *)encodeURL:(NSString *)urlString;
+ (NSString *)dictionaryToQuerystring:(NSDictionary *)dict;
+ (NSDictionary *)parseQueryString:(NSString *)query;
+ (NSDictionary *)getCoordinateParam;
+ (NSString *)getFormHashWithKey:(NSString *)authKey;

@end
