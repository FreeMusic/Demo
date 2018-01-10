//
//  ViewController.m
//  LZBCalendar
//
//  Created by zibin on 16/11/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "LZBCalendar.h"
#import "LZBCalendarAppearStyle.h"
#import "NSDate+Component.h"

@interface ViewController ()<LZBCalendarDataSource,LZBCalendarDataDelegate>

@property (nonatomic, strong) LZBCalendar *calendar;
@property (nonatomic, strong)  LZBCalendarAppearStyle *style;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.calendar];
  
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.calendar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
}


#pragma mark - delegate
- (void)calendar:(LZBCalendar *)calendar didSelectDate:(NSDate *)date
{
    NSLog(@"当前调用的方法:%s------行号:line-%d ",__func__, __LINE__);
    
}

- (void)calendar:(LZBCalendar *)calendar layoutCallBackHeight:(CGFloat)height
{
    self.calendar.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, height);
}


#pragma mark - lazy
- (LZBCalendar *)calendar
{
  if(_calendar == nil)
  {
      _calendar = [[LZBCalendar alloc]initWithStyle:self.style];
      _calendar.dataSource = self;
      _calendar.delegate = self;
  }
    return _calendar;
}

- (LZBCalendarAppearStyle *)style
{
  if(_style == nil)
  {
      _style = [[LZBCalendarAppearStyle alloc]init];
      _style.isNeedCustomHeihgt = YES;
  }
    return _style;
}


@end
