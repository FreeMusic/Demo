//
//  UIButton+Category.m
//  RunTime_Objc_msgSend
//
//  Created by mic on 2017/12/11.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "UIButton+Category.h"
#import <objc/runtime.h>

@implementation UIButton (Category)

char buttonKey;

- (void)setOpen:(BOOL)open{
    
    objc_setAssociatedObject(self, @selector(open), @(open), OBJC_ASSOCIATION_ASSIGN);
    
}
- (BOOL)open{
    
    NSNumber *value = objc_getAssociatedObject(self, @selector(open));
    
    return value.boolValue;
    
}
- (void)setButtonShapeType:(ButtonShapeType)buttonShapeType{
    objc_setAssociatedObject(self, @selector(buttonShapeType), @(buttonShapeType), OBJC_ASSOCIATION_ASSIGN);
    if (buttonShapeType == ButtonShapeTypeWithLine) {
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor orangeColor].CGColor;
        self.backgroundColor = [UIColor whiteColor];
        [self setTitleColor:[UIColor orangeColor] forState:0];
    }else if(buttonShapeType == ButtonShapeTypeWithSolid){
        self.backgroundColor = [UIColor orangeColor];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}

- (ButtonShapeType)buttonShapeType{
    
    NSNumber *value = objc_getAssociatedObject(self, @selector(buttonShapeType));
    
    return value.intValue;
}

+ (UIButton *)ButtonWithTitle:(NSString *)title shapeType:(ButtonShapeType)type open:(BOOL)open addSubView:(UIView *)subView buttonActionBlock:(SXYBlock)block{
    UIButton *btn = [UIButton buttonWithType:0];
    btn.open = open;
    btn.buttonShapeType = type;
    [btn setTitle:title forState:0];
    [subView addSubview:btn];
    
    objc_setAssociatedObject(btn, &buttonKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [btn addTarget:btn action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (void)buttonAction:(UIButton *)sender{
    
    SXYBlock block = objc_getAssociatedObject(sender, &buttonKey);
    
    if (block) {
        block(sender);
    }
}

@end
