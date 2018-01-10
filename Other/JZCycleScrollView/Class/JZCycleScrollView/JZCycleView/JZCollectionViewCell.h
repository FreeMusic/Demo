//
//  JZCollectionViewCell.h
//  JZCycleScrollView
//
//  Created by mic on 2017/11/22.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) UIColor *titleLabelTextColor;
@property (nonatomic, strong) UIFont *titleLabelTextFont;
@property (nonatomic, strong) UIColor *titleLabelBackGroundColor;
@property (nonatomic, assign) CGFloat titleLabelHeight;
@property (nonatomic, assign) NSTextAlignment titleLabelTextAlignment;

@property (nonatomic, assign) BOOL hasConfigured;

/** 只展示文字轮播 */
@property (nonatomic, assign) BOOL onlyDisplayText;

@end
