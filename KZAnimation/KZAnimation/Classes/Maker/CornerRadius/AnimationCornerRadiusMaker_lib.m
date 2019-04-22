//
//  AnimationCornerRadiusMaker_lib.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationCornerRadiusMaker_lib.h"

@interface AnimationCornerRadiusMaker_lib ()

// 组件构造器
@property (nonatomic, strong) AnimationCornerRadiusComponent_lib *componentMaker;

@end

@implementation AnimationCornerRadiusMaker_lib

/**
 圆角
 */
- (AnimationCornerRadiusComponent_lib *(^)(CGFloat radius))ani_addRadius
{
    Ani_AddValue(weakSelf.componentMaker)
}

#pragma mark - 懒加载

Ani_CreateComponentMaker(AnimationCornerRadiusComponent_lib)

- (AnimationType_lib)animationType
{
    return AnimationType_libCornerRadius;
}

@end
