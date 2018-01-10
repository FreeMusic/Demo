//
//  CopyView.m
//  UIPasteboardDemo
//
//  Created by mic on 2017/11/22.
//  Copyright © 2017年 yunfu. All rights reserved.
//

#import "CopyView.h"

@interface CopyView ()
@property (strong, nonatomic) UIImageView* img1;
@property (strong, nonatomic) UIImageView* img2;
@end

@implementation CopyView

-(UIImageView *)img1{
    if (_img1 == nil) {
        _img1 = [[UIImageView alloc] initWithFrame:CGRectMake(10.0f, 20.0f, 100.0f, 100.0f)];
        NSString* path = [[NSBundle mainBundle] pathForResource:@"QQ空间1@2x" ofType:@"png"];
        _img1.image = [UIImage imageWithContentsOfFile:path];
    }
    return _img1;
}

-(UIImageView *)img2{
    if (_img2 == nil) {
        _img2 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.img1.frame)+50.0f, 20.0f, 100.0f, 100.0f)];
        _img2.backgroundColor = [UIColor lightGrayColor];
    }
    return _img2;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.img1];
        [self addSubview:self.img2];
    }
    return self;
}

-(BOOL)canBecomeFirstResponder{
    return YES;
}
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    NSArray* methodNameArr = @[@"copy:",@"cut:",@"select:",@"selectAll:",@"paste:"];
    if ([methodNameArr containsObject:NSStringFromSelector(action)]) {
        return YES;
    }
    return [super canPerformAction:action withSender:sender];
}

-(void)copy:(id)sender{
    UIPasteboard* pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setImage:self.img1.image];
}

-(void)paste:(id)sender{
    UIPasteboard* pasteboard = [UIPasteboard generalPasteboard];
    self.img2.image = [pasteboard image];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self becomeFirstResponder];
    UIMenuController* menuController = [UIMenuController sharedMenuController];
    [menuController setTargetRect:self.img1.frame inView:self];
    [menuController setMenuVisible:YES animated:YES];
}

@end
