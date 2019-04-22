//
//  AnimationOpacityMaker_lib.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationBaseMaker_lib.h"
#import "AnimationOpacityComponent_lib.h"




@interface AnimationOpacityMaker_lib : AnimationBaseMaker_lib

/**
 透明度
 */
- (AnimationOpacityComponent_lib *(^)(CGFloat opacity))ani_addOpacity;

@end
