//
//  YTView.m
//  09 - 复习加补充
//
//  Created by 余婷 on 16/1/14.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "YTView.h"

@implementation YTView

- (void)draw4Rect:(CGRect)rect{

    [super drawRect:rect];
    
    //1.获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //2.画矩形
    //2.1 4个点
//    CGContextMoveToPoint(ctx, 0, 0);
//    CGContextAddLineToPoint(<#CGContextRef  _Nullable c#>, <#CGFloat x#>, <#CGFloat y#>)
//    CGContextAddLineToPoint(<#CGContextRef  _Nullable c#>, <#CGFloat x#>, <#CGFloat y#>)
//    CGContextAddLineToPoint(<#CGContextRef  _Nullable c#>, <#CGFloat x#>, <#CGFloat y#>)
//    CGContextClosePath(<#CGContextRef  _Nullable c#>)
    
    //2.2 直线
//    CGContextMoveToPoint(<#CGContextRef  _Nullable c#>, <#CGFloat x#>, <#CGFloat y#>)
//    CGContextAddLineToPoint(<#CGContextRef  _Nullable c#>, <#CGFloat x#>, <#CGFloat y#>)
//    CGContextSetLineWidth(<#CGContextRef  _Nullable c#>, <#CGFloat width#>)
    
    //2.3 直接画
//    CGContextAddRect(ctx, <#CGRect rect#>)
//    CGContextFillPath(ctx);
    
    //2.4 通过UIKit  OC的方法画
//    UIRectFill(CGRectMake(20, 20, 100, 100));
    
    //2.5
    //画实心
//    CGContextFillRect(ctx, CGRectMake(100, 100, 100, 100));
    //画空心
    CGContextStrokeRect(ctx, CGRectMake(100, 100, 100, 100));
    
    
}

- (void)drawRect:(CGRect)rect{
 
    [super drawRect:rect];
    
    //1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //2.先创建一个路径
    CGMutablePathRef linePath = CGPathCreateMutable();
    
    //3.拼接路径
    CGPathMoveToPoint(linePath, NULL, 10, 30);
    CGPathAddLineToPoint(linePath, NULL, 100, 100);
    
    //将路径添加到上下文
    CGContextAddPath(ctx, linePath);
    
    //渲染
    CGContextStrokePath(ctx);
    
    //凡是使用creat/copy/retain创建的变量都需要release
    CGPathRelease(linePath);
    
    
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceRGB();
    
    CFRelease(cs);
    
}

@end
