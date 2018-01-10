//
//  FirstViewController.m
//  系统TabBar架构
//
//  Created by wangze on 16/1/28.
//  Copyright © 2016年 huashan. All rights reserved.
//

#import "FirstViewController.h"
#import "ThirdViewController.h"
#import "HSTabBarViewController.h"

@interface FirstViewController ()

@property(nonatomic, strong) HSTabBarViewController *tabBarVC;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tabBarVC = [[HSTabBarViewController alloc] init];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    createBtn(btn, @"下一页");
    [self.view addSubview:btn];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor redColor] forState:0];
    [button setTitle:@"跳转至第三个界面" forState:0];
    [button addTarget:self action:@selector(skipToThirdVC) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(100, 200, 200, 100);
    [self.view addSubview:button];
}

-(void)next
{
    NextViewController *tempVC = [[NextViewController alloc] init];
    [self.navigationController pushViewController:tempVC animated:YES];
}

- (void)skipToThirdVC
{ 
    self.tabBarController.selectedIndex = 2;
}

@end
