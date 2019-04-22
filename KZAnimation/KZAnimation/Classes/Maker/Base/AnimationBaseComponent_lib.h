//
//  AnimationValueComponent.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/4.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AnimationHeader_lib.h"


@class AnimationBaseMaker_lib;
@class AnimationModel_lib;

@interface AnimationBaseComponent_lib : NSObject<AnimationComponentDelegate_lib>


// 动画构造器
@property (nonatomic, weak) AnimationBaseMaker_lib *maker;

// 动画模型
@property (nonatomic, weak) AnimationModel_lib *animationModel;

/**
 添加开始时间
 */
- (AnimationBaseMaker_lib *(^)(NSMutableArray *keyTimes))atKeyTimes;

@end
