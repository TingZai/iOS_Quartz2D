//
//  UIImage+YTImage.m
//  图片的裁剪
//
//  Created by 余婷 on 16/3/21.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "UIImage+YTImage.h"

@implementation UIImage(YTImage)

+ (UIImage *)imageWithClipImage:(UIImage *)image borderWidth:(CGFloat)borderW borderColor:(UIColor *)borderColor{
    
    //0.加载
    //    UIImage * image = [UIImage imageNamed:@"image"];
    
    //1.开启位图上下文，跟图片尺寸一样
    //设置圆环的宽度
    CGFloat border = borderW;
    //大圆的宽度
    CGFloat ovalW = image.size.width + 2 * border;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(ovalW, ovalW), NO, 0);
    
    //2.画大圆
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, ovalW, ovalW)];
    [borderColor  set];
    
    [path fill];
    
    //3.设置裁剪区域
    UIBezierPath * path2 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, image.size.width, image.size.width)];
    [path2 addClip];
    
    
    //4.绘制图片
    [image drawAtPoint:CGPointMake(border, border)];
    
    //5.获取图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //6.关闭上下文
    UIGraphicsEndImageContext();
    
    
    //7.显示图片
    return newImage;
    
}

@end
