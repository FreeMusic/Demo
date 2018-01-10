//
//  TestView.h
//  CCFoldCellDemo
//
//  Created by mic on 2017/8/29.
//  Copyright © 2017年 Bref. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestView : UIView


- (void)testDealWithBlock:(BOOL)isBlock animated:(BOOL)animated complistion:(void(^)(NSInteger index))complistion;

@end
