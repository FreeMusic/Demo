//
//  HSTabBarViewController.m
//  系统TabBar架构
//
//  Created by wangze on 16/1/28.
//  Copyright © 2016年 huashan. All rights reserved.
//

#import "HSTabBarViewController.h"
#import "HSNavigationController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface HSTabBarViewController ()

@end

@implementation HSTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置tabBar的背景色
    [self.tabBar setBarTintColor:[UIColor blackColor]];
    
    [self initTabBarController];
}

-(void)initTabBarController
{
    // 首页模块
    FirstViewController *homeVC = [[FirstViewController alloc] init];
    homeVC.title = @"滴滴工程";
    HSNavigationController *homeNag = [self settingTabbarItemWithRootVC:homeVC img:@"sy" selectImg:@"syh"];
    
    // 创业项目模块
    SecondViewController *workPro = [[SecondViewController alloc] init];
    workPro.title = @"创业项目";
    HSNavigationController *workProNag = [self settingTabbarItemWithRootVC:workPro img:@"xm" selectImg:@"xmh"];
    
    // 报名流程模块
    ThirdViewController *processVC = [[ThirdViewController alloc] init];
    processVC.title = @"报名流程";
    HSNavigationController *processNag = [self settingTabbarItemWithRootVC:processVC img:@"lc" selectImg:@"lch"];
   
    self.viewControllers = @[homeNag, workProNag, processNag];
}

- (HSNavigationController *)settingTabbarItemWithRootVC:(id)VC img:(NSString *)imgStr selectImg:(NSString *)selectImg
{
    HSNavigationController *nag = [[HSNavigationController alloc] initWithRootViewController:VC];
    [nag.tabBarItem setImage:[[UIImage imageNamed:imgStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [nag.tabBarItem setSelectedImage:[[UIImage imageNamed:selectImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [nag.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateNormal];
    [nag.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor redColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateSelected];
    return nag;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //隐藏最根的导航条
    self.navigationController.navigationBar.hidden = YES;
}

@end
