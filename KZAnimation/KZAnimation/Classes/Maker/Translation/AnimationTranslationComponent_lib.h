//
//  AnimationTranslationComponent_lib.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/7.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationBaseComponent_lib.h"

@class AnimationTranslationMaker_lib;

@interface AnimationTranslationComponent_lib : AnimationBaseComponent_lib

/**
 添加开始时间
 */
- (AnimationTranslationMaker_lib *(^)(CGFloat time))atTime;

@end
