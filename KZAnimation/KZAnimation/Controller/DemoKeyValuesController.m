//
//  DemoKeyValuesController.m
//  MMAnimation
//
//  Created by huangkaizhan on 2017/3/14.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import "DemoKeyValuesController.h"
#import <AVFoundation/AVFoundation.h>
@interface DemoKeyValuesController ()

@end

@implementation DemoKeyValuesController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// 开始动画
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
    NSValue *value = [NSValue valueWithX:0 y:0];
    NSValue *value1 = [NSValue valueWithX:200 y:0];
    NSValue *value2 = [NSValue valueWithX:200 y:110];
    NSMutableArray *keyValues = [NSMutableArray arrayWithObjects:value, value1, value2, nil];
    NSMutableArray *keyTimes = [NSMutableArray arrayWithArray:@[@0.0f, @0.7f, @0.9f]];
    [self.aniView.layer ani_makeForVideo:^(AnimationMakerManager_lib *maker) {
        maker.ani_translateInDuration(3.0)
        .ani_addKeyValues(keyValues).atKeyTimes(keyTimes)
        .ani_BeginTime(AVCoreAnimationBeginTimeAtZero)
        .end();
    } completion:^(AnimationMakerManager_lib *maker) {
        
    }];
}


@end
