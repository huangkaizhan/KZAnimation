//
//  AnimationFrameComponent_lib.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationBaseComponent_lib.h"

@class AnimationFrameMaker_lib;

@interface AnimationFrameComponent_lib : AnimationBaseComponent_lib

/**
 添加开始时间
 */
- (AnimationFrameMaker_lib *(^)(CGFloat time))atTime;

@end
