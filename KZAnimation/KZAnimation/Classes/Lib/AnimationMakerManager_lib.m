//
//  AnimationMakerManager_lib.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/4.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "AnimationMakerManager_lib.h"
#import "AnimationRotationXMaker_lib.h"
#import "AnimationRotationYMaker_lib.h"
#import "AnimationRotationZMaker_lib.h"

/**
 开始动画

 @param MakerInstance 动画器实例
 @return block回调
 */
#define Ani_Action(MakerInstance) \
    WeakSelf_Ani\
    return ^(CGFloat duration){\
        MakerInstance.duration = duration;\
        return MakerInstance;\
    };

static NSString *Key_IsAdded = @"isAdded";
static NSString *Key_IsAnimated = @"isAnimated";

@interface AnimationMakerManager_lib ()

// 当前动画视图
@property (nonatomic, weak) CALayer *animationLayer;

// 移动动画构造器
@property (nonatomic, strong) AnimationTranslationMaker_lib *moveMaker;

// 缩放动画构造器
@property (nonatomic, strong) AnimationScaleMaker_lib *scaleMaker;

// 旋转动画Z构造器
@property (nonatomic, strong) AnimationRotationZMaker_lib *rotateZMaker;

// 旋转动画X构造器
@property (nonatomic, strong) AnimationRotationXMaker_lib *rotateXMaker;

// 旋转动画Y构造器
@property (nonatomic, strong) AnimationRotationYMaker_lib *rotateYMaker;

// bounds动画构造器
@property (nonatomic, strong) AnimationBoundsMaker_lib *boundsMaker;

// 透明度动画构造器
@property (nonatomic, strong) AnimationOpacityMaker_lib *opacityMaker;

// 背景动画构造器
@property (nonatomic, strong) AnimationBackColorMaker_lib *backColorMaker;

// 圆角动画构造器
@property (nonatomic, strong) AnimationCornerRadiusMaker_lib *cornerRadiusMaker;

// 动画组字典
@property (nonatomic, strong) NSMutableDictionary *groupDict;

// 动画组字典
@property (nonatomic, strong) NSMutableDictionary *aniFinishedDict;

// 动画组字典
@property (nonatomic, strong) NSMutableDictionary *completionBlockDict;

// 制造器数组
@property (nonatomic, strong) NSMutableArray *makerArray;

@end

@implementation AnimationMakerManager_lib

#pragma mark - 初始化

- (instancetype)initWithAnimationLayer:(CALayer *)layer
{
    if (self = [super init]) {
        self.animationLayer = layer;
    }
    return self;
}

#pragma mark - 添加动画
// 移动构造器
- (AnimationTranslationMaker_lib *(^)(CGFloat duration))ani_translateInDuration
{
    Ani_Action(weakSelf.moveMaker)
}

// 缩放
- (AnimationScaleMaker_lib *(^)(CGFloat duration))ani_scaleInDuration
{
    Ani_Action(weakSelf.scaleMaker)
}

// 旋转
- (AnimationRotationMaker_lib *(^)(CGFloat duration))ani_rotateInDuration
{
    Ani_Action(weakSelf.rotateZMaker)
}

// 旋转(X轴)
- (AnimationRotationMaker_lib *(^)(CGFloat duration))ani_rotateXInDuration
{
    Ani_Action(weakSelf.rotateXMaker)
}

// 旋转(Y轴)
- (AnimationRotationMaker_lib *(^)(CGFloat duration))ani_rotateYInDuration
{
    Ani_Action(weakSelf.rotateYMaker)
}

// bounds
- (AnimationBoundsMaker_lib *(^)(CGFloat duration))ani_boundsInDuration
{
    Ani_Action(weakSelf.boundsMaker)
}

// 透明度
- (AnimationOpacityMaker_lib *(^)(CGFloat duration))ani_opacityInDuration
{
    Ani_Action(weakSelf.opacityMaker)
}

// 背景色
- (AnimationBackColorMaker_lib *(^)(CGFloat duration))ani_backColorInDuration
{
    Ani_Action(weakSelf.backColorMaker)
}

// 圆角
- (AnimationCornerRadiusMaker_lib *(^)(CGFloat duration))ani_cornerRadiusInDuration
{
    Ani_Action(weakSelf.cornerRadiusMaker)
}

#pragma mark - 事件方法
- (void)addCompletionBlock:(BlockWithObject_Ani)completionBlock
{
    NSString *key = [NSString stringWithFormat:@"%zd",self.group];
    if (completionBlock) {
        [self.completionBlockDict setObject:completionBlock forKey:key];
    } else {
        [self.completionBlockDict setObject:@"" forKey:key];
    }
}

#pragma mark - 构造器
// 移动动画构造器
- (AnimationTranslationMaker_lib *)moveMaker
{
    Ani_CreateMaker(AnimationTranslationMaker_lib, _moveMaker)
}

// 缩放动画构造器
- (AnimationScaleMaker_lib *)scaleMaker
{
    Ani_CreateMaker(AnimationScaleMaker_lib, _scaleMaker)
}

// 旋转动画构造器
- (AnimationRotationZMaker_lib *)rotateZMaker
{
    Ani_CreateMaker(AnimationRotationZMaker_lib, _rotateZMaker)
}

// 旋转动画构造器
- (AnimationRotationXMaker_lib *)rotateXMaker
{
    Ani_CreateMaker(AnimationRotationXMaker_lib, _rotateXMaker)
}

// 旋转动画构造器
- (AnimationRotationYMaker_lib *)rotateYMaker
{
    Ani_CreateMaker(AnimationRotationYMaker_lib, _rotateYMaker)
}

- (AnimationBoundsMaker_lib *)boundsMaker
{
    Ani_CreateMaker(AnimationBoundsMaker_lib, _boundsMaker)
}

- (AnimationOpacityMaker_lib *)opacityMaker
{
    Ani_CreateMaker(AnimationOpacityMaker_lib, _opacityMaker)
}

- (AnimationBackColorMaker_lib *)backColorMaker
{
    Ani_CreateMaker(AnimationBackColorMaker_lib, _backColorMaker)
}

- (AnimationCornerRadiusMaker_lib *)cornerRadiusMaker
{
    Ani_CreateMaker(AnimationCornerRadiusMaker_lib, _cornerRadiusMaker)
}

#pragma mark - 懒加载
- (NSMutableDictionary *)groupDict
{
    Ani_Dictionary_M(_groupDict)
}

- (NSMutableDictionary *)aniFinishedDict
{
    Ani_Dictionary_M(_aniFinishedDict)
}

- (NSMutableDictionary *)completionBlockDict
{
    Ani_Dictionary_M(_completionBlockDict)
}

- (NSMutableArray *)makerArray
{
    Ani_Array_M(_makerArray)
}

#pragma mark - 通知

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    AnimationBaseMaker_lib *maker = (AnimationBaseMaker_lib *)object;
    if ([maker isKindOfClass:[AnimationBaseMaker_lib class]]) {
        NSString *key = [NSString stringWithFormat:@"%zd",maker.group];
        if ([keyPath isEqualToString:Key_IsAdded]) {
            [self handleAddedAnimationWithGroupKey:key];
        }
        if ([keyPath isEqualToString:Key_IsAnimated]) {
            [self handleAnimationAnimatedWithGroupKey:key];
        }
    }
}

- (void)handleAddedAnimationWithGroupKey:(NSString *)groupKey
{
    NSInteger aniCount = [self.groupDict[groupKey] integerValue];
    aniCount++;
    self.groupDict[groupKey] = @(aniCount);
}

- (void)handleAnimationAnimatedWithGroupKey:(NSString *)groupKey
{
    @synchronized (self) {
        NSInteger aniCount = [self.groupDict[groupKey] integerValue];
        NSInteger finishedCount = [self.aniFinishedDict[groupKey] integerValue];
        finishedCount++;
        self.aniFinishedDict[groupKey] = @(finishedCount);
        
        id blockValue = self.completionBlockDict[groupKey];
        if ([blockValue isKindOfClass:[NSString class]]) {
            return;
        }
        
        BlockWithObject_Ani completionBlock = (BlockWithObject_Ani)blockValue;
        if (aniCount == finishedCount && completionBlock) {
            WeakSelf_Ani
            completionBlock(weakSelf);
            // 移除完成组动画block
            self.completionBlockDict[groupKey] = @"";
        }
    }
}

- (void)dealloc
{
    NSLog(@"makerManager : %@ - dealloc", self);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    for (AnimationBaseMaker_lib *maker in self.makerArray) {
        [maker removeObserver:self forKeyPath:Key_IsAdded];
        [maker removeObserver:self forKeyPath:Key_IsAnimated];
    }
    self.makerArray = nil;
}
@end
