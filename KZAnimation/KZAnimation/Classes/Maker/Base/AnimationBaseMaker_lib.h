//
//  AnimationBaseMaker.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/4.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AnimationModel_lib.h"
#import "AnimationHeader_lib.h"
#import "AnimationBaseComponent_lib.h"
#import "AnimationCreater_lib.h"

@interface AnimationBaseMaker_lib : NSObject<AnimationMakerDelegate_lib,CAAnimationDelegate>

// 动画模型
@property (nonatomic, strong) AnimationModel_lib *animationModel;

// 是否可以添加动画
@property (nonatomic, assign) BOOL isCanAdd;

// 当前动画视图
@property (nonatomic, weak) CALayer *animationLayer;

//// 完成block
//@property (nonatomic, copy) BlockWithObject_Ani completionBlock;


// 时长
@property (nonatomic, assign) CGFloat duration;

// 第几组
@property (nonatomic, assign) NSInteger group;

// 动画是否添加完成
@property (nonatomic, assign) KVO_Ani BOOL isAdded;

// 动画是否演出完成
@property (nonatomic, assign) KVO_Ani BOOL isAnimated;

/**
 添加动画结束
 */
- (instancetype(^)())end;


/**
 开始时间
 普通动画默认为CACurrentMediaTime()
 视频动画默认为AVCoreAnimationBeginTimeAtZero
 */
- (AnimationBaseMaker_lib *(^)(CGFloat beginTime))ani_BeginTime;

/**
 重复次数，默认为1
 */
- (AnimationBaseMaker_lib *(^)(CGFloat repeatCount))ani_RepeatCount;

/**
 恢复原状，默认不恢复
 */
- (AnimationBaseMaker_lib *(^)(BOOL removedOnCompletion))ani_RemovedOnCompletion;


/**
 添加keyValue
 */
- (AnimationBaseComponent_lib *(^)(NSMutableArray *keyValues))ani_addKeyValues;


/**
 动画完成
 */
- (void)completion;

@end
