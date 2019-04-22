//
//  DemoBaseAnimationController.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Animation_lib.h"
#import "CALayer+Animation_lib.h"

@interface DemoBaseAnimationController : UIViewController

// 动画view
@property (nonatomic, strong) UIView *aniView;

- (void)beginAnimation;

@end
