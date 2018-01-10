//
//  ViewController.m
//  CAShareLayerTest
//
//  Created by mic on 2017/9/30.
//  Copyright © 2017年 yunfu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    shapeLayer.frame = CGRectMake(100, 100, 100, 100);
//    shapeLayer.strokeEnd = 1.0f;
//    shapeLayer.strokeStart = 0.75f;
//    
//    
//    
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:shapeLayer.frame];
//    shapeLayer.path = path.CGPath;
//    shapeLayer.fillColor = [UIColor clearColor].CGColor;
//    shapeLayer.lineWidth = 2.0f;
//    shapeLayer.strokeColor = [UIColor redColor].CGColor;
//    [self.view.layer addSublayer:shapeLayer];
    
//    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame) - 100, CGRectGetMidY(self.view.frame) - 100, 200, 200)];
//    view.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:view];
//    
//    // 线的路径
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:view.bounds];
//    CAShapeLayer *pathLayer = [CAShapeLayer layer];
//    pathLayer.lineWidth = 2;
//    pathLayer.strokeColor = [UIColor greenColor].CGColor;
//    pathLayer.path = path.CGPath;
//    // [view.layer addSublayer:pathLayer];
//    // pathLayer.fillColor = nil; // 默认为blackColor
//    view.layer.mask = pathLayer; // layer 的 mask属性，添加蒙版
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame) - 100, CGRectGetMidY(self.view.frame) - 100, 200, 200)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    // 线的路径
    CGPoint viewCenter = CGPointMake(view.frame.size.width / 2.0, view.frame.size.height / 2.0); // 画弧的中心点，相对于view
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:viewCenter radius:50.0 startAngle:M_PI_2 endAngle:M_PI_2*3 clockwise:YES];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.lineWidth = 2;
    pathLayer.strokeColor = [UIColor greenColor].CGColor;
    pathLayer.fillColor = nil; // 默认为blackColor
    pathLayer.path = path.CGPath;
    [view.layer addSublayer:pathLayer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
