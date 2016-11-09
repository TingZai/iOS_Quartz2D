//
//  UIImage+Tool.m
//  图片裁剪
//
//  Created by yz on 14-8-3.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "UIImage+Tool.h"

@implementation UIImage (Tool)

+ (instancetype)circleImageWithName:(NSString *)imageName borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    // 1.加载旧图片
    UIImage *oldImage = [UIImage imageNamed:imageName];
    
    // 设置圆环宽度
    CGFloat boardW = borderWidth;
    CGFloat imageW =  oldImage.size.width + 2 * boardW;
    CGFloat imageH = oldImage.size.height + 2 *boardW;
    
    // 只有正方形才能正切圆，选择一个最短的尺寸，正切。
    CGFloat circleW = imageW > imageH ? imageH : imageW;
    
    CGRect rect = CGRectMake(0, 0, circleW, circleW);
    
    // 2.开启图像上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    
    // 3。获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画外圆
    UIBezierPath *path  = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    CGContextAddPath(ctx, path.CGPath);
    
    [borderColor set];
    
    CGContextFillPath(ctx);
    
    // 设置头像尺寸
    rect = CGRectMake(boardW, boardW, oldImage.size.width , oldImage.size.height);
    
    // 5.创建裁剪路径
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    // 6.裁剪路径
    // 根据这个路径进行裁剪，超出路径以外的部分就不会显示了
    [clipPath addClip];
    
    // 7.画头像
    [oldImage drawInRect:rect];
    
    // 不能直接在这返回，上下文没有关闭，会消耗内存.
    // 8.获取新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 9.关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;

}

@end
