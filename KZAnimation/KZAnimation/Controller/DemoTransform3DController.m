//
//  DemoTransform3DController.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "DemoTransform3DController.h"

@interface DemoTransform3DController ()
// <#zhushi#>
@property (nonatomic, strong) UILabel *textLabel;
@end

@implementation DemoTransform3DController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.aniView.layer.anchorPoint = CGPointMake(0.5, 0);
    self.aniView.bounds = CGRectMake(0, 0, self.aniView.frame.size.width, 30);
    self.aniView.backgroundColor = [UIColor blackColor];
    self.aniView.alpha = 0.9;
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:16];
    label.text = @"摇摆摇摆";
    label.textAlignment = NSTextAlignmentCenter;
    self.textLabel = label;
    [self.view addSubview:label];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.textLabel.frame = CGRectMake(self.aniView.layer.frame.origin.x -2, self.aniView.layer.frame.origin.y - 2, self.aniView.layer.frame.size.width, self.aniView.layer.frame.size.height);
}

- (void)beginAnimation
{

//    [self testLib];
    
    [self.textLabel ani_make:^(AnimationMakerManager_lib *maker) {
        maker.ani_translateInDuration(2.0)
        .ani_addXY(0, 0).atTime(0.0f)
        .ani_addXY(3, 0).atTime(1.0f)
        .end();
    }];
    
    
    // 这个动画是摇摆动画
    [self addSwingAnimation];
}

// 摇摆动画
- (void)addSwingAnimation
{
    [self.aniView ani_make:^(AnimationMakerManager_lib *maker) {
        maker.ani_rotateXInDuration(1.5f)
        .ani_addAngle(0.0f).atTime(0.f)
        .ani_addAngle(35.0f).atTime(0.25f)
        .ani_addAngle(-30.f).atTime(0.5f)
        .ani_addAngle(20.f).atTime(0.7)
        .ani_addAngle(-15.f).atTime(0.85)
        .ani_addAngle(0.0f).atTime(1.0f)
        .end();
    }];
}

- (void)testLib
{
        // 1.动画加到layer上
        // 2.以ani_前缀开头
        // 3.每个动画完成需调用end方法添加到layer上
        // 4.目前封装的是帧动画
        // 5.atTime
        // 5.0 添加到keytimes数组中，它指的是时间帧，而不是开始时间或时长，
        // 5.1 后续添加的值不能比前一个atTime大,否则无效
        // 5.2 添加的值从0到1
    #warning 待完善
        [self.aniView ani_make:^(AnimationMakerManager_lib *maker) {
    
    //        maker.ani_scaleInDuration(2.0)
    //        .ani_addTransform3D(CATransform3DIdentity).atTime(0.0f)
    //        .ani_addTransform3D(CATransform3DMakeScale(2.0, 2.0, 2.0)).atTime(0.3f)
    //        .end();
    
            maker.ani_rotateInDuration(2.0)
    //        .ani_addTransform3D(self.aniView.layer.transform).atTime(0.3f)
            .ani_addTransform3D(CATransform3DMakeRotation(Ani_DegreesToRadian(90), -1.0, -1.0, -1.0)).atTime(1.0f)
            .end();
    //
    //        maker.ani_translateInDuration(2.0)
    //        .ani_addTransform3D(CATransform3DIdentity).atTime(0.0f)
    //        .ani_addTransform3D(CATransform3DMakeTranslation(<#CGFloat tx#>, <#CGFloat ty#>, <#CGFloat tz#>))
        }];
}

@end
