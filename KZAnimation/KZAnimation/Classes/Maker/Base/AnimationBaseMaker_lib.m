//
//  AnimationBaseMaker.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/4.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationBaseMaker_lib.h"
#import "AnimationMakerManager_lib.h"

@interface AnimationBaseMaker_lib ()
// <#zhushi#>
@property (nonatomic, strong) AnimationBaseComponent_lib *componentMaker;

@end

@implementation AnimationBaseMaker_lib

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isCanAdd = YES;
    }
    return self;
}

- (AnimationModel_lib *)animationModel
{
    if (!_animationModel) {
        _animationModel = [[AnimationModel_lib alloc] init];
    }
    _animationModel.duration = self.duration;
    return _animationModel;
}

/**
 添加值
 */
- (id(^)(NSValue *value))addValue
{
    NSAssert(1 == 2, @"请继承");
    return nil;
}

//- (instancetype(^)(BlockWithObject_Ani completionBlock))end
//{
//    self.isCanAdd = YES;
//    return nil;
//}

- (AnimationType_lib)animationType
{
    NSAssert(1 == 2, @"请继承");
    return AnimationType_libMove;
}

/**
 添加动画结束
 */
- (instancetype(^)())end
{
    WeakSelf_Ani
    self.isCanAdd = YES;
    self.isAdded = YES;
    self.animationModel.animationType = self.animationType;
    CAKeyframeAnimation *animation = [AnimationCreater_lib createKeyFrameAnimationWithModel:weakSelf.animationModel];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.delegate = weakSelf;
    weakSelf.animationModel = nil;
    [weakSelf.animationLayer addAnimation:animation forKey:nil];
    //        weakSelf.completionBlock = completionBlock;
    return ^(){
        return weakSelf;
    };
}


// 开始时间
- (AnimationBaseMaker_lib *(^)(CGFloat beginTime))ani_BeginTime
{
    WeakSelf_Ani
    return ^(CGFloat beginTime){
        weakSelf.animationModel.beginTime = beginTime;
        return weakSelf;
    };
}

// 重复次数
- (AnimationBaseMaker_lib *(^)(CGFloat repeatCount))ani_RepeatCount
{
    WeakSelf_Ani
    return ^(CGFloat repeatCount){
        weakSelf.animationModel.repeatCount = repeatCount;
        return weakSelf;
    };
}

// 恢复原状，默认不恢复
- (AnimationBaseMaker_lib *(^)(BOOL removedOnCompletion))ani_RemovedOnCompletion
{
    WeakSelf_Ani
    return ^(BOOL removedOnCompletion){
        weakSelf.animationModel.removedOnCompletion = removedOnCompletion;
        return weakSelf;
    };
}

// 添加keyValue
- (AnimationBaseComponent_lib *(^)(NSMutableArray *keyValues))ani_addKeyValues
{
    if (!self.isCanAdd) {
        NSAssert(self.isCanAdd, @"上一个动画制造器没有执行end");
    }
    __weak typeof (self) weakSelf = self;
    return ^(NSMutableArray *keyValues){
        weakSelf.animationModel.keyValues = keyValues;
        return weakSelf.componentMaker;
    };
}

Ani_CreateComponentMaker(AnimationBaseComponent_lib)

#pragma mark - 动画代理
- (void)animationDidStart:(CAAnimation *)anim
{
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.isAnimated = YES;
//    [self completion];
}

// 动画完成
- (void)completion
{
//    if (self.completionBlock) {
////        BlockWithObject_Ani tempBlock = self.completionBlock;
////        self.completionBlock = nil;
////        [AnimationMakerManager_lib sharedmaker].completionBlock = nil;
////        tempBlock([AnimationMakerManager_lib sharedmaker]);
//        
//    }
}

- (void)dealloc
{
    NSLog(@"maker : %@ - dealloc", self);
}
@end
