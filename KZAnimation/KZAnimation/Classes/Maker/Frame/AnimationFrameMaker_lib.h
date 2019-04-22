//
//  AnimationFrameMaker_lib.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationBaseMaker_lib.h"
#import "AnimationFrameComponent_lib.h"

@interface AnimationFrameMaker_lib : AnimationBaseMaker_lib

/**
 大小
 */
- (AnimationFrameComponent_lib *(^)(CGRect frame))ani_addFrame;

@end
