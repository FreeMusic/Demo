//
//  Factory.m
//  UIWebViewDemo
//
//  Created by mic on 2017/12/4.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "Factory.h"

@implementation Factory

+ (UIButton *)ButtonWithTitle:(NSString *)title TitleColor:(UIColor *)titleColor addTarget:(UIViewController *)viewController action:(NSString *)action addSubView:(UIView *)subView{
    UIButton *btn = [UIButton buttonWithType:0];
    [btn setTitle:title forState:0];
    [btn setTitleColor:titleColor forState:0];
    SEL selector = NSSelectorFromString(action);
    [btn addTarget:viewController action:selector forControlEvents:UIControlEventTouchUpInside];
    [subView addSubview:btn];
    
    return btn;
}

@end
