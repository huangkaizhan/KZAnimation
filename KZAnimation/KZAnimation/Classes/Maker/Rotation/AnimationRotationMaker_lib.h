//
//  AnimationRotationMaker_lib.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/10.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationBaseMaker_lib.h"
#import "AnimationRotationComponent_lib.h"

@interface AnimationRotationMaker_lib : AnimationBaseMaker_lib


/**
 旋转
 */
- (AnimationRotationComponent_lib *(^)(CGFloat angle))ani_addAngle;

/**
 旋转
 */
- (AnimationRotationComponent_lib *(^)(CATransform3D transform))ani_addTransform3D;
@end
