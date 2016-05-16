//
//  HMDemoController.h
//  73-UIDynamicDemo
//
//  Created by 韩萌 on 16/5/16.
//  Copyright © 2016年 hanmeng. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 枚举定义
 */
typedef enum {
    kDemoFuncSnap,
    kDemoFuncPush,
    kDemoFuncAttachment,
    kDemoFuncSpring,
    kDemoFuncCollision
} kDemoFunc;

@interface HMDemoController : UIViewController

/**
 *  功能ID
 */
@property (nonatomic,assign) kDemoFunc funcId;

@end
