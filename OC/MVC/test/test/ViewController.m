//
//  ViewController.m
//  test
//
//  Created by mic on 2017/10/11.
//  Copyright © 2017年 yunfu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

__weak id reference = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = [NSString stringWithFormat:@"sunnyxx"];
    // str是一个autorelease对象，设置一个weak的引用来观察它
    reference = str;
    
    NSMutableArray *dataSource = [NSMutableArray array];
    
    NSArray *micArray = @[@[@"一一一", @"####", @"！！！！"], @[@"………………", @"&&&&", @"*****"]];
    
    NSArray *FirstArray = @[@"111", @"222",@"333"];
    NSArray *SecondArray = @[@"444", @"555",@"666"];
    NSArray *ThirdArray = @[@"777", @"888",@"999"];
    
    [dataSource addObject:FirstArray];
    [dataSource addObject:SecondArray];
    [dataSource addObject:ThirdArray];
    
    NSLog(@"%@    %@", dataSource[1], dataSource[2][1]);
    NSLog(@"%@     %@", micArray[0], micArray[0][2]);
    
    UITextField *text = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 300, 50)];
    [self.view addSubview:text];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
    lable.text = @"11";
    lable.textColor = [UIColor redColor];
    lable.font = [UIFont systemFontOfSize:10];
    [text addSubview:lable];
    //text.rightView = lable;
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@", reference); // Console: sunnyxx
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@", reference); // Console: (null)
}


@end
