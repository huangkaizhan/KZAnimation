//
//  AnimationCornerRadiusMaker_lib.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationBaseMaker_lib.h"
#import "AnimationCornerRadiusComponent_lib.h"

@interface AnimationCornerRadiusMaker_lib : AnimationBaseMaker_lib

/**
 圆角
 */
- (AnimationCornerRadiusComponent_lib *(^)(CGFloat radius))ani_addRadius;


@end
