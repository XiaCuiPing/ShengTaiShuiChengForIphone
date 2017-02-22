//
//  DSXUtil.m
//  YuShuiHePan
//
//  Created by songdewei on 15/10/5.
//  Copyright © 2015年 yushuihepan. All rights reserved.
//

#import "DSXUtil.h"

@implementation DSXUtil

+ (instancetype)sharedUtil{
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

+ (void)nslogData:(NSData *)data{
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",string);
}

+ (NSString *)encodeURL:(NSString *)urlString{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                 (CFStringRef)urlString,
                                                                                 nil,
                                                                                 (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                 kCFStringEncodingUTF8));
}

+ (NSString *)dictionaryToQuerystring:(NSDictionary *)dict{
    NSString *str = @"";
    NSString *comma = @"";
    for (NSString *key in [dict allKeys]) {
        str = [str stringByAppendingFormat:@"%@%@=%@",comma,key,[dict objectForKey:key]];
        comma = @"&";
    }
    return str;
}

+ (NSDictionary *)parseQueryString:(NSString *)query{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSArray *array = [query componentsSeparatedByString:@"&"];
    for (NSString *param in array) {
        NSArray *arr = [param componentsSeparatedByString:@"="];
        if ([arr count] < 2) {
            [dictionary setObject:@"" forKey:arr[0]];
        }else {
            NSString *value = [arr[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            [dictionary setObject:value forKey:arr[0]];
        }
    }
    return dictionary;
}

+ (NSDictionary *)getCoordinateParam{
    NSDictionary *param;
    if ([DSXCLLocationManager locationServicesEnabled]) {
        CLLocationCoordinate2D coordinate = [[DSXCLLocationManager sharedManager] coordinate];
        NSString *longitude = [NSString stringWithFormat:@"%f",coordinate.longitude];
        NSString *latitude  = [NSString stringWithFormat:@"%f",coordinate.latitude];
        param = @{@"longitude":longitude,@"latitude":latitude};
    }else {
        param = @{@"longitude":@"0",@"latitude":@"0"};
    }
    return param;
}

+ (NSString *)getFormHashWithKey:(NSString *)authKey{
    NSString *string = [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970]];
    string = [[string substringToIndex:6] stringByAppendingString:authKey];
    return [string md5];
}

@end
