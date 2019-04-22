//
//  UIView+Animation_lib.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/4.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "UIView+Animation_lib.h"
#import "objc/runtime.h"

static const void *kViewAniMakerKey = &kViewAniMakerKey;

@implementation UIView (Animation_lib)

#pragma mark - 动态属性
- (void)setAniMaker:(AnimationMakerManager_lib *)aniMaker
{
    objc_setAssociatedObject(self, kViewAniMakerKey, aniMaker, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AnimationMakerManager_lib *)aniMaker
{
    return objc_getAssociatedObject(self, kViewAniMakerKey);
}

#pragma mark - 动画
- (id)ani_make:(void(^)(AnimationMakerManager_lib *maker))block
{
    return [self ani_make:block completion:nil];
}

- (id)ani_make:(void(^)(AnimationMakerManager_lib *maker))block completion:(void(^)(AnimationMakerManager_lib *maker))completionBlock
{
    WeakSelf_Ani
    if (!self.aniMaker) {
        self.aniMaker = [[AnimationMakerManager_lib alloc] initWithAnimationLayer:self.layer];
    }
    self.aniMaker.group++;
    [self.aniMaker addCompletionBlock:completionBlock];
    block(weakSelf.aniMaker);
    return nil;
}
@end
