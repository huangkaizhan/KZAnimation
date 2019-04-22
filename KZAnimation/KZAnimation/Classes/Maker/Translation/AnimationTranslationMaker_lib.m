//
//  AnimationMoveMaker.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/4.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationTranslationMaker_lib.h"



@interface AnimationTranslationMaker_lib ()

// 组件构造器
@property (nonatomic, strong) AnimationTranslationComponent_lib *componentMaker;

@end

@implementation AnimationTranslationMaker_lib

// 动画添加x值和y值，生成point的value
- (AnimationTranslationComponent_lib *(^)(CGFloat x, CGFloat y))ani_addXY
{
    Ani_AddXY(weakSelf.componentMaker)
}

// 平移
- (AnimationTranslationComponent_lib *(^)(CATransform3D transform))ani_addTransform3D
{
    Ani_AddTransform(weakSelf.componentMaker)
}

#pragma mark - 懒加载


Ani_CreateComponentMaker(AnimationTranslationComponent_lib)

- (AnimationType_lib)animationType
{
    return AnimationType_libMove;
}
@end
