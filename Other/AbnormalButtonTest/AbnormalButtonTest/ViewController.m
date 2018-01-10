//
//  ViewController.m
//  AbnormalButtonTest
//
//  Created by mic on 2017/11/24.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "ViewController.h"

/**
 *  屏幕尺寸宽和高
 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *testButton = [UIButton buttonWithType:0];
    [testButton setTitle:@"点击没反应" forState:0];
    [testButton setTitleColor:[UIColor greenColor] forState:0];
    testButton.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [testButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
    
    UIButton *testButton12 = [UIButton buttonWithType:0];
    [testButton12 setTitle:@"点击1111111" forState:0];
    [testButton12 setTitleColor:[UIColor greenColor] forState:0];
    testButton12.frame = CGRectMake(0, 0, 100, 100);
    [testButton12 addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [testButton addSubview:testButton12];
}

- (void)buttonClick{
    NSLog(@"点击没反应");
}

- (void)test{
    NSLog(@"点击1111111");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
