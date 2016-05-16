//
//  HMDemoController.m
//  73-UIDynamicDemo
//
//  Created by 韩萌 on 16/5/16.
//  Copyright © 2016年 hanmeng. All rights reserved.
//

#import "HMListController.h"
#import "HMDemoController.h"

@interface HMListController ()

/**
 *  存储所有标题
 */
@property (nonatomic,strong) NSArray *titleArr;

@end

@implementation HMListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置标题
    self.navigationItem.title = @"仿真行为";
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.titleArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.创建cell
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 2.给cell设置数据
    cell.textLabel.text = self.titleArr[indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // 3.返回cell
    return cell;
}


#pragma mark - 选中某一行后，跳转到对应的控制器
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    HMDemoController *demoVc = [[HMDemoController alloc] init];
    
    // 设置功能ID
    demoVc.funcId = (kDemoFunc)indexPath.row;
    
    [self.navigationController pushViewController:demoVc animated:YES];
    
}

/**
 *  懒加载所有标题
 */
-(NSArray *)titleArr{

    if (_titleArr == nil) {
        
        _titleArr = @[
                      @"吸附行为",
                      @"推动行为",
                      @"刚性附着行为",
                      @"弹性附着行为",
                      @"碰撞检测"
                      ];
    }
    return _titleArr;
}

@end
