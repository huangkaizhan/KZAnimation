//
//  DemoTranslationController.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "DemoTranslationController.h"

@interface DemoTranslationController ()

@end

@implementation DemoTranslationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

// 开始动画
- (void)beginAnimation
{
//    // 1.动画加到layer上
//    // 2.以ani_前缀开头
//    // 3.每个动画完成需调用end方法添加到layer上
//    // 4.目前封装的是帧动画
//    // 5.atTime
//    // 5.0 添加到keytimes数组中，它指的是时间帧，而不是开始时间或时长，
//    // 5.1 后续添加的值不能比前一个atTime大,否则无效
//    // 5.2 添加的值从0到1
//    [self.aniView ani_make:^(AnimationMakerManager_lib *maker) {
//        maker.ani_translateInDuration(3.0)
//        .ani_addXY(0, 0).atTime(0.0f)
//        .ani_addXY(200, 0).atTime(0.7f)
//        .ani_addXY(200, 110).atTime(0.9f)
//        .end();
//    }];
    
    // 动画完毕恢复原来位置
    [self.aniView ani_make:^(AnimationMakerManager_lib *maker) {
        maker.ani_translateInDuration(3.0)
        .ani_addXY(0, 0).atTime(0.0f)
        .ani_addXY(50, 0).atTime(0.4f)
        .ani_addXY(50,0).atTime(0.6f)
        .ani_addXY(100,0).atTime(1.0f)
        .ani_RemovedOnCompletion(YES)
        .ani_RepeatCount(CGFLOAT_MAX)
        .end();
    }];
}

@end
