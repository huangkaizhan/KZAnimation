//
//  NSValue+Animation_lib.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/7.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSValue (Animation_lib)

+ (instancetype)valueWithX:(CGFloat)x y:(CGFloat)y;

+ (instancetype)valueWithWidth:(CGFloat)width height:(CGFloat)height;

+ (instancetype)valueWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;

@end
