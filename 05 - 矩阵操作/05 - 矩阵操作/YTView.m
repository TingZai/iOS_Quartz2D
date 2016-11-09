//
//  YTView.m
//  05 - 矩阵操作
//
//  Created by 余婷 on 16/1/13.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "YTView.h"

@implementation YTView

- (void)drawRect:(CGRect)rect{

    [super drawRect:rect];
    
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //设置线宽
    CGContextSetLineWidth(ctx, 3);
    
    //保存当前上下文状态
    CGContextSaveGState(ctx);
    
    //矩阵操作
    //1.上下文上的所有内容缩小一倍
//    CGContextScaleCTM(ctx, 0.5, 0.5);
    //2.旋转
    CGContextRotateCTM(ctx, M_PI_4 * 0.3);
    //3.平移
    CGContextTranslateCTM(ctx, 10, 50);
    
    
    
    //画矩形
    CGContextAddRect(ctx, CGRectMake(10, 10, 50, 50));
    
    //画圆
    CGContextAddEllipseInRect(ctx, CGRectMake(100, 100, 100, 100));
    
    //渲染
    CGContextStrokePath(ctx);
    
    
    //恢复最初上下文状态
    CGContextRestoreGState(ctx);
    
    //画线
    CGContextMoveToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 200, 250);
    
    
    
    //渲染
    CGContextStrokePath(ctx);
    
    
}

@end
