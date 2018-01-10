//
//  ViewController.m
//  AssistiveTouch
//
//  Created by mic on 2017/10/20.
//  Copyright © 2017年 yunfu. All rights reserved.
//

#import "ViewController.h"

/**
 *  屏幕尺寸宽和高
 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _btn=[[UIButton alloc]initWithFrame:CGRectMake(0,0,50,50)];
    
    _btn.backgroundColor=[UIColor orangeColor];
    
    _btn.layer.cornerRadius=25;
    
    _btn.center=self.view.center;
    
    [self.view addSubview:_btn];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]
                                                    
                                                    initWithTarget:self
                                                    
                                                    action:@selector(handlePan:)];
    
    [_btn addGestureRecognizer:panGestureRecognizer];
    
    
    NSString *str= @"2211";
    
    NSString *str2 = [str copy];
    
    NSMutableString *str3 = [NSMutableString stringWithFormat:@"%@", str];
    
    NSString *str4 = [str3 copy];
}

- (void) handlePan:(UIPanGestureRecognizer*) recognizer

{
    
    CGPoint translation = [recognizer translationInView:self.view];
    
    CGFloat centerX=recognizer.view.center.x+ translation.x;
    
    NSLog(@"%f    %f   %f", translation.x, translation.y, _btn.frame.origin.y);
    
    CGFloat thecenter=0;
    
    recognizer.view.center=CGPointMake(centerX,
                                       
                                       recognizer.view.center.y+ translation.y);
    
    [recognizer setTranslation:CGPointZero inView:self.view];
    
    if(recognizer.state==UIGestureRecognizerStateEnded|| recognizer.state==UIGestureRecognizerStateCancelled) {
        
        if(centerX>kScreenWidth/2) {
            
            thecenter=kScreenWidth-50/2;
            
        }else{
            
            thecenter=50/2;
            
        }
        [UIView animateWithDuration:0.3 animations:^{
            
            recognizer.view.center=CGPointMake(thecenter,
                                               
                                               recognizer.view.center.y+ translation.y);
            
        }];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
