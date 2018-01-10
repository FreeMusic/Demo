//
//  ViewController.m
//  textTableView
//
//  Created by mic on 2017/9/12.
//  Copyright © 2017年 yunfu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
    
    //[self addSwipsToTableView];
}
/**
 * 在tableView上添加上拉和下拉的手势
 */
- (void)addSwipsToTableView{
    UISwipeGestureRecognizer *swipUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self.tableView action:@selector(slideView:)];
    [swipUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.tableView addGestureRecognizer:swipUp];
    
    UISwipeGestureRecognizer *swipDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self.tableView action:@selector(slideView:)];
    [swipDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.tableView addGestureRecognizer:swipDown];
}
/**
 *  手势上下拉滑动的事件
 */
- (void)slideView:(UISwipeGestureRecognizer *)sender{
    NSLog(@"%f", self.tableView.contentOffset.y);
    if (self.tableView.contentOffset.y <= 0) {
        
        if (sender.direction == UISwipeGestureRecognizerDirectionUp) {
            
        }
    }
}
/**
 *tableView的懒加载
 */
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.tableFooterView = [UIView new];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        
        UISwipeGestureRecognizer *swipUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideView:)];
        [swipUp setDirection:UISwipeGestureRecognizerDirectionUp];
        swipUp.delegate = self;
        [_tableView addGestureRecognizer:swipUp];
        
        UISwipeGestureRecognizer *swipDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideView:)];
        [swipDown setDirection:UISwipeGestureRecognizerDirectionDown];
        swipDown.delegate = self;
        [_tableView addGestureRecognizer:swipDown];
    }
    return _tableView;
}
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return YES;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
#pragma mark - cellForRowAtIndexPath
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
    }
    cell.textLabel.text = @"444444";
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
