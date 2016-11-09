//
//  ViewController.m
//  图片的裁剪
//
//  Created by 余婷 on 16/3/21.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+YTImage.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //0.加载
    UIImage * image = [UIImage imageNamed:@"image"];
    
    
    
    
    //2.显示图片
    _imageView.image = [UIImage imageWithClipImage:image borderWidth:2 borderColor:[UIColor blackColor]];
    
    
    
}

- (void)test1{

    //图片裁剪，将正方形图片裁剪成圆形
    
    //0.加载
    UIImage * image = [UIImage imageNamed:@"image"];
    
    //1.开启位图上下文，跟图片尺寸一样
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //2.设置裁剪区域
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [path addClip];
    
    //3.绘制图片
    [image drawAtPoint:CGPointZero];
    
    //4.从上下文中获取图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //5.关闭上下文
    UIGraphicsEndImageContext();
    
    
    //显示图片
    _imageView.image = newImage;
}

@end
