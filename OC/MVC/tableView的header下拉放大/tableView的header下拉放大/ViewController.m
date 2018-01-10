//
//  ViewController.m
//  tableView的header下拉放大
//
//  Created by mic on 2017/8/28.
//  Copyright © 2017年 yunfu. All rights reserved.
//

#import "ViewController.h"

#define KScreenWidth  [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

#define HeaderHeight 200

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UIImageView *bgImgView;    //背景图片

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
}

/**
 *tableView的懒加载
 */
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.tableFooterView = [UIView new];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        
        UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, HeaderHeight)];
        headerView.backgroundColor = [UIColor clearColor];
        
        UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, HeaderHeight)];
        image.image = [UIImage imageNamed:@"b"];
        [headerView addSubview:image];
        self.bgImgView = image;
        
        self.tableView.tableHeaderView = headerView;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

#pragma mark - cellForRowAtIndexPath
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld个cell",indexPath.row];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY < 0) {
        CGFloat totalOffsetY = HeaderHeight + ABS(offsetY);
        CGFloat f = totalOffsetY / HeaderHeight;
        
        self.bgImgView.frame = CGRectMake(- (KScreenWidth * f - KScreenWidth) / 2, offsetY, KScreenWidth * f, totalOffsetY);
    }
}

@end
