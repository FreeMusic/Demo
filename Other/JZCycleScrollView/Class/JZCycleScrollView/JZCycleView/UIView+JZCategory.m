//
//  UIView+JZCategory.m
//  JZCycleScrollView
//
//  Created by mic on 2017/11/22.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "UIView+JZCategory.h"

@implementation UIView (JZCategory)
/**
 *  height生成get方法
 */
- (CGFloat)height{
    return self.frame.size.height;
}
/**
 *  height生成set方法
 */
- (void)setHeight:(CGFloat)height{
    CGRect temp = self.frame;
    temp.size.height = height;
    self.frame = temp;
}
/**
 *  width生成get方法
 */
- (CGFloat)width{
    return self.frame.size.width;
}
/**
 *  width生成set方法
 */
- (void)setWidth:(CGFloat)width{
    CGRect temp = self.frame;
    temp.size.width = width;
    self.frame = temp;
}
/**
 *  pointY生成get方法
 */
- (CGFloat)pointY{
    return self.frame.origin.y;
}
/**
 *  pointY生成set方法
 */
- (void)setPointY:(CGFloat)pointY{
    CGRect temp = self.frame;
    temp.origin.y = pointY;
    self.frame = temp;
}
/**
 *  pointX生成get方法
 */
- (CGFloat)pointX{
    return self.frame.origin.x;
}
/**
 *  pointX生成set方法
 */
- (void)setPointX:(CGFloat)pointX{
    CGRect temp = self.frame;
    temp.origin.x = pointX;
    self.frame = temp;
}
@end
