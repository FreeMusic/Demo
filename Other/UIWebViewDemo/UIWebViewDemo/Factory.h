//
//  Factory.h
//  UIWebViewDemo
//
//  Created by mic on 2017/12/4.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Factory : NSObject

+ (UIButton *)ButtonWithTitle:(NSString *)title TitleColor:(UIColor *)titleColor addTarget:(UIViewController *)viewController action:(NSString *)action addSubView:(UIView *)subView;

@end
