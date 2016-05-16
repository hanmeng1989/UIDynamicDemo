//
//  HMAttachmentView.m
//  73-UIDynamicDemo
//
//  Created by 韩萌 on 16/5/16.
//  Copyright © 2016年 hanmeng. All rights reserved.
//

#import "HMAttachmentView.h"

@interface HMAttachmentView (){

    UIImageView *_anchorImgV;  // 附着点图片框
    UIImageView *_offsetImgV;  // 参考点图片框
}

@end

@implementation HMAttachmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.下移方块
        self.boxImgView.center = CGPointMake(self.center.x, 200);
        
        // 2.实例化刚性附着行为
        // 距离中心点的偏移量
        UIOffset offset = UIOffsetMake(20, 20);
        
        // 附着点
        CGPoint anchorPoint = CGPointMake(self.center.x, 100);
        
        // 创建刚性附着行为
        UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.boxImgView offsetFromCenter:offset attachedToAnchor:anchorPoint];
        
        // 添加到物理仿真器
        [self.animator addBehavior:attachment];
        
        _attachment = attachment;
        
        // 3.添加图片框
        UIImage *img = [UIImage imageNamed:@"AttachmentPoint_Mask"];
        
        // 附着点图片框
        UIImageView *anchorImgV = [[UIImageView alloc] initWithImage:img];
        
        anchorImgV.center = anchorPoint;
        
        [self addSubview:anchorImgV];
        
        _anchorImgV = anchorImgV;
        
        // 参考点图片框
        UIImageView *offsetImgV = [[UIImageView alloc] initWithImage:img];
        
        CGFloat offsetX = self.boxImgView.bounds.size.width * 0.5 + offset.horizontal;
        CGFloat offsetY = self.boxImgView.bounds.size.height * 0.5 + offset.vertical;
        
        offsetImgV.center = CGPointMake(offsetX, offsetY);
        
        [self.boxImgView addSubview:offsetImgV];
        
        _offsetImgV = offsetImgV;
        
        // 4.添加手势
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        
        [self addGestureRecognizer:pan];
    }
    return self;
}

#pragma mark - 拖拽手势执行方法
- (void)panAction:(UIPanGestureRecognizer *)recognizer{

    // 1.获取拖拽的点
    CGPoint loc = [recognizer locationInView:self];
    
    // 2.拖拽过程中，修改附着点
    if (recognizer.state == UIGestureRecognizerStateChanged) {
        
        _attachment.anchorPoint = loc;
        _anchorImgV.center = loc;
        
        // 重绘
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect {
   
    // 1.起始点
    CGPoint startPoint = _anchorImgV.center;
    
    // 2.结束点
    CGPoint endPoint = [self convertPoint:_offsetImgV.center fromView:self.boxImgView];
    
    // 3.绘制路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:startPoint];
    
    [path addLineToPoint:endPoint];
    
    // 线宽
    path.lineWidth = 10;
    
    // 4.绘制
    [path stroke];
}


@end
