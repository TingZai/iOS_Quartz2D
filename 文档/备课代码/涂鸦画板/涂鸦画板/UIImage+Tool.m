//
//  UIImage+Tool.m
//  涂鸦画板
//
//  Created by yz on 14-8-8.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "UIImage+Tool.h"

@implementation UIImage (Tool)

+ (instancetype)captureWithView:(UIView *)view
{
    // 1.开启图形上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
    
    // 2.获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 3.渲染图层
    [view.layer renderInContext:ctx];
    
    // 4.获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5.关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}


@end
