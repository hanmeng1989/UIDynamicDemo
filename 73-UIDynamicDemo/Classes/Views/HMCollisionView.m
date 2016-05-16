//
//  HMCollisionView.m
//  73-UIDynamicDemo
//
//  Created by 韩萌 on 16/5/16.
//  Copyright © 2016年 hanmeng. All rights reserved.
//

#import "HMCollisionView.h"

@interface HMCollisionView ()

/**
 *  红色view
 */
@property (nonatomic,weak) UIView *redView;

@end

@implementation HMCollisionView

/**
 *  初始化
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.创建手势识别器
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        
        // 2.添加手势识别器到view
        [self addGestureRecognizer:tap];
        
        // 3.创建redView
        UIView *redV = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 150, 20)];
        
        redV.backgroundColor = [UIColor redColor];
        
        [self addSubview:redV];
        
        self.redView = redV;
    }
    return self;
}

/**
 *  手势要执行的行为
 */
- (void)tapAction:(UITapGestureRecognizer *)recognizer{

    // 1.创建物理仿真行为(重力行为)
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.boxImgView]];
    
    // 加速度
//    gravity.magnitude = 1;
    
    // 1.2创建物理仿真行为(碰撞行为)
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.boxImgView]];
    
    // 将参考视图转为边界
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    // 添加碰撞边界
    [collision addBoundaryWithIdentifier:@"line" fromPoint:CGPointMake(0, 300) toPoint:CGPointMake(140, 300)];
    
    // 2.添加到物理仿真器
    [self.animator addBehavior:gravity];
    
    [self.animator addBehavior:collision];
    
    // 3.物体的属性行为
    UIDynamicItemBehavior *item = [[UIDynamicItemBehavior alloc] initWithItems:@[self.boxImgView]];
    
    // 弹力：在0-1之间取值
    item.elasticity =  1.0;
    
    // 添加到物理仿真器
    [self.animator addBehavior:item];
}


@end
