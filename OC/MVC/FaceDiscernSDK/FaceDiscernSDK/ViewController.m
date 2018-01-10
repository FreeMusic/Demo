//
//  ViewController.m
//  FaceDiscernSDK
//
//  Created by mic on 2017/10/27.
//  Copyright © 2017年 yunfu. All rights reserved.
//

#import "ViewController.h"
#import <ZMCert/ZMCert.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *bizTextView;
@property (weak, nonatomic) IBOutlet UITextField *merchantView;
@property (weak, nonatomic) IBOutlet UILabel *resultView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Start Detect
- (IBAction)startAction:(id)sender {
    ZMCertification *manager = [[ZMCertification alloc] init];
    __weak ViewController *weakSelf = self;
    
#if IsZMCertVideo
    //  录制动作检测录像
    [manager startVideoWithBizNO:self.bizTextView.text
                      merchantID:self.merchantView.text
                       extParams:@{@"RecordVideo" : [NSNumber numberWithBool:YES]}
                  viewController:self
                        onFinish:^(BOOL isCanceled, BOOL isPassed, ZMStatusErrorType errorCode, NSString * _Nullable videoPath) {
                            if (videoPath) {
                                ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc]init];
                                [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:[NSURL fileURLWithPath:videoPath]
                                                                  completionBlock:^(NSURL *assetURL, NSError *error) {
                                                                      if (error) {
                                                                          NSLog(@"Save video fail:%@",error);
                                                                      } else {
                                                                          NSLog(@"Save video succeed.");
                                                                      }
                                                                  }];
                            }
                            if (isCanceled) {
                                NSLog(@"用户取消了认证");
                                weakSelf.resultView.text = [NSString stringWithFormat:@"用户取消了认证！"];
                            } else {
                                if (isPassed) {
                                    NSLog(@"认证成功");
                                    weakSelf.resultView.text = [NSString stringWithFormat:@"认证成功"];
                                } else {
                                    NSLog(@"认证失败了 %zi", errorCode);
                                    weakSelf.resultView.text = [NSString stringWithFormat:@"认证中出现问题--%zi", errorCode];
                                }
                            }
                        }];
#else
    //  不进行动作检测视频录制
    [manager startWithBizNO:self.bizTextView.text
                 merchantID:self.merchantView.text
                  extParams:nil
             viewController:self
                   onFinish:^(BOOL isCanceled, BOOL isPassed, ZMStatusErrorType errorCode) {
                       if (isCanceled) {
                           NSLog(@"用户取消了认证");
                           weakSelf.resultView.text = [NSString stringWithFormat:@"用户取消了认证！"];
                       }else{
                           if (isPassed) {
                               NSLog(@"认证成功");
                               weakSelf.resultView.text = [NSString stringWithFormat:@"认证成功"];
                           }else{
                               NSLog(@"认证失败了 %zi", errorCode);
                               weakSelf.resultView.text = [NSString stringWithFormat:@"认证中出现问题--%zi", errorCode];
                           }
                       }
                   }];
#endif
}

@end
