//
//  YZPaintPath.h
//  涂鸦画板
//
//  Created by yz on 14-8-8.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZPaintPath : UIBezierPath

// 路径颜色
@property (nonatomic, strong) UIColor *pathColor;

// 起点
@property (nonatomic, assign) CGPoint  startPoint;

// 快速创建对象
+ (instancetype)bezierPathWithColor:(UIColor *)pathColor;


+ (instancetype)bezierPathWithColor:(UIColor *)pathColor lineWidth:(CGFloat)lineWidth startPoint:(CGPoint)startPoint;

@end
