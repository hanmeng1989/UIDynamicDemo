//
//  HMSpringView.m
//  73-UIDynamicDemo
//
//  Created by 韩萌 on 16/5/16.
//  Copyright © 2016年 hanmeng. All rights reserved.
//

#import "HMSpringView.h"

@implementation HMSpringView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 振幅
        self.attachment.damping = 1.0f;
        
        // 频率
        self.attachment.frequency = 1.0f;
        
        // 创建重力仿真行为
        UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.boxImgView]];
        
        [self.animator addBehavior:gravity];
        
        /**
         *  利用KVO监听方块中心点的改变
         *  KVO:iOS中的黑魔法，实质是通知,原理是轮询的模式，类似于银行叫号系统
         *  性能较差，开发中不常用，但也需要了解
         */
        [self.boxImgView addObserver:self forKeyPath:@"center" options:NSKeyValueObservingOptionNew context:nil];
        
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{

    // 中心点改变后重绘
    [self setNeedsDisplay];
}

#warning 销毁的时候需要移除监听
- (void)dealloc{

    [self.boxImgView removeObserver:self forKeyPath:@"center"];
}
@end
