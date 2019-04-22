//
//  AnimationHeader_lib.h
//  动画测试
//
//  Created by huangkaizhan on 2017/3/7.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#ifndef AnimationHeader_lib_h
#define AnimationHeader_lib_h

#import "NSValue+Animation_lib.h"

#pragma mark - 枚举
// 动画类型
typedef enum{
    AnimationType_libMove               =           101,            // 移动动画
    AnimationType_libMoveX              =           102,            // 移动动画X
    AnimationType_libMoveY              =           103,            // 移动动画Y
    AnimationType_libScale              =           201,            // 缩放动画
    AnimationType_libRotate             =           301,            // 旋转动画Z
    AnimationType_libRotateX            =           302,            // 旋转动画X
    AnimationType_libRotateY            =           303,            // 旋转动画Y
    AnimationType_libBounds             =           401,            // Bounds动画
    AnimationType_libOpacity            =           501,            // 透明度动画
    AnimationType_libBackColor          =           601,            // 背景色动画
    AnimationType_libCornerRadius       =           701,            // 圆角动画
}AnimationType_lib;

// 动画资源类型
typedef enum{
    AnimationSourcesType_libNormal, // 普通动画
    AnimationSourcesType_libVideo   // 视频动画
}AnimationSourcesType_lib;

#pragma mark - 代理
// 动画maker代理
@protocol AnimationMakerDelegate_lib <NSObject>

/**
 添加值
 */
- (id(^)(NSValue *value))addValue;


/**
 每个maker都有自己的动画类型

 @return  动画类型
 */
- (AnimationType_lib)animationType;

@end


@protocol AnimationComponentDelegate_lib <NSObject>

/**
 添加开始时间
 */
- (id(^)(CGFloat time))atTime;

@end



#pragma mark - 代码块
typedef void(^BlockWithObject_Ani)(id object);
typedef void(^BlockWithVoid_Ani)(void);
typedef void(^BlockWithTwoObject_Ani)(id object, id object1);

#pragma mark - 其他
// 弱引用
#define WeakSelf_Ani                                        __weak typeof(self) weakSelf = self;
// 动画组key
#define Key_Animation_Group                                 @"Key_Animation_Group"

// 数学计算：
#define Ani_RadianToDegrees(radian)  (radian*180.0)/(M_PI) // 弧度转角度
#define Ani_DegreesToRadian(x)       (M_PI * (x) / 180.0)  // 角度转弧度

#pragma mark - 辅助宏

// KVO
#define KVO_Ani


/**
 创建可变字典

 @param Instance 实例
 @return 对象
 */
#define Ani_Dictionary_M(Instance)\
    if (!Instance) {\
        Instance = [NSMutableDictionary dictionary];\
    }\
    return Instance;

/**
 创建可变数组
 
 @param Instance 实例
 @return 对象
 */
#define Ani_Array_M(Instance)\
    if (!Instance) {\
        Instance = [NSMutableArray array];\
    }\
    return Instance;


/**
 动画添加值

 @param Component 组件
 @return 回调代码块
 */
#define Ani_AddValue(Component)\
    if (!self.isCanAdd) {\
        NSAssert(self.isCanAdd, @"上一个动画制造器没有执行end");\
    }\
    __weak typeof (self) weakSelf = self;\
    return ^(CGFloat factor){\
        [weakSelf.animationModel.keyValues addObject:@(factor)];\
        return Component;\
    };

/**
 动画添加值(对象)
 
 @param Component 组件
 @return 回调代码块
 */
#define Ani_AddObject(Component)\
    if (!self.isCanAdd) {\
        NSAssert(self.isCanAdd, @"上一个动画制造器没有执行end");\
    }\
    __weak typeof (self) weakSelf = self;\
    return ^(id object){\
        [weakSelf.animationModel.keyValues addObject:object];\
        return Component;\
    };

/**
 动画添加值(X Y)
 
 @param Component 组件
 @return 回调代码块
 */
#define Ani_AddXY(Component)\
    if (!self.isCanAdd) {\
        NSAssert(self.isCanAdd, @"上一个动画制造器没有执行end");\
    }\
    __weak typeof (self) weakSelf = self;\
    return ^(CGFloat x, CGFloat y){\
        [weakSelf.animationModel.keyValues addObject:[NSValue valueWithX:x y:y]];\
        return Component;\
    };

/**
 动画添加值(Bounds)
 
 @param Component 组件
 @return 回调代码块
 */
#define Ani_AddBounds(Component)\
    if (!self.isCanAdd) {\
        NSAssert(self.isCanAdd, @"上一个动画制造器没有执行end");\
    }\
    __weak typeof (self) weakSelf = self;\
    return ^(CGFloat width, CGFloat height){\
        [weakSelf.animationModel.keyValues addObject:[NSValue valueWithCGRect:CGRectMake(0, 0, width, height)]];\
        return Component;\
    };

/**
 动画添加值(Rect)
 
 @param Component 组件
 @return 回调代码块
 */
#define Ani_AddRect(Component)\
    if (!self.isCanAdd) {\
        NSAssert(self.isCanAdd, @"上一个动画制造器没有执行end");\
    }\
    __weak typeof (self) weakSelf = self;\
    return ^(CGRect frame){\
    [weakSelf.animationModel.keyValues addObject:[NSValue valueWithCGRect:frame]];\
        return Component;\
    };


/**
 动画添加值(CATransform3D)
 
 @param Component 组件
 @return 回调代码块
 */
#define Ani_AddTransform(Component)\
    if (!self.isCanAdd) {\
        NSAssert(self.isCanAdd, @"上一个动画制造器没有执行end");\
    }\
    __weak typeof (self) weakSelf = self;\
    return ^(CATransform3D transform){\
        [weakSelf.animationModel.keyValues addObject:[NSValue valueWithCATransform3D:transform]];\
        return Component;\
    };

/**
 创建组件

 @param ComponentClass 组件类
 @return 回调代码块
 */
#define Ani_CreateComponentMaker(ComponentClass)\
- (ComponentClass *)componentMaker\
{\
    if (!_componentMaker) {\
    _componentMaker = [[ComponentClass alloc] init];\
    _componentMaker.maker = self;\
    }\
    _componentMaker.animationModel = self.animationModel;\
    return _componentMaker;\
}

/**
 创建动画制造器
 
 @param MakerClass 构造器类
 @param MakerInstance 构造器实例
 @return 构造器
 */
#define Ani_CreateMaker(MakerClass, MakerInstance) \
    if (!MakerInstance) {\
        MakerInstance = [[MakerClass alloc] init];\
        MakerInstance.group = self.group;\
        [MakerInstance addObserver:self forKeyPath:@"isAdded" options:NSKeyValueObservingOptionNew context:nil];\
        [MakerInstance addObserver:self forKeyPath:@"isAnimated" options:NSKeyValueObservingOptionNew context:nil];\
        [self.makerArray addObject:MakerInstance];\
    }\
    MakerInstance.animationLayer = self.animationLayer;\
    MakerInstance.animationModel.sourceType = self.sourceType;\
    return MakerInstance;


/**
 动画添加时间
 
 @param MakerClass 制造器
 @return 回调代码块
 */
#define Ani_AddTime(MakerClass)\
- (MakerClass *(^)(CGFloat time))atTime\
{\
__weak MakerClass *maker = (MakerClass *)self.maker;\
__weak typeof (self) weakSelf = self;\
return ^(CGFloat time){\
[weakSelf.animationModel.keyTimes addObject:@(time)];\
return maker;\
};\
}



#endif /* AnimationHeader_lib_h */
