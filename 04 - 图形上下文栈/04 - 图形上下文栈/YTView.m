//
//  YTView.m
//  04 - 图形上下文栈
//
//  Created by 余婷 on 16/1/13.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "YTView.h"

@implementation YTView

- (void)drawRect:(CGRect)rect{

    [super drawRect:rect];
    
    //1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //将上下文添加到上下文栈中
    CGContextSaveGState(ctx);
    
    //设置绘图状态
    CGContextSetLineWidth(ctx, 6);
    [[UIColor redColor] set];
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    //第1根线
    CGContextMoveToPoint(ctx, 50, 100);
    CGContextAddLineToPoint(ctx, 200, 200);
    
    CGContextStrokePath(ctx);
    
    
    //上下文出栈
    CGContextRestoreGState(ctx);
    
    //第2根线
    CGContextMoveToPoint(ctx, 100, 70);
    CGContextAddLineToPoint(ctx, 100, 200);
    
    //设置绘制图状态
//    CGContextDrawPath(ctx, kCGPathStroke);
    CGContextStrokePath(ctx);
    
    
}

@end
