//
//  StrcutView.m
//  结构体Demo
//
//  Created by mic on 2017/8/25.
//  Copyright © 2017年 yunfu. All rights reserved.
//

#import "StrcutView.h"

struct userInformation{
    int age;
    int name;
    int ID;
}information;

@implementation StrcutView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self. backgroundColor = [UIColor redColor];
    }
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    struct userInformation userInfor = {18, 111, 410621};
    
    NSLog(@"%d", userInfor.ID);
}


@end
