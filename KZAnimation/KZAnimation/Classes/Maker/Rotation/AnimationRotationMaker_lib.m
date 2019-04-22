//
//  AnimationRotationMaker_lib.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/10.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationRotationMaker_lib.h"

@interface AnimationRotationMaker_lib ()

// 组件构造器
@property (nonatomic, strong) AnimationRotationComponent_lib *componentMaker;


@end

@implementation AnimationRotationMaker_lib

// 旋转
- (AnimationRotationComponent_lib *(^)(CGFloat angle))ani_addAngle
{
    WeakSelf_Ani
    if (!self.isCanAdd) {
        NSAssert(self.isCanAdd, @"上一个动画制造器没有执行end");
    }
    return ^(CGFloat angle){
        CGFloat radian =  Ani_DegreesToRadian(angle);
        [weakSelf.animationModel.keyValues addObject:@(radian)];
        return weakSelf.componentMaker;
    };
}

// 旋转
- (AnimationRotationComponent_lib *(^)(CATransform3D transform))ani_addTransform3D
{
    Ani_AddTransform(weakSelf.componentMaker)
}

#pragma mark - 懒加载

Ani_CreateComponentMaker(AnimationRotationComponent_lib)

- (AnimationType_lib)animationType
{
    return AnimationType_libRotate;
}

@end
