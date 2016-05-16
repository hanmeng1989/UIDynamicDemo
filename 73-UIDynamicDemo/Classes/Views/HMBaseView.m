//
//  HMBaseView.m
//  73-UIDynamicDemo
//
//  Created by 韩萌 on 16/5/16.
//  Copyright © 2016年 hanmeng. All rights reserved.
//

#import "HMBaseView.h"

@implementation HMBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.设置背景
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundTile"]];
        
        // 2.添加方块
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box1"]];
        
        imgView.center = CGPointMake(150, 150);
        
        [imgView sizeToFit];
        
        [self addSubview:imgView];
        
        _boxImgView = imgView;
        
    }
    return self;
}

#pragma mark - 懒加载物理仿真器
-(UIDynamicAnimator *)animator{
    
    if (_animator == nil) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    }
    return _animator;
}

@end
