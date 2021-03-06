//
//  DrawView.m
//  08-画板
//
//  Created by xiaomage on 15/6/19.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "DrawView.h"

@interface DrawView ()

@property (nonatomic, strong) UIBezierPath *path;

@property (nonatomic, strong) NSMutableArray *paths;

@end

@implementation DrawView

- (NSMutableArray *)paths
{
    if (_paths == nil) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}

// 仅仅是加载xib的时候调用
- (void)awakeFromNib
{
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

// 初始化设置
- (void)setUp
{
    // 添加pan手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    [self addGestureRecognizer:pan];
}


// 当手指拖动的时候调用
- (void)pan:(UIPanGestureRecognizer *)pan
{
    
    // 获取当前手指触摸点
   CGPoint curP = [pan locationInView:self];
    
    // 获取开始点
    if (pan.state == UIGestureRecognizerStateBegan) {
        // 创建贝瑟尔路径
      _path = [UIBezierPath bezierPath];
        
        // 设置路径的起点
        [_path moveToPoint:curP];
        
        // 保存描述好的路径
        [self.paths addObject:_path];
        
    }
    
    // 手指一直在拖动
    // 添加线到当前触摸点
    [_path addLineToPoint:curP];
    
    // 重绘
    [self setNeedsDisplay];
    
}

// 绘制图形
// 只要调用drawRect方法就会把之前的内容全部清空
- (void)drawRect:(CGRect)rect
{
    for (UIBezierPath *path in self.paths) {
        [path stroke];
    }
}

@end
