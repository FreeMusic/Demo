//
//  CardAnimationCell.m
//  Demo
//
//  Created by hztuen on 2017/6/1.
//  Copyright © 2017年 cesar. All rights reserved.
//

#import "CardAnimationCell.h"

@implementation CardAnimationCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self buildUI];
        
    }
    return self;
}

- (void)buildUI {
    //阴影视图
    UIView *shadowView1 = [[UIView alloc] init];
    shadowView1.layer.cornerRadius = 5;
    shadowView1.clipsToBounds = NO;
    shadowView1.layer.shadowColor = [UIColor colorWithHexString:@"8a8a8a" alpha:1.0].CGColor;
    shadowView1.layer.shadowOffset = CGSizeMake(0, 5);
    shadowView1.layer.shadowOpacity = 0.8;
    shadowView1.layer.shadowRadius = 10;
    [self addSubview:shadowView1];
    [shadowView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    //背景
    self.bgView = [[UIView alloc] init];
    self.bgView.alpha = 0.0;
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.layer.cornerRadius = 5;
    self.bgView.layer.masksToBounds = YES;
    [shadowView1 addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(shadowView1.mas_top);
        make.left.equalTo(shadowView1.mas_left);
        make.right.equalTo(shadowView1.mas_right);
        make.bottom.equalTo(shadowView1.mas_bottom);
    }];
    
    self.titleView = [[UIView alloc] init];
    self.titleView.layer.cornerRadius = 5;
    self.titleView.layer.masksToBounds = YES;
    [shadowView1 addSubview:self.titleView];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(shadowView1.mas_bottom);
        make.left.equalTo(shadowView1.mas_left);
        make.right.equalTo(shadowView1.mas_right);
        make.height.mas_equalTo([self Suit:100]);
    }];
    
    //标题
    self.title = [UILabel labelWithTitle:@"This is a title, this is a title, this is a title" AndColor:@"515151" AndFont:16 AndAlignment:NSTextAlignmentLeft];
    self.title.numberOfLines = 1;
    [self.titleView addSubview:self.title];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_top).offset([self Suit:15]);
        make.left.equalTo(self.titleView.mas_left).offset([self Suit:15]);
        make.width.mas_equalTo(self.frame.size.width);
    }];
    
    //价格
    self.price = [UILabel labelWithTitle:@"Price: $1000.00" AndColor:@"8a8a8a" AndFont:15 AndAlignment:NSTextAlignmentLeft];
    [self.titleView addSubview:self.price];
    [self.price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title.mas_bottom).offset([self Suit:5]);
        make.left.equalTo(self.titleView.mas_left).offset([self Suit:15]);
    }];
    
    self.favoriteLabel = [UILabel labelWithTitle:@"100 comments:" AndColor:@"8a8a8a" AndFont:14 AndAlignment:NSTextAlignmentLeft];
    [self.titleView addSubview:self.favoriteLabel];
    [self.favoriteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.price.mas_bottom).offset([self Suit:15]);
        make.left.equalTo(self.titleView.mas_left).offset([self Suit:15]);
        make.height.mas_equalTo([self Suit:20]);
    }];
    
    //评价
    self.starView = [[ShowStarView alloc] init];
    self.starView.level = 4;
    [self.titleView addSubview:self.starView];
    [self.starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.favoriteLabel.mas_centerY);
        make.left.equalTo(self.favoriteLabel.mas_right).offset([self Suit:10]);
        make.width.mas_equalTo([self Suit:70]);
        make.height.mas_equalTo([self Suit:20]);
    }];
    
    //最上面的图片
    self.coverImage = [[UIImageView alloc] init];
    self.coverImage.userInteractionEnabled = NO;
    self.coverImage.layer.cornerRadius = 5;
    self.coverImage.layer.masksToBounds = YES;
    [shadowView1 addSubview:self.coverImage];
    [self.coverImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(shadowView1.mas_top);
        make.left.equalTo(shadowView1.mas_left);
        make.right.equalTo(shadowView1.mas_right);
        make.bottom.equalTo(shadowView1.mas_bottom);
    }];
    
    //点击手势
    UITapGestureRecognizer *tapImage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage)];
    [self.coverImage addGestureRecognizer:tapImage];
}

//超出范围点击
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        CGPoint tempoint = [self.coverImage convertPoint:point fromView:self];
        if (CGRectContainsPoint(self.coverImage.bounds, tempoint))
        {
            view = self.coverImage;
        }
    }
    return view;
}

- (void)loadData:(NSString *)imageName {
    self.coverImage.image = [UIImage imageNamed:imageName];
}

- (void)tapImage {
    if (self.tapCoverImageBlock) {
        self.tapCoverImageBlock(self.tag - 1000);
    }
}

/**
 适配 给定4.7寸屏尺寸，适配4和5.5寸屏尺寸
 */
- (float)Suit:(float)MySuit
{
    (IS_IPHONE4INCH||IS_IPHONE35INCH)?(MySuit=MySuit/Suit4Inch):((IS_IPHONE55INCH)?(MySuit=MySuit*Suit55Inch):MySuit);
    return MySuit;
}

@end
