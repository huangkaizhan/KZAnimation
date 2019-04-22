//
//  AnimationBoundsComponent_lib.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationBaseComponent_lib.h"

@class AnimationBoundsMaker_lib;

@interface AnimationBoundsComponent_lib : AnimationBaseComponent_lib

/**
 添加开始时间
 */
- (AnimationBoundsMaker_lib *(^)(CGFloat time))atTime;

@end
