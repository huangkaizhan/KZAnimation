//
//  AnimationBackColorMaker_lib.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationBackColorMaker_lib.h"

@interface AnimationBackColorMaker_lib ()

// 组件构造器
@property (nonatomic, strong) AnimationBackColorComponent_lib *componentMaker;

@end

@implementation AnimationBackColorMaker_lib

/**
 透明度
 */
- (AnimationBackColorComponent_lib *(^)(UIColor *backColor))ani_addBackColor
{
    if (!self.isCanAdd) {
        NSAssert(self.isCanAdd, @"上一个动画制造器没有执行end");
    }
    __weak typeof (self) weakSelf = self;
    return ^(UIColor *backColor){
        [weakSelf.animationModel.keyValues addObject:(id)backColor.CGColor];
        return weakSelf.componentMaker;
    };
}

#pragma mark - 懒加载

Ani_CreateComponentMaker(AnimationBackColorComponent_lib)

- (AnimationType_lib)animationType
{
    return AnimationType_libBackColor;
}

@end
