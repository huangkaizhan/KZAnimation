//
//  ControllerModel.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ControllerModel : NSObject

// <#zhushi#>
@property (nonatomic, copy) NSString *name;

// <#zhushi#>
@property (nonatomic, copy) NSString *className;


- (instancetype)initWithName:(NSString *)name className:(NSString *)className;

@end
