//
//  HMDemoController.m
//  73-UIDynamicDemo
//
//  Created by 韩萌 on 16/5/16.
//  Copyright © 2016年 hanmeng. All rights reserved.
//

#import "HMDemoController.h"
#import "HMBaseView.h"
#import "HMSnapView.h"
#import "HMPushView.h"
#import "HMAttachmentView.h"
#import "HMSpringView.h"
#import "HMCollisionView.h"

@interface HMDemoController ()

@end

@implementation HMDemoController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建基View
    HMBaseView *baseView;
    
    // 根据枚举值创建对应的view
    switch (self.funcId) {
        case kDemoFuncSnap:
            baseView = [[HMSnapView alloc] initWithFrame:self.view.bounds];
            break;
            
        case kDemoFuncPush:
            baseView = [[HMPushView alloc] initWithFrame:self.view.bounds];
            break;
            
        case kDemoFuncAttachment:
            baseView = [[HMAttachmentView alloc] initWithFrame:self.view.bounds];
            break;
            
        case kDemoFuncSpring:
            baseView = [[HMSpringView alloc] initWithFrame:self.view.bounds];
            break;
            
        case kDemoFuncCollision:
            baseView = [[HMCollisionView alloc] initWithFrame:self.view.bounds];
            break;
            
        default:
            break;
    }
    self.view = baseView;
    
}

@end
