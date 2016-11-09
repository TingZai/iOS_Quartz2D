//
//  YTView.m
//  06 - 裁剪
//
//  Created by 余婷 on 16/1/14.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "YTView.h"

@implementation YTView


/**
 *  默认只会在View第一次显示的时候调用(只能由系统自动调用，不能手动调用)
 *
 *  @param rect 当前视图的大小
 */
- (void)drawRect:(CGRect)rect{

    [super drawRect:rect];

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
//    CGContextAddArc(ctx, 125, 125, self.radius, 0, M_PI * 2, 0);
    CGContextMoveToPoint(ctx, self.startPoint.x, self.startPoint.y);
    CGContextAddQuadCurveToPoint(ctx, self.controlPoint.x, self.controlPoint.y, self.endPoint.x, self.endPoint.y);
    
    CGContextStrokePath(ctx);
}

//重写set方法，使其自动重绘
- (void)setRadius:(CGFloat)radius{

    _radius = radius;
    
    //刷新整个view
    [self setNeedsDisplay];
    
    //刷新view中的局部
//    [self setNeedsDisplayInRect:CGRectMake(0, 0, 100, 100)];
}

@end
