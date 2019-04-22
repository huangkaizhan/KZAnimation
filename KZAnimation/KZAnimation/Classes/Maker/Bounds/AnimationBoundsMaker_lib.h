//
//  AnimationBoundsMaker.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationBaseMaker_lib.h"
#import "AnimationBoundsComponent_lib.h"

@interface AnimationBoundsMaker_lib : AnimationBaseMaker_lib

/**
 大小
 */
- (AnimationBoundsComponent_lib *(^)(CGFloat width, CGFloat height))ani_addWidthHeight;

@end
