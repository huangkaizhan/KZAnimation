//
//  CALayer+Animation_lib.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/10.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "CALayer+Animation_lib.h"
#import "objc/runtime.h"

static const void *kLayerAniMakerKey = &kLayerAniMakerKey;

@implementation CALayer (Animation_lib)

#pragma mark - 动态属性
- (void)setAniMaker:(AnimationMakerManager_lib *)aniMaker
{
    objc_setAssociatedObject(self, kLayerAniMakerKey, aniMaker, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AnimationMakerManager_lib *)aniMaker
{
    return objc_getAssociatedObject(self, kLayerAniMakerKey);
}

#pragma mark - 动画
- (id)ani_make:(void(^)(AnimationMakerManager_lib *maker))block
{
    return [self ani_make:block completion:nil];
}

- (id)ani_make:(void(^)(AnimationMakerManager_lib *maker))block completion:(void(^)(AnimationMakerManager_lib *maker))completionBlock
{
    id object = [self createMaker:block sourceType:AnimationSourcesType_libNormal completion:completionBlock];
    return object;
}

- (id)ani_makeForVideo:(void(^)(AnimationMakerManager_lib *maker))block completion:(void(^)(AnimationMakerManager_lib *maker))completionBlock
{
    id object = [self createMaker:block sourceType:AnimationSourcesType_libVideo completion:completionBlock];
    return object;
}

- (id)createMaker:(void(^)(AnimationMakerManager_lib *maker))block sourceType:(AnimationSourcesType_lib)sourceType completion:(void(^)(AnimationMakerManager_lib *maker))completionBlock
{
    WeakSelf_Ani
    if (!self.aniMaker) {
        self.aniMaker = [[AnimationMakerManager_lib alloc] initWithAnimationLayer:self];
        self.aniMaker.sourceType = sourceType;
    }
    self.aniMaker.group++;
    [self.aniMaker addCompletionBlock:completionBlock];
    block(weakSelf.aniMaker);
    return nil;
}

@end
