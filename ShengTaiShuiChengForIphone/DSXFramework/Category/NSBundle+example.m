//
//  NSBundle+example.m
//  DSXFramework
//
//  Created by songdewei on 2016/12/3.
//  Copyright © 2016年 DashiXiong. All rights reserved.
//

#import "NSBundle+example.h"

@implementation NSBundle(example)

+ (UIImage *)imageWithBundleName:(NSString *)bundleName imageNamed:(NSString *)imageName{
    NSString *path = [[self mainBundle] pathForResource:bundleName ofType:@"bundle"];
    return [UIImage imageWithContentsOfFile:[path stringByAppendingFormat:@"/%@", imageName]];
}

@end
