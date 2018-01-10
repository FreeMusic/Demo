//
//  ViewController.m
//  CameraDemo
//
//  Created by mic on 2017/12/7.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "ViewController.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate>
{
    BOOL isFullScreen;
}
@property(nonatomic,strong)UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100,100, 200, 200)];
    _imageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_imageView];
    
    UIButton *chooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    chooseBtn.frame = CGRectMake(100, 30, 100, 40);
    [chooseBtn addTarget:self action:@selector(chooseImage:) forControlEvents:UIControlEventTouchUpInside];
    [chooseBtn setBackgroundColor:[UIColor brownColor]];
    [chooseBtn setTitle:@"选择照片"forState:UIControlStateNormal];
    [self.view addSubview:chooseBtn];
    
}

#pragma mark - 保存图片至沙盒
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    // 获取沙盒目录
    NSString *fullPath = [[NSHomeDirectory()stringByAppendingPathComponent:@"Documents"]stringByAppendingPathComponent:imageName];
    
    // 将图片写入文件
    [imageData writeToFile:fullPath atomically:NO];
}

#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self saveImage:image withName:@"currentImage.png"];
    
    NSString *fullPath = [[NSHomeDirectory()stringByAppendingPathComponent:@"Documents"]stringByAppendingPathComponent:@"currentImage.png"];
    
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    
    isFullScreen =NO;
    [self.imageView setImage:savedImage];
    
    self.imageView.tag =100;
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    isFullScreen = !isFullScreen;
    UITouch *touch = [touches anyObject];
    
    CGPoint touchPoint = [touch locationInView:self.view];
    
    CGPoint imagePoint = self.imageView.frame.origin;
    //touchPoint.x ，touchPoint.y 就是触点的坐标
    
    // 触点在imageView内，点击imageView时放大,再次点击时缩小
    if(imagePoint.x <= touchPoint.x && imagePoint.x +self.imageView.frame.size.width >=touchPoint.x && imagePoint.y <=  touchPoint.y && imagePoint.y+self.imageView.frame.size.height >= touchPoint.y)
    {
        // 设置图片放大动画
        [UIView beginAnimations:nil context:nil];
        // 动画时间
        [UIView setAnimationDuration:1];
        
        if (isFullScreen) {
            // 放大尺寸
            
            self.imageView.frame =CGRectMake(0,0, kWidth, kHeight);
        }
        else {
            // 缩小尺寸
            self.imageView.frame =CGRectMake(100,100, 200, 200);
        }
        // commit动画
        [UIView commitAnimations];
        
    }
    
}

#pragma mark - actionsheet delegate
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag ==255) {
        
        NSUInteger sourceType = 0;
        
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            switch (buttonIndex) {
                case 0:
                    // 取消
                    return;
                case 1:
                    // 相机
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                    
                case 2:
                    // 相册
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
            }
        }
        else {
            if (buttonIndex == 0) {
                
                return;
            } else {
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
        }
        // 跳转到相机或相册页面
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        
        imagePickerController.delegate = self;
        
        imagePickerController.allowsEditing = YES;
        
        imagePickerController.sourceType = sourceType;
        
        [self presentViewController:imagePickerController animated:YES completion:^{}];
        
    }
}
- (void)chooseImage:(UIButton *)btn {
    
    UIActionSheet *sheet;
    // 判断是否支持相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        sheet  = [[UIActionSheet alloc] initWithTitle:@"选择"delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消"otherButtonTitles:@"拍照",@"从相册选择",nil];
    }
    else {
        sheet = [[UIActionSheet alloc] initWithTitle:@"选择"delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消"otherButtonTitles:@"从相册选择",nil];
    }
    sheet.tag = 255;
    [sheet showInView:self.view];
}


@end
