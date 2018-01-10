//
//  ViewController.m
//  UIPasteboardDemo
//
//  Created by mic on 2017/11/22.
//  Copyright © 2017年 yunfu. All rights reserved.
//

#import "ViewController.h"
#import "CopyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CopyView* cv = [[CopyView alloc] initWithFrame:self.view.bounds];
    self.view = cv;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
