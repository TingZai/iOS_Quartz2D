//
//  YZPaintPath.m
//  涂鸦画板
//
//  Created by yz on 14-8-8.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "YZPaintPath.h"

@implementation YZPaintPath

+ (instancetype)bezierPathWithColor:(UIColor *)pathColor
{
    YZPaintPath *path = [[YZPaintPath alloc] init];
    path.pathColor = pathColor;
    
    return path;
}

+ (instancetype)bezierPathWithColor:(UIColor *)pathColor lineWidth:(CGFloat)lineWidth startPoint:(CGPoint)startPoint
{
    YZPaintPath *path = [[YZPaintPath alloc] init];
    path.pathColor = pathColor;
    path.lineWidth = lineWidth;
    path.startPoint = startPoint;
    
    [path moveToPoint:startPoint];
    
    return path;

}

@end
