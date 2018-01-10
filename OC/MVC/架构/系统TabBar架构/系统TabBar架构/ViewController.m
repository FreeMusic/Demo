//
//  ViewController.m
//  系统TabBar架构
//
//  Created by wangze on 16/1/28.
//  Copyright © 2016年 huashan. All rights reserved.
//

#import "ViewController.h"
#import "HSTabBarViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置导航条上标题的颜色
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    // 设置导航栏的颜色
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0x007fd0);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    createBtn(btn, @"登录");
    [self.view addSubview:btn];
}


-(void)next
{
    HSTabBarViewController *tabBarVC = [[HSTabBarViewController alloc] init];
    [self.navigationController pushViewController:tabBarVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
