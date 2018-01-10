//
//  ViewController.m
//  iPhoneXTest
//
//  Created by mic on 2017/12/20.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

/**
 *  屏幕尺寸宽和高
 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
/**
 *  比例系数适配
 */
#define m6PScale              kScreenWidth/1242.0
#define m6Scale               kScreenWidth/750.0
#define m5Scale               kScreenWidth/640.0

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

//电池栏
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
//导航栏
#define kNavBarHeight 44.0
//tabbar高度
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
//导航+电池栏
#define NavigationBarHeight (kStatusBarHeight + kNavBarHeight)
//安全区底部高度
#define KSafeBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34.0:0)

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIView *backgroundImage;
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIButton *shareBtn;//二维码分享按钮
@property (nonatomic, strong) UIButton *inviteBtn;//分享邀请
@property (nonatomic, strong) UIImage *imgName;//二维码
@property (nonatomic, strong) NSString *realName;//用户的名字

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];;
    
    //二维码分享按钮
    [self.view addSubview:self.shareBtn];
    
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(336*m6Scale, 89*m6Scale));
        make.bottom.mas_equalTo(-KSafeBarHeight);
        make.left.mas_equalTo(20*m6Scale);
    }];
    //分享邀请
    [self.view addSubview:self.inviteBtn];
    [self.inviteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(336*m6Scale, 89*m6Scale));
        make.bottom.mas_equalTo(-KSafeBarHeight);
        make.right.mas_equalTo(-20*m6Scale);
    }];
}
/**
 *  返回
 */
- (void)onClickLeftItem
{
    [self.navigationController popViewControllerAnimated:YES];
}
/**
 * 二维码分享按钮
 */
- (UIButton *)shareBtn{
    if(!_shareBtn){
        _shareBtn = [UIButton buttonWithType:0];
        [_shareBtn addTarget:self action:@selector(shareButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_shareBtn setImage:[UIImage imageNamed:@"inviteFried_二维码分享"] forState:0];
    }
    return _shareBtn;
}
/**
 * 分享邀请
 */
- (UIButton *)inviteBtn{
    if(!_inviteBtn){
        _inviteBtn = [UIButton buttonWithType:0];
        [_inviteBtn addTarget:self action:@selector(inviteFriedButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_inviteBtn setImage:[UIImage imageNamed:@"inviteFried_分享邀请"] forState:0];
    }
    return _inviteBtn;
}
/**
 *  二维码分享按钮点击事件
 */
- (void)shareButtonClick{
    
}
//点击取消按钮
- (void)didCancelActivityAction:(UIGestureRecognizer *)tap {
    
    
    
}
/**
 * 分享邀请按钮点击事件
 */
- (void)inviteFriedButtonClick{
    
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self labelExample];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}

//HUD
- (void)labelExample {
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view addSubview:self.webView];//加载webview
    [self.view bringSubviewToFront:self.shareBtn];
    [self.view bringSubviewToFront:self.inviteBtn];
    self.navigationController.navigationBar.hidden = NO;
    //navigationBar延展性并设置透明
    self.navigationController.navigationBar.translucent = NO;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}


@end
