//
//  AnimationScaleMaker_lib.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/7.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationBaseMaker_lib.h"
#import "AnimationScaleComponent_lib.h"


/**
 缩放动画制造器
 */
@interface AnimationScaleMaker_lib : AnimationBaseMaker_lib


/**
 缩放
 */
- (AnimationScaleComponent_lib *(^)(CGFloat factor))ani_addFactor;


/**
 缩放
 */
- (AnimationScaleComponent_lib *(^)(CATransform3D transform))ani_addTransform3D;
@end
