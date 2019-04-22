//
//  DemoScaleController.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "DemoScaleController.h"

@interface DemoScaleController ()

@end

@implementation DemoScaleController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.aniView.layer.anchorPoint = CGPointMake(0.5, 0);
}

- (void)beginAnimation
{
    // 1.动画加到layer上
    // 2.以ani_前缀开头
    // 3.每个动画完成需调用end方法添加到layer上
    // 4.目前封装的是帧动画
    // 5.atTime
    // 5.0 添加到keytimes数组中，它指的是时间帧，而不是开始时间或时长，
    // 5.1 后续添加的值不能比前一个atTime大,否则无效
    // 5.2 添加的值从0到1
    [self.aniView ani_make:^(AnimationMakerManager_lib *maker) {
        maker.ani_scaleInDuration(2.0)
        .ani_addFactor(1.0).atTime(0.0f)
        .ani_addFactor(4.0).atTime(0.3)
        .ani_addFactor(2.0).atTime(1)
        .ani_BeginTime(CACurrentMediaTime() + 2.0f)
        .end();
        
//        maker.ani_scaleInDuration(2.0)
//        .ani_addTransform3D(1,1,1).atTime(0.0f)
//        .ani_addTransform3D(2.0f,1,1).atTime(0.3f)
//        .end();
    }];
}
@end
