//
//  DemoBaseAnimationController.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "DemoBaseAnimationController.h"

@interface DemoBaseAnimationController ()

@end

@implementation DemoBaseAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.aniView = [[UIView alloc] init];
    self.aniView.backgroundColor = [UIColor purpleColor];
    self.aniView.bounds = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:self.aniView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"开始动画" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(beginAnimation) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(self.view.bounds.size.width * 0.5 - 50, self.view.bounds.size.height - 100, 100, 30);
    [self.view addSubview:button];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.aniView.center = self.view.center;
}

- (void)beginAnimation
{
    NSAssert(1 == 2, @"子类重写");
}

- (void)dealloc
{
    NSLog(@"vc = %@ dealloc", self);
}

@end
