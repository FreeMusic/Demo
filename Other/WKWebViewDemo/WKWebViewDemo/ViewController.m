//
//  ViewController.m
//  WKWebViewDemo
//
//  Created by mic on 2017/11/28.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()<WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载webView
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
}
/**
 *WKWebView的懒加载
 */
- (WKWebView *)webView{
    if(!_webView){
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        
    }
    return _webView;
}
/**
 *  WKNavigationDelegate来追踪加载过程
 *  页面开始加载的时候调用
 *  类似UIWebView的  -webViewDidStartLoad:
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"WKNavigationDelegate来追踪加载过程  页面开始加载的时候调用");
}
/**
 *  WKNavigationDelegate来追踪加载过程
 *  页面开始返回时调用（这个我把它理解为正在加载中）
 */
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@"WKNavigationDelegate来追踪加载过程  页面开始返回时调用");
}
/**
 *  WKNavigationDelegate来追踪加载过程
 *  页面加载完成之后调用
 *  类似 UIWebView 的 －webViewDidFinishLoad:
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"WKNavigationDelegate来追踪加载过程  页面加载完成之后调用");
}
/**
 *  WKNavigationDelegate来追踪加载过程
 *  页面加载失败时调用
 *  类似 UIWebView 的- webView:didFailLoadWithError:
 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"WKNavigationDelegate来追踪加载过程  页面加载失败时调用");
}
/**
 *  WKNavigationDelegate来进行页面跳转
 *  接收到服务器跳转请求之后再执行
 */
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
     NSLog(@"WKNavigationDelegate来进行页面跳转  接收到服务器跳转请求之后再执行");
}
/**
 *  WKNavigationDelegate来进行页面跳转
 *  在收到响应之后  决定是否跳转
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(nonnull WKNavigationResponse *)navigationResponse decisionHandler:(nonnull void (^)(WKNavigationResponsePolicy))decisionHandler{
    
    NSLog(@"%@", navigationResponse.response.URL.absoluteString);
    
    decisionHandler(WKNavigationResponsePolicyAllow);
}
/**
 *  WKNavigationDelegate来进行页面跳转
 *  在发送请求之前  决定是否跳转
 *  类似 UIWebView 的 -webView: shouldStartLoadWithRequest: navigationType:
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    decisionHandler(WKNavigationActionPolicyAllow);
}
/**
 *  WKUIDelegate
 *  创建一个新的WebView
 */
- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    return webView;
}
/**
 *  WKUIDelegate
 *  WebView的关闭
 */
- (void)webViewDidClose:(WKWebView *)webView{
    NSLog(@"WebView的关闭");
}
/**
 *  WKUIDelegate
 *  显示一个JS的alter（和JS的交互）
 *  JS里面的alert实现 如果不实现  网页的alert函数无效
 */
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    NSLog(@"显示一个JS的alter（和JS的交互）");
    UIAlertController *alterVC = [UIAlertController alertControllerWithTitle:message message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alterVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [alterVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [self presentViewController:alterVC animated:YES completion:^{
        
    }];
}
/**
 *  WKUIDelegate
 *  弹出一个输入框（和JS的交互）
 */
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler{
    completionHandler(@"弹出一个输入框（和JS的交互）");
}
/**
 *  显示一个确认框
 *  WKUIDelegate
 */
-(void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler{

}
/**
 *  WKWebView 执行脚本方法
 *  暂时还不理解怎么用
 *  completionHandler拥有两个参数 一个是返回错误 一个可以返回执行脚本后的返回值
 */
- (void)evaluateJavaScript:(NSString *)javaScriptString completionHandler:(void (^)(id, NSError *))completionHandler{
    completionHandler(@"15",nil);
}

- (void)userContentController:(nonnull WKUserContentController *)userContentController didReceiveScriptMessage:(nonnull WKScriptMessage *)message {
    
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return CGSizeMake(100, 100);
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    
}

- (void)setNeedsFocusUpdate {
    
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return YES;
}

- (void)updateFocusIfNeeded {
    
}

@end
