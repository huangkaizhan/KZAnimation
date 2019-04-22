//
//  AnimationModel_lib.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/4.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AnimationHeader_lib.h"


@interface AnimationModel_lib : NSObject

// 动画资源类型
@property (nonatomic, assign) AnimationSourcesType_lib sourceType;

/** 动动画路径 */
@property (nonatomic, copy, readonly) NSString *keyPath;

/** 动画类型 */
@property (nonatomic, assign) AnimationType_lib animationType;

/** 动画值数组 */
@property (nonatomic, strong) NSMutableArray *keyValues;

/** 时间数组 */
@property (nonatomic, strong) NSMutableArray *keyTimes;

/** 
 开始时间
 默认为普通动画默认为CACurrentMediaTime()
 视频动画默认为AVCoreAnimationBeginTimeAtZero()
 */
@property (nonatomic, assign) CGFloat beginTime;

// 重复次数
@property (nonatomic, assign) CGFloat repeatCount;

/** 动画时长, 默认2.0*/
@property (nonatomic, assign) CGFloat duration;

// 是否恢复原位
@property (nonatomic, assign) BOOL removedOnCompletion;

@end
