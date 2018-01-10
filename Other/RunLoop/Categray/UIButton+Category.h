//
//  UIButton+Category.h
//  RunTime_Objc_msgSend
//
//  Created by mic on 2017/12/11.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ButtonShapeType){
    ButtonShapeTypeWithLine,//有边线的按钮
    ButtonShapeTypeWithSolid//无边线 的按钮
};

typedef void(^SXYBlock)(UIButton *button);

@interface UIButton (Category)

@property (nonatomic, assign) BOOL open;

@property (nonatomic, assign) ButtonShapeType buttonShapeType;

+ (UIButton *)ButtonWithTitle:(NSString *)title shapeType:(ButtonShapeType)type open:(BOOL)open addSubView:(UIView *)subView buttonActionBlock:(SXYBlock)block;

@end
