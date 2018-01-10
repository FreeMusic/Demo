//
//  ViewController.m
//  LoadImageTest
//
//  Created by mic on 2017/11/22.
//  Copyright © 2017年 yunfu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imgageNameView = [[UIImageView alloc] init];
    
    BOOL useFile = NO;
    
    if (useFile) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"safe_4" ofType:@"png"];
        
        imgageNameView.image = [UIImage imageWithContentsOfFile:path];
    }else{
        imgageNameView.image = [UIImage imageNamed:@"safe_4"];
    }
    
    imgageNameView.frame = CGRectMake(10, 100, 350, 500);
    
    [self.view addSubview:imgageNameView];
}

@end
