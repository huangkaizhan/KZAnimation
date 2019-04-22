//
//  AnimationOpacityMaker_lib.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationOpacityMaker_lib.h"

@interface AnimationOpacityMaker_lib ()

// 组件构造器
@property (nonatomic, strong) AnimationOpacityComponent_lib *componentMaker;

@end

@implementation AnimationOpacityMaker_lib

/**
 透明度
 */
- (AnimationOpacityComponent_lib *(^)(CGFloat opacity))ani_addOpacity
{
    Ani_AddValue(weakSelf.componentMaker)
}

#pragma mark - 懒加载

Ani_CreateComponentMaker(AnimationOpacityComponent_lib)

- (AnimationType_lib)animationType
{
    return AnimationType_libOpacity;
}
@end
