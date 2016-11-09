//
//  UIImage+Tool.m
//  屏幕截图
//
//  Created by yz on 14-8-3.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "UIImage+Tool.h"

@implementation UIImage (Tool)

+ (instancetype)captureWithView:(UIView *)view
{
    // 1.开启上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    
    // 2.获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 3.把控制器图层渲染到上下文
    [view.layer renderInContext:ctx];
    
    // 4.取出新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;

}

@end
