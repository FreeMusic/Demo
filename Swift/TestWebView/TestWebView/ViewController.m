//
//  ViewController.m
//  TestWebView
//
//  Created by mic on 2017/9/25.
//  Copyright © 2017年 yunfu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property (strong, nonatomic) UIWebView *webView;
@property (nonatomic, strong) NSString *curentURL;
@property (nonatomic, strong) NSString *currentTitle;
@property (nonatomic, strong) NSString *currentHTML;
@property (nonatomic, assign) NSInteger num;//cishu 次数

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _webView.delegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://zhidao.baidu.com/question/1303151216526796659.html"]];
    [_webView loadRequest:request];
    [self.view addSubview:_webView];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    _num++;
    if (_num == 1) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
        
        self.curentURL = webView.request.URL.absoluteString;
        
        NSString *JS = @"document.documentElement.innerHTML";//获取当前网页的html
        self.currentHTML = [webView stringByEvaluatingJavaScriptFromString:JS];
        NSLog(@"%@", self.currentHTML);
    }else{
        return;
    }
}

@end
