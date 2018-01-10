//
//  ViewController.m
//  DrawCircle
//
//  Created by mic on 2017/9/28.
//  Copyright © 2017年 yunfu. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"
#import "SXYCircle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 30, 30)];
    label.text = @"15";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    SXYCircle *circle = [[SXYCircle alloc] initWithFrame:CGRectMake(100, 100, 30, 30)];
    [self.view addSubview:circle];
    [circle createCricleByLocationisTop:YES];
    [circle stareAnimationWithPercentage:0.5];
    [circle createCricleByLocationisTop:NO];
    [circle stareAnimationWithPercentage:0.5];
}

@end
