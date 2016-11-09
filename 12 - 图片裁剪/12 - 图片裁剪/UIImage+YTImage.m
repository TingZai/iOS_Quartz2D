//
//  UIImage+YTImage.m
//  12 - 图片裁剪
//
//  Created by 余婷 on 16/1/21.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "UIImage+YTImage.h"

@implementation UIImage(YTImage)

+ (instancetype)cirleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor{

    //1.加载原图
    UIImage * oldImage = [UIImage imageNamed:name];
    
    CGFloat radius = oldImage.size.width > oldImage.size.height ? oldImage.size.height : oldImage.size.width;
    
    //2.开启上下文

    CGFloat imageW = radius + borderWidth * 2;
    CGFloat imageH = radius + borderWidth * 2;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    
    //3.获取位图
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    
    //4.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //5.画边框
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5;  //大圆半径
    CGFloat centerX = bigRadius;
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx);  //画圆
    
    //6.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2.0f, 0);
    
    //裁剪（后面画的东西才会受影响）
    CGContextClip(ctx);
    
    //7.画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, radius, radius)];
    
    //8.取图
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //9.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
    
    
}

@end
