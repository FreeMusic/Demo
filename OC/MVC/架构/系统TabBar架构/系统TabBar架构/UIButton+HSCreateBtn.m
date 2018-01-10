//
//  UIButton+HSCreateBtn.m
//  系统TabBar架构
//
//  Created by mac on 16/1/26.
//  Copyright (c) 2015年 wangze. All rights reserved.
//

#import "UIButton+HSCreateBtn.h"

@implementation UIButton (HSCreateBtn)

+ (UIButton *)btnWithNorImgName:(NSString *)norImgName heiLightImgName:(NSString *)heiLightImgName
{
    // 设置导航栏右边按钮
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:norImgName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:heiLightImgName] forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 9, 26, 26);
    return btn;
}

@end
