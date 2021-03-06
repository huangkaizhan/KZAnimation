//
//  CALayer+Animation_lib.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/10.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AnimationMakerManager_lib.h"
#import "AnimationHeader_lib.h"

@interface CALayer (Animation_lib)

/***  动画代理*/
@property (nonatomic, strong) AnimationMakerManager_lib *aniMaker;


/**
 添加动画
 
 @param block 执行block
 @return 待续
 */
- (id)ani_make:(void(^)(AnimationMakerManager_lib *maker))block;



/**
 添加动画
 
 @param block 执行block
 @param completionBlock 动画完成block
 @return 待续
 */
- (id)ani_make:(void(^)(AnimationMakerManager_lib *maker))block completion:(void(^)(AnimationMakerManager_lib *maker))completionBlock;



/**
 添加视频动画
 
 @param block 执行block
 @param completionBlock 动画完成block
 @return 待续
 */
- (id)ani_makeForVideo:(void(^)(AnimationMakerManager_lib *maker))block completion:(void(^)(AnimationMakerManager_lib *maker))completionBlock;

@end
