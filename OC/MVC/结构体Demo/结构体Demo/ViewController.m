//
//  ViewController.m
//  结构体Demo
//
//  Created by mic on 2017/8/25.
//  Copyright © 2017年 yunfu. All rights reserved.
//

#import "ViewController.h"
#import "StrcutView.h"

@interface ViewController ()

@property (nonatomic, strong) StrcutView *strcutView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _strcutView = [[StrcutView alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:_strcutView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
