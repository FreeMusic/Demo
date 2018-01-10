//
//  ViewController.m
//  RunLoop
//
//  Created by mic on 2017/12/29.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "TestRunLoop.h"
#import "UIButton+Category.h"

@interface TestRunLoop ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TestRunLoop

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.tableView];
    
    //[self CFRunLoopObserverRef];
    
    //[self useRunLoopLoadUIImageView];
}
/**
 *  imageView
 */
- (UIImageView *)imageView{
    if(!_imageView){
//        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Himage"]];
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(0, 100,self.view.frame.size.width, 235);
    }
    return _imageView;
}
/**
 *tableView的懒加载
 */
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.tableFooterView = [UIView new];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
    }
    return _tableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
#pragma mark -- cellForRowAtIndexPath
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
        UIButton *button;
        if (indexPath.row == 0) {
            button = [UIButton ButtonWithTitle:@"测试RunLoop" shapeType:ButtonShapeTypeWithSolid open:YES addSubView:cell buttonActionBlock:^(UIButton *button) {
                //        NSLog(@"我在测试RunLoop  当前RunLoop***************%@", [NSRunLoop currentRunLoop]);
                //        NSLog(@"我在测试RunLoop  MainRunLoop***************%@", [NSRunLoop mainRunLoop]);
                /***********添加定期器一*****************/
//                [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
                /***********添加定期器二*****************/
                NSTimer *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
                //[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
                [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
                /***********
                 两种方法都会启动定时器，这说明第一种方法scheduledTimerWithTimeInterval会自动将定时器加载到当前RunLoop中，并且默认模式为NSDefaultRunLoopMode。
                 *****************/
            }];
            button.frame =CGRectMake(100, 5, 200, 50);
        }
    }
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld行", indexPath.row+1];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
/**
 *  定期器NSTimer
 */
- (void)timerAction{
    NSLog(@"定期器NSTimer");
}
/**
 * CFRunLoopObserverRefRun Loop Observer Activities
 typedef CF_OPTIONS(CFOptionFlags, CFRunLoopActivity) {
    kCFRunLoopEntry = (1UL << 0),
    kCFRunLoopBeforeTimers = (1UL << 1),
    kCFRunLoopBeforeSources = (1UL << 2),
    kCFRunLoopBeforeWaiting = (1UL << 5),
    kCFRunLoopAfterWaiting = (1UL << 6),
    kCFRunLoopExit = (1UL << 7),
    kCFRunLoopAllActivities = 0x0FFFFFFFU
};
 */
- (void)CFRunLoopObserverRef{
    
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        NSLog(@"%lu", activity);
    });
    
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopCommonModes);
    
    CFRelease(observer);
}
/**
 *  UIImageView的使用
 */
- (void)useRunLoopLoadUIImageView{
    [self.view addSubview:self.imageView];
    [self.imageView performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"Himage"] afterDelay:2 inModes:@[NSRunLoopCommonModes]];
}

@end
