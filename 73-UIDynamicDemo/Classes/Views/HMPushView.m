//
//  HMPushView.m
//  73-UIDynamicDemo
//
//  Created by 韩萌 on 16/5/16.
//  Copyright © 2016年 hanmeng. All rights reserved.
//

#import "HMPushView.h"

@interface HMPushView (){

    UIView *_blueV;         // 蓝色小方块
    
    CGPoint _firstPoint;    // 起始点
    
    CGPoint _changedPoint;  // 移动中的点
    
    UIImageView *_pointImgV;// 拖拽开始点的图片
    
    UIPushBehavior *_push;  // 物理仿真行为（push）
}



@end

@implementation HMPushView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.添加蓝色view
        UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 20, 20)];
        
        blueView.backgroundColor = [UIColor blueColor];
        
        [self addSubview:blueView];
        
        _blueV = blueView;
        
        // 2.添加手势(拖拽)
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        
        [self addGestureRecognizer:pan];
        
        // 3.添加物理仿真行为（push）
        UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[self.boxImgView] mode:UIPushBehaviorModeInstantaneous];
        
        [self.animator addBehavior:push];
        
        _push = push;
        
        // 4.添加物理仿真行为（碰撞）
        UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.boxImgView,blueView]];
        
        collision.translatesReferenceBoundsIntoBoundary = YES;
        
        [self.animator addBehavior:collision];
        
    }
    return self;
}

#pragma  点按事件
- (void)panAction:(UIPanGestureRecognizer *)recognizer{

    // 1.获取拖拽的位置
    CGPoint loc = [recognizer locationInView:self];
    
    // 3.根据手势状态进行相关处理
    // 3.1 开始拖拽
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        
        // 3.1.1 创建拖拽点图片
        UIImageView *pointImgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AttachmentPoint_Mask"]];
        
        [pointImgV sizeToFit];
        
        pointImgV.center = loc;
        
        // 3.1.2 添加到view
        [self addSubview:pointImgV];
        
        // 3.1.3 赋值
        _firstPoint = loc;
        
        _pointImgV = pointImgV;
    }
    // 3.2 拖拽中
    else if(recognizer.state ==  UIGestureRecognizerStateChanged){

        // 3.2.1 拖拽中的点
        _changedPoint = loc;
        
        // 3.2.2 重绘
        [self setNeedsDisplay];
        
    }
    // 3.3 结束拖拽
    else if(recognizer.state == UIGestureRecognizerStateEnded){
    
        // 1.计算偏移量
        CGPoint offSet = CGPointMake(loc.x - _firstPoint.x, loc.y - _firstPoint.y);
        
        // 2.计算距离
        CGFloat distance = hypot(offSet.x, offSet.y);
        
        // 3.计算角度
        CGFloat angle = atan2(offSet.y, offSet.x);
        
        // 4.设置推力、角度等
        _push.magnitude = distance; // 力度
        _push.angle = angle;        // 角度
        
        _push.active = YES;         // 使单次推动生效
        
        // 5.隐藏图片
        _pointImgV.image = nil;
        
        // 清除线
        _firstPoint = CGPointZero;
        
        _changedPoint = CGPointZero;
        
        // 重绘
        [self setNeedsDisplay];
    }
}

#pragma mark - 绘图
-(void)drawRect:(CGRect)rect{

    // 1.绘制路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 2.起始点
    [path moveToPoint:_firstPoint];
    
    // 3.结束点
    [path addLineToPoint:_changedPoint];

    // 4.线宽
    [path setLineWidth:10];
    
    // 5.颜色
    [[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1] set];
    
    // 6.绘制
    [path stroke];
}
@end
