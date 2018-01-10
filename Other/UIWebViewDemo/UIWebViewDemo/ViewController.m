//
//  ViewController.m
//  UIWebViewDemo
//
//  Created by mic on 2017/12/4.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "ViewController.h"
#import "Factory.h"

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self.view addSubview:self.webView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobile.hcjinfu.com:9083/html/newsWelfare.html"]];

    [self.webView loadRequest:request];
    
    UIButton *btn = [Factory ButtonWithTitle:@"点击" TitleColor:[UIColor redColor] addTarget:self action:@"buttonAction" addSubView:self.view];
    btn.frame = CGRectMake(100, 100, 100, 100);
}

- (void)buttonAction{
    NSLog(@"buttonAction");
}

- (UIWebView *)webView{
    if(!_webView){
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        _webView.delegate = self;
    }
    return _webView;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    //获取当前webView的内容高度
    NSString *fileHeight = [webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"];
    
    NSLog(@"webViewDidFinishLoad  %@", fileHeight);
    
    //获取webView的页面内容
    NSString *content = [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.textContent"];
    
    NSLog(@"获取webView的页面内容 %@", content);
    
    //获取当前页面的title
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    NSLog(@"获取当前页面的title %@", title);
    
    //获取当前页面的URL
    //NSString *url = [webView stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    NSString *url = webView.request.URL.absoluteString;
    
    NSLog(@"获取当前页面的URL %@", url);
    
    //获取环境变量
    NSString *str = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    NSLog(@"获取环境变量  %@", str);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
