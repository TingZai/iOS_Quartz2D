//
//  LockView.m
//  06-手势解锁
//
//  Created by xiaomage on 15/6/19.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "LockView.h"

@implementation LockView


// 加载完xib的时候调用
- (void)awakeFromNib
{
    // 创建9个按钮
    for ( int i = 0; i < 9; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        
        [self addSubview:btn];
    }
}


// 为什么要在这个方法布局子控件，因为只要一调用这个方法，就表示父控件的尺寸确定
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger count = self.subviews.count;
    int cols = 3;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 74;
    CGFloat h = 74;
    CGFloat margin = (self.bounds.size.width - cols * w) / (cols + 1);
    
    CGFloat col = 0;
    CGFloat row = 0;
    for (NSUInteger i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        // 获取当前按钮的列数
        col = i % cols;
        row = i / cols;
        x = margin + col * (margin + w);
        y = row * (margin + w);
        
        btn.frame = CGRectMake(x, y, w, h);
        
    }
    
}

@end
