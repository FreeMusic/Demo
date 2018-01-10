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

@interface ViewController ()<LZBCalendarDataSource,LZBCalendarDataDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) LZBCalendar *calendar;
@property (nonatomic, strong) LZBCalendarAppearStyle *style;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) CGFloat calendarHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.calendarHeight = 300;
    [self.view addSubview:self.tableView];
}
/**
 *tableView的懒加载
 */
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.tableFooterView = [UIView new];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        
        _calendar = [[LZBCalendar alloc]initWithStyle:self.style];
        _calendar.dataSource = self;
        _calendar.delegate = self;
        _tableView.tableHeaderView = _calendar;
    }
    return _tableView;
}
#pragma mark - delegate
- (void)calendar:(LZBCalendar *)calendar didSelectDate:(NSDate *)date
{
    NSLog(@"当前调用的方法:%s------行号:line-%d ",__func__, __LINE__);
    
}

- (void)calendar:(LZBCalendar *)calendar layoutCallBackHeight:(CGFloat)height
{
    self.calendarHeight = height;
    self.calendar.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, height);
    [self.tableView reloadData];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

#pragma mark - cellForRowAtIndexPath
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *reuse = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuse];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
@end
