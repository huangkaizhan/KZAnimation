//
//  AnimationScaleComponent_lib.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/7.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationBaseComponent_lib.h"

@class AnimationScaleMaker_lib;

@interface AnimationScaleComponent_lib : AnimationBaseComponent_lib

/**
 添加开始时间
 */
- (AnimationScaleMaker_lib *(^)(CGFloat time))atTime;


@end
