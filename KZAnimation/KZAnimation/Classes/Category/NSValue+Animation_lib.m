//
//  NSValue+Animation_lib.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/7.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "NSValue+Animation_lib.h"

@implementation NSValue (Animation_lib)

+ (instancetype)valueWithX:(CGFloat)x y:(CGFloat)y
{
    return [self valueWithCGPoint:CGPointMake(x, y)];
}

+ (instancetype)valueWithWidth:(CGFloat)width height:(CGFloat)height
{
    return [self valueWithCGSize:CGSizeMake(width, height)];
}

+ (instancetype)valueWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height
{
    return [self valueWithCGRect:CGRectMake(x, y, width, height)];
}

@end
