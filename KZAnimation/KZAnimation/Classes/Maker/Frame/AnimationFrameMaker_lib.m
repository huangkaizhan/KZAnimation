//
//  AnimationFrameMaker_lib.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationFrameMaker_lib.h"
#import "CALayer+Animation_lib.h"

@interface AnimationFrameMaker_lib ()

// 组件构造器
@property (nonatomic, strong) AnimationFrameComponent_lib *componentMaker;

@end

@implementation AnimationFrameMaker_lib


- (AnimationFrameComponent_lib *(^)(CGRect frame))ani_addFrame
{
    if (!self.isCanAdd) {
        NSAssert(self.isCanAdd, @"上一个动画制造器没有执行end");
    }
    __weak typeof (self) weakSelf = self;
    return ^(CGRect frame){
        [weakSelf.animationLayer ani_make:^(AnimationMakerManager_lib *maker) {
            maker.ani_boundsInDuration(weakSelf.duration)
            .ani_addWidthHeight(weakSelf.animationLayer.bounds.size.width, weakSelf.animationLayer.bounds.size.height).atTime(0.0)
            .ani_addWidthHeight(frame.size.width, frame.size.height).atTime(1.0)
            .end();
            
            maker.ani_translateInDuration(weakSelf.duration)
            .ani_addXY(weakSelf.animationLayer.frame.origin.x ,weakSelf.animationLayer.frame.origin.y).atTime(0.0)
            .ani_addXY(frame.origin.x - weakSelf.animationLayer.frame.origin.x , frame.origin.y - weakSelf.animationLayer.frame.origin.y).atTime(1.0)
            .end();
        }];
        
//        [weakSelf.animationModel.keyValues addObject:[NSValue valueWithCGRect:frame]];
        return weakSelf.componentMaker;
    };
//    Ani_AddRect(weakSelf.componentMaker)
}

#pragma mark - 懒加载

Ani_CreateComponentMaker(AnimationFrameComponent_lib)

- (AnimationType_lib)animationType
{
    return AnimationType_libBounds;
}

@end
