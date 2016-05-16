//
//  HMBaseView.h
//  73-UIDynamicDemo
//
//  Created by 韩萌 on 16/5/16.
//  Copyright © 2016年 hanmeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMBaseView : UIView

/**
 *  盒子
 */
@property (nonatomic,weak) UIImageView *boxImgView;

/**
 *  物理仿真器
 */
@property (nonatomic,strong) UIDynamicAnimator *animator;

@end
