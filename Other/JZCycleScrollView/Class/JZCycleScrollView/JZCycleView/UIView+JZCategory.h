//
//  UIView+JZCategory.h
//  JZCycleScrollView
//
//  Created by mic on 2017/11/22.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import <UIKit/UIKit.h>

#define JZColorCreater(r, g, b, a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]

@interface UIView (JZCategory)

@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat pointY;
@property (nonatomic, assign) CGFloat pointX;

@end
