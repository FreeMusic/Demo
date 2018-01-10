//
//  JZCollectionViewCell.m
//  JZCycleScrollView
//
//  Created by mic on 2017/11/22.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "JZCollectionViewCell.h"
#import "UIView+JZCategory.h"

@implementation JZCollectionViewCell
{
    __weak UILabel *_titleLabel;
}


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setupImageView];
        [self setupTitleLabel];
    }
    
    return self;
}

- (void)setTitleLabelBackGroundColor:(UIColor *)titleLabelBackGroundColor{
    _titleLabelBackGroundColor = titleLabelBackGroundColor;
    _titleLabel.backgroundColor = titleLabelBackGroundColor;
}

-(void)setTitleLabelTextColor:(UIColor *)titleLabelTextColor{
    _titleLabelTextColor = titleLabelTextColor;
    _titleLabel.textColor = titleLabelTextColor;
}

-(void)setTitleLabelTextFont:(UIFont *)titleLabelTextFont{
    _titleLabelTextFont = titleLabelTextFont;
    _titleLabel.font = titleLabelTextFont;
}

- (void)setupImageView{
    UIImageView *imageView = [[UIImageView alloc] init];
    _imageView = imageView;
    [self.contentView addSubview:imageView];
}

- (void)setupTitleLabel{
    UILabel *titleLabel = [[UILabel alloc] init];
    _titleLabel = titleLabel;
    _titleLabel.hidden = YES;
    [self.contentView addSubview:titleLabel];
}

-(void)setTitle:(NSString *)title{
    _title = [title copy];
    _titleLabel.text = [NSString stringWithFormat:@"   %@", title];
    if (_titleLabel.hidden) {
        _titleLabel.hidden = NO;
    }
}

-(void)setTitleLabelTextAlignment:(NSTextAlignment)titleLabelTextAlignment{
    _titleLabelTextAlignment = titleLabelTextAlignment;
    _titleLabel.textAlignment = titleLabelTextAlignment;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    if (self.onlyDisplayText) {
        _titleLabel.frame = self.bounds;
    }else{
        
        _imageView.frame = self.bounds;
        CGFloat titleLabelW = self.width;
        CGFloat titleLabelH = self.height;
        CGFloat pointX = 0;
        CGFloat pointY = self.height - titleLabelH;
        
        _titleLabel.frame = CGRectMake(pointX, pointY, titleLabelW, titleLabelH);
    }
}

@end
