//
//  AnimationScaleMaker_lib.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/7.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationScaleMaker_lib.h"

@interface AnimationScaleMaker_lib ()

// 组件构造器
@property (nonatomic, strong) AnimationScaleComponent_lib *componentMaker;

@end

@implementation AnimationScaleMaker_lib

// 缩放
- (AnimationScaleComponent_lib *(^)(CGFloat factor))ani_addFactor
{
    Ani_AddValue(weakSelf.componentMaker)
}

// 缩放
- (AnimationScaleComponent_lib *(^)(CATransform3D transform))ani_addTransform3D
{
    Ani_AddTransform(weakSelf.componentMaker)
}

#pragma mark - 懒加载

Ani_CreateComponentMaker(AnimationScaleComponent_lib)

- (AnimationType_lib)animationType
{
    return AnimationType_libScale;
}

@end
