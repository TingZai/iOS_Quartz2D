//
//  ViewController.m
//  截屏
//
//  Created by 余婷 on 16/3/21.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //生成新的图片
    
    //开启新的位图上下问
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //把控件上的layer渲染到上下文
    [self.view.layer renderInContext:ctx];
    
    //拿到图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //将图片写到桌面
    NSData * data = UIImagePNGRepresentation(newImage);
    
    [data writeToFile:@"/Users/yuting/Desktop/111.png" atomically:YES];
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
