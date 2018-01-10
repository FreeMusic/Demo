//
//  ThirdViewController.m
//  系统TabBar架构
//
//  Created by wangze on 16/1/28.
//  Copyright © 2016年 huashan. All rights reserved.
//

#import "ThirdViewController.h"
#import "ThirdNextViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    createBtn(btn, @"nextPage");
    [self.view addSubview:btn];
}

-(void)next
{
    ThirdNextViewController *tempVC = [[ThirdNextViewController alloc] init];
    [self.navigationController pushViewController:tempVC animated:YES];
}


@end
