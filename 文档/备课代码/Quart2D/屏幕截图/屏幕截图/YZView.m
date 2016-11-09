//
//  YZView.m
//  屏幕截图
//
//  Created by yz on 14-8-3.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "YZView.h"

@implementation YZView

- (void)awakeFromNib
{
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 40, 40)];
    v.backgroundColor = [UIColor redColor];
    [self addSubview:v];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self.layer renderInContext:ctx];
    
}

@end
