//
//  AnimationCreater.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/4.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationCreater_lib.h"

@implementation AnimationCreater_lib

+ (CAKeyframeAnimation *)createKeyFrameAnimationWithModel:(AnimationModel_lib *)model
{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:model.keyPath];
    keyAnimation.duration = model.duration;
    keyAnimation.values = model.keyValues;
    keyAnimation.keyTimes = model.keyTimes;
    keyAnimation.beginTime = model.beginTime;
    if (!model.removedOnCompletion) {
        keyAnimation.removedOnCompletion = NO;
        keyAnimation.fillMode = kCAFillModeForwards;
    }
    keyAnimation.repeatCount = model.repeatCount;
    return keyAnimation;
}

@end
