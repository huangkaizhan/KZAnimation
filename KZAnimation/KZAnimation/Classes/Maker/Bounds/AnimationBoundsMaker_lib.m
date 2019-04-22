//
//  AnimationBoundsMaker.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationBoundsMaker_lib.h"

@interface AnimationBoundsMaker_lib ()

// 组件构造器
@property (nonatomic, strong) AnimationBoundsComponent_lib *componentMaker;

@end

@implementation AnimationBoundsMaker_lib

// 缩放
- (AnimationBoundsComponent_lib *(^)(CGFloat width, CGFloat height))ani_addWidthHeight
{
    Ani_AddBounds(weakSelf.componentMaker)
}

#pragma mark - 懒加载

Ani_CreateComponentMaker(AnimationBoundsComponent_lib)

- (AnimationType_lib)animationType
{
    return AnimationType_libBounds;
}

@end
