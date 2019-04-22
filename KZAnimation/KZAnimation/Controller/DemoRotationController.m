//
//  DemoRotationController.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "DemoRotationController.h"

@interface DemoRotationController ()

@end

@implementation DemoRotationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)beginAnimation
{
    
    
    #pragma mark - 可以用下面那个动画效果试试，两个动画不同在于atTime(),一个1，另一个是0.2，造成的效果是一个不停旋转，两一个旋转一下，等会，再旋转
//    // 1.动画加到layer上
//    // 2.以ani_前缀开头
//    // 3.每个动画完成需调用end方法添加到layer上
//    // 4.目前封装的是帧动画
//    // 5.atTime
//    // 5.0 添加到keytimes数组中，它指的是时间帧，而不是开始时间或时长，
//    // 5.1 后续添加的值不能比前一个atTime大,否则无效
//    // 5.2 添加的值从0到1
//    [self.aniView ani_make:^(AnimationMakerManager_lib *maker) {
//        maker.ani_rotateInDuration(2.0)
//        .ani_addAngle(0.0f).atTime(0.0f)
//        .ani_addAngle(90.0).atTime(0.2)
//        .ani_RepeatCount(CGFLOAT_MAX)
//        .end();
//    }];
    
    // 1.动画加到layer上
    // 2.以ani_前缀开头
    // 3.每个动画完成需调用end方法添加到layer上
    // 4.目前封装的是帧动画
    // 5.atTime
    // 5.0 添加到keytimes数组中，它指的是时间帧，而不是开始时间或时长，
    // 5.1 后续添加的值不能比前一个atTime大,否则无效
    // 5.2 添加的值从0到1
    [self.aniView ani_make:^(AnimationMakerManager_lib *maker) {
        maker.ani_rotateInDuration(2.0)
        .ani_addAngle(0.0f).atTime(0.0f)
        .ani_addAngle(90.0).atTime(1.0)
        .ani_RepeatCount(CGFLOAT_MAX)
        .end();
    }];
}
@end
