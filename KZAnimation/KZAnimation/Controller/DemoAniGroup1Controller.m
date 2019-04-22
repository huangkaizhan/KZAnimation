//
//  DemoAniGroup1Controller.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "DemoAniGroup1Controller.h"

@interface DemoAniGroup1Controller ()

@end

@implementation DemoAniGroup1Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    
    
    
    // 组动画，可以添加多个动画，如下面同时添加了 平移和缩放 动画
    // completion: 组动画完成才会调用，下面有两组，两组完成 才调用 compleiton
    // 如果想要每个动画完成回调，有需要告诉我咯，有埋，懒得做了
    [self.aniView.layer ani_make:^(AnimationMakerManager_lib *maker) {
        maker.ani_translateInDuration(3.0)
        .ani_addXY(0, 0).atTime(0.0f)
        .ani_addXY(200, 0).atTime(0.7f)
        .ani_addXY(200, 110).atTime(0.9f)
        .end();
        
        maker.ani_scaleInDuration(2.0)
        .ani_addFactor(1.0).atTime(0.0f)
        .ani_addFactor(4.0).atTime(0.3)
        .ani_addFactor(2.0).atTime(1)
        .ani_BeginTime(CACurrentMediaTime() + 0.5f)
        .end();
        
        
    } completion:^(AnimationMakerManager_lib *maker) {
        NSLog(@"1");
    }];
}
@end
