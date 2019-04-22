//
//  AnimationValueComponent.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/4.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationBaseComponent_lib.h"
#import "AnimationBaseMaker_lib.h"
#import "AnimationModel_lib.h"

@implementation AnimationBaseComponent_lib

/**
 添加开始时间
 */
- (id(^)(CGFloat time))atTime
{
    NSAssert(1 == 2, @"请继承");
    return nil;
}

- (void)dealloc
{
    NSLog(@"component = %@ dealloc",self);
}

/**
 添加开始时间
 */
- (AnimationBaseMaker_lib *(^)(NSMutableArray *keyTimes))atKeyTimes
{
    __weak AnimationBaseMaker_lib *maker = (AnimationBaseMaker_lib *)self.maker;
    __weak typeof (self) weakSelf = self;
    return ^(NSMutableArray *keyTimes){
        weakSelf.animationModel.keyTimes = keyTimes;
        return maker;
    };
}

@end
