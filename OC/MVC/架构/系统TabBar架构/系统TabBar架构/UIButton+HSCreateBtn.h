//
//  UIButton+HSCreateBtn.h
//  系统TabBar架构
//
//  Created by mac on 16/1/26.
//  Copyright (c) 2015年 wangze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (HSCreateBtn)

// 生成导航栏左边或右边的按钮
+ (UIButton *)btnWithNorImgName:(NSString *)norImgName heiLightImgName:(NSString *)heiLightImgName;

@end
