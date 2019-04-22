//
//  AnimationModel_lib.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/4.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationModel_lib.h"
#import <AVFoundation/AVFoundation.h>

@implementation AnimationModel_lib

- (NSMutableArray *)keyValues
{
    if (!_keyValues) {
        _keyValues = [NSMutableArray array];
    }
    return _keyValues;
}

- (NSMutableArray *)keyTimes
{
    if (!_keyTimes) {
        _keyTimes = [NSMutableArray array];
    }
    return _keyTimes;
}

- (NSString *)keyPath
{
    switch (self.animationType) {
        case AnimationType_libMove:
            return @"transform.translation";
        case AnimationType_libScale:
            return @"transform.scale";
        case AnimationType_libRotate:
            return @"transform.rotation";
        case AnimationType_libRotateX:
            return @"transform.rotation.x";
        case AnimationType_libRotateY:
            return @"transform.rotation.y";
        case AnimationType_libBounds:
            return @"bounds";
        case AnimationType_libOpacity:
            return @"opacity";
        case AnimationType_libBackColor:
            return @"backgroundColor";
        case AnimationType_libCornerRadius:
            return @"cornerRadius";
        default:
            break;
    }
    return @"";
}

- (CGFloat)beginTime
{
    if (_beginTime <= 0) {
        switch (self.sourceType) {
            case AnimationSourcesType_libNormal:
                _beginTime = CACurrentMediaTime();
                break;
            case AnimationSourcesType_libVideo:
                _beginTime = AVCoreAnimationBeginTimeAtZero;
                break;
            default:
                _beginTime = CACurrentMediaTime();
                break;
        }
    }
    return _beginTime;
}

- (CGFloat)duration
{
    if (!_duration) {
        _duration = 2.0f;
    }
    return _duration;
}

@end
