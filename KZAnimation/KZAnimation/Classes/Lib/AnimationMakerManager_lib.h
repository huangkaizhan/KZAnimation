//
//  AnimationMakerManager_lib.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/4.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "AnimationHeader_lib.h"
// 动画制造器
#import "AnimationTranslationMaker_lib.h"
#import "AnimationScaleMaker_lib.h"
#import "AnimationRotationMaker_lib.h"
#import "AnimationBoundsMaker_lib.h"
#import "AnimationOpacityMaker_lib.h"
#import "AnimationBackColorMaker_lib.h"
#import "AnimationCornerRadiusMaker_lib.h"

@interface AnimationMakerManager_lib : NSObject

// 添加计数
@property (nonatomic, assign) NSInteger group;

// 动画资源类型
@property (nonatomic, assign) AnimationSourcesType_lib sourceType;

#pragma mark - 初始化
/**
 初始化

 @param layer 层
 @return Maker管理器
 */
- (instancetype)initWithAnimationLayer:(CALayer *)layer;


#pragma mark - 添加动画
/**
 移动

 @return 移动构造器
 */
- (AnimationTranslationMaker_lib *(^)(CGFloat duration))ani_translateInDuration;

/**
 缩放
 
 @return 缩放构造器
 */
- (AnimationScaleMaker_lib *(^)(CGFloat duration))ani_scaleInDuration;

/**
 旋转(Z轴)
 
 @return 旋转构造器
 */
- (AnimationRotationMaker_lib *(^)(CGFloat duration))ani_rotateInDuration;

/**
 旋转(X轴)
 
 @return 旋转构造器
 */
- (AnimationRotationMaker_lib *(^)(CGFloat duration))ani_rotateXInDuration;

/**
 旋转(Y轴)
 
 @return 旋转构造器
 */
- (AnimationRotationMaker_lib *(^)(CGFloat duration))ani_rotateYInDuration;

/**
 bounds大小
 
 @return bounds构造器
 */
- (AnimationBoundsMaker_lib *(^)(CGFloat duration))ani_boundsInDuration;

/**
 透明度
 
 @return 透明度构造器
 */
- (AnimationOpacityMaker_lib *(^)(CGFloat duration))ani_opacityInDuration;

/**
 背景色
 
 @return 背景色构造器
 */
- (AnimationBackColorMaker_lib *(^)(CGFloat duration))ani_backColorInDuration;

/**
 圆角
 
 @return 圆角构造器
 */
- (AnimationCornerRadiusMaker_lib *(^)(CGFloat duration))ani_cornerRadiusInDuration;



#pragma mark - 其它
/**
 添加组动画完成block

 @param completionBlock 组动画完成回调
 */
- (void)addCompletionBlock:(BlockWithObject_Ani)completionBlock;



@end
