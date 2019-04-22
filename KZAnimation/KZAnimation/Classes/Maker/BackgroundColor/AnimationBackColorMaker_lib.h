//
//  AnimationBackColorMaker_lib.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationBaseMaker_lib.h"
#import "AnimationBackColorComponent_lib.h"

@interface AnimationBackColorMaker_lib : AnimationBaseMaker_lib

/**
 透明度
 */
- (AnimationBackColorComponent_lib *(^)(UIColor *backColor))ani_addBackColor;

@end
