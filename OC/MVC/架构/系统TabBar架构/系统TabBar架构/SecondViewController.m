//
//  SecondViewController.m
//  系统TabBar架构
//
//  Created by wangze on 16/1/28.
//  Copyright © 2016年 huashan. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    createBtn(btn, @"next");
    [self.view addSubview:btn];
}

-(void)next
{
    NextViewController *tempVC = [[NextViewController alloc] init];
    [self.navigationController pushViewController:tempVC animated:YES];
}

@end
