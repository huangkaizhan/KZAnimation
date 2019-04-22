//
//  AnimationRotationComponent_lib.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/10.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationBaseComponent_lib.h"

@class AnimationRotationMaker_lib;

@interface AnimationRotationComponent_lib : AnimationBaseComponent_lib

/**
 添加开始时间
 */
- (AnimationRotationMaker_lib *(^)(CGFloat time))atTime;


@end
