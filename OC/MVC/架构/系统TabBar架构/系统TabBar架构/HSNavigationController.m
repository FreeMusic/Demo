//
//  HSNavigationController.m
//  系统TabBar架构
//
//  Created by wangze on 16/1/28.
//  Copyright © 2016年 huashan. All rights reserved.
//

#import "HSNavigationController.h"
#import "UIButton+HSCreateBtn.h"


@interface HSNavigationController ()

@end

@implementation HSNavigationController

- (void)viewDidLoad
{	
    [super viewDidLoad];
    
    //设置导航条上标题的颜色
    self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    // 设置导航栏的颜色
    self.navigationBar.barTintColor = UIColorFromRGB(0x007fd0);
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    
    if (self.viewControllers.count 
        > 1)
    {
        // 隐藏底部选项卡,显示顶部导航栏
        viewController.navigationController.navigationBarHidden = NO;
        viewController.tabBarController.tabBar.hidden = YES;
        
        // 添加导航栏左边返回按钮
        UIButton *leftBtn = [UIButton btnWithNorImgName:@"jiantou" heiLightImgName:@"jiantou"];
        [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    }
}                                     

- (void)leftBtnClick
{
    [self popViewControllerAnimated:YES];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [super popViewControllerAnimated:animated];
    
    if (self.viewControllers.count == 1)
    {
        self.tabBarController.tabBar.hidden = NO;
    }

    return self;
}


@end
