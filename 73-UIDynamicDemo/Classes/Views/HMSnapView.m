//
//  HMSnapView.m
//  73-UIDynamicDemo
//
//  Created by 韩萌 on 16/5/16.
//  Copyright © 2016年 hanmeng. All rights reserved.
//

#import "HMSnapView.h"

@interface HMSnapView ()

@end

@implementation HMSnapView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    // 0.移除所有物理仿真行为
    [self.animator removeAllBehaviors];
    
    // 1.获取触摸点
    UITouch *touch = [touches anyObject];
    
    CGPoint loc = [touch locationInView:self];
    
    // 2.创建物理仿真行为（吸附行为）
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.boxImgView snapToPoint:loc];
    
    // 3.添加到仿真模拟器
    [self.animator addBehavior:snap];
}



@end
