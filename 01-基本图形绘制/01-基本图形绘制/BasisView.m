//
//  BasisView.m
//  01-基本图形绘制
//
//  Created by 余婷 on 16/1/12.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "BasisView.h"

@implementation BasisView

- (void)drawRect:(CGRect)rect{

    [super drawRect:rect];
    
    //1.拿到图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //2.设置画笔
    //2.1设置画笔颜色
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    CGContextSetRGBFillColor(ctx, 0, 1, 0, 1);
    //2.2设置线宽
    CGContextSetLineWidth(ctx, 3);
    //2.3设置线条顶端样式为圆角
    CGContextSetLineCap(ctx, kCGLineCapRound);
    //2.4设置线条交接样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    
   //===============画线================
//    [self drawLineWithContext:ctx];
    
    
    //===========画矩形==================
//    [self drawLineWithContext:ctx];
    
    //===========画贝塞尔曲线=============
//    [self drawQuadCurveWithContext:ctx];
    
    //===========画椭圆、圆===============
//    [self drawEllipseInContext:ctx];
    
    //=============画曲线=================
//    [self drawCurveInContext:ctx];
    
    
    //==========画弧线==================
    //起始点
    CGContextMoveToPoint(ctx, 0, 0);
    //参数：1.上下文 2.控制点  3.终点
    CGContextAddArcToPoint(ctx, 100, 800, 200, 100, 100);
    
    
    
    //3.开始绘图
    CGContextStrokePath(ctx);
    
}

#pragma mark - 画弧线
- (void)drawArcInContext:(CGContextRef)ctx{

    //起始点
    CGContextMoveToPoint(ctx, 0, 0);
    //参数：1.上下文 2.控制点  3.终点
    CGContextAddArcToPoint(ctx, 100, 800, 200, 100, 100);
}

#pragma mark - 画曲线
- (void)drawCurveInContext:(CGContextRef)ctx{

    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddCurveToPoint(ctx, 10, 10, 100, 20, 60, 90);
}

#pragma mark - 画椭圆和圆
- (void)drawEllipseInContext:(CGContextRef)ctx{

    //椭圆
    CGContextAddEllipseInRect(ctx, CGRectMake(10, 10, 100, 80));
    //圆
    CGContextAddEllipseInRect(ctx, CGRectMake(100, 100, 90, 90));
}

#pragma mark - 画贝塞尔曲线
- (void)drawQuadCurveWithContext:(CGContextRef)ctx{

    CGContextMoveToPoint(ctx, 10, 10);
    CGContextAddQuadCurveToPoint(ctx, 100, 100, 50, 70);
}

#pragma mark - 画矩形
- (void)drawRectWithContext:(CGContextRef)ctx{

    //1.C语言方法
    /**
     *  矩形图形
     *
     *  @param c#>    图形上下文 description#>
     *  @param rect#> 矩形的坐标和大小 description#>
     *
     */
//    CGContextAddRect(ctx, CGRectMake(10, 10, 100, 80));
    
    //2.通过UIKit的OC方法
    UIRectFill(CGRectMake(0, 0, 100, 100));
    
    
}

#pragma mark - 画线
- (void)drawLineWithContext:(CGContextRef)ctx{

    //=============画线================
    //a.设置起点
    CGContextMoveToPoint(ctx, 10, 10);
    
    //b.画一条线
    CGContextAddLineToPoint(ctx, 50, 50);
    //c.再画一条线
    CGContextAddLineToPoint(ctx, 100, 200);
    
    //开始绘制
    CGContextStrokePath(ctx);
    
    //d.换个颜色再画一条线
    CGContextMoveToPoint(ctx, 10, 10);
    CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1);
    
    CGContextAddLineToPoint(ctx, 100, 200);
    
}

@end
