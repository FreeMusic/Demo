//
//  ViewController.m
//  LSTableViewHeaderView
//
//  Created by lisonglin on 26/06/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "ViewController.h"

#define KScreenWidth  [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

#define HeaderHeight 200

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UIImageView *bgImgView;    //背景图片

@property(nonatomic, strong) UITableView * tableView;   //tableView


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self initTableView];
}

- (void)initTableView {

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, HeaderHeight)];
    headerView.backgroundColor = [UIColor clearColor];
    
    UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, HeaderHeight)];
    image.image = [UIImage imageNamed:@"b"];
    [headerView addSubview:image];
    self.bgImgView = image;
    
    self.tableView.tableHeaderView = headerView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld个cell",indexPath.row];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY < 0) {
        CGFloat totalOffsetY = HeaderHeight + ABS(offsetY);
        CGFloat f = totalOffsetY / HeaderHeight;
        
        self.bgImgView.frame = CGRectMake(- (KScreenWidth * f - KScreenWidth) / 2, offsetY, KScreenWidth * f, totalOffsetY);
    }
    
}


@end
