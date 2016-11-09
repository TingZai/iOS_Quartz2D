//
//  YTView.m
//  06 - 裁剪
//
//  Created by 余婷 on 16/1/14.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "YTView.h"

@implementation YTView

- (void)drawRect:(CGRect)rect{

    [super drawRect:rect];

    
    //获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //保存上下文初始状态
    CGContextSaveGState(ctx);
    
    //0.画圆
    CGContextAddEllipseInRect(ctx, CGRectMake(100, 100, 60, 60));
    
    //裁剪
    CGContextClip(ctx);
    //画圈
    CGContextFillPath(ctx);
    

    //1.显示图片
    UIImage * image = [UIImage imageNamed:@"Mole06"];
    [image drawAtPoint:CGPointMake(100, 100)];
    
    
    //恢复上下文状态
    CGContextRestoreGState(ctx);
    
    CGContextAddRect(ctx, CGRectMake(10, 20, 70, 70));
    
    CGContextFillPath(ctx);
    
    
    
    
}

@end
