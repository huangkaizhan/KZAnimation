//
//  AnimationCreater.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/4.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimationModel_lib.h"

@interface AnimationCreater_lib : NSObject


/**
 根据动画模型创建帧动画对象

 @param model 动画模型
 @return 帧动画
 */
+ (CAKeyframeAnimation *)createKeyFrameAnimationWithModel:(AnimationModel_lib *)model;

@end
