//
//  ViewController.m
//  多态
//
//  Created by mic on 2018/1/2.
//  Copyright © 2018年 JZ. All rights reserved.
//

#import "ViewController.h"
#import "Animal.h"
#import "Dog.h"
#import "Cat.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Animal *animal = [[Dog alloc] init];
    [animal animal];
    
    Animal *a = [[Animal alloc] init];
    [a animal];
    
    Animal *c = [[Cat alloc] init];
    [c animal];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
