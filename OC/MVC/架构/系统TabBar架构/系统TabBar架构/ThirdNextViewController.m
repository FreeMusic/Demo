//
//  ThirdNextViewController.m
//  系统TabBar架构
//
//  Created by mic on 17/3/20.
//  Copyright © 2017年 huashan. All rights reserved.
//

#import "ThirdNextViewController.h"

@interface ThirdNextViewController ()

@end

@implementation ThirdNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = SXYRandomColor;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    label.text = @"第三个控制器";
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
