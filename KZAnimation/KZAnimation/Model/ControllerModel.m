//
//  ControllerModel.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "ControllerModel.h"

@implementation ControllerModel

- (instancetype)initWithName:(NSString *)name className:(NSString *)className
{
    if (self = [super init]) {
        self.name = name;
        self.className = className;
    }
    return self;
}

@end
