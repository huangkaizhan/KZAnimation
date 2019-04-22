//
//  AnimationMoveMaker.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/4.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationBaseMaker_lib.h"
#import "AnimationTranslationComponent_lib.h"

/**
 移动动画构造器
 */
@interface AnimationTranslationMaker_lib : AnimationBaseMaker_lib

/**
 动画添加x值和y值，生成point的value
 */
- (AnimationTranslationComponent_lib *(^)(CGFloat x, CGFloat y))ani_addXY;

/**
 平移
 */
- (AnimationTranslationComponent_lib *(^)(CATransform3D transform))ani_addTransform3D;

@end
