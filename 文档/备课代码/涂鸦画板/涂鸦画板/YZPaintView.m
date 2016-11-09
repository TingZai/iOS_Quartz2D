//
//  YZPaintView.m
//  涂鸦画板
//
//  Created by yz on 14-8-8.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "YZPaintView.h"

#import "YZPaintPath.h"

@interface YZPaintView()
{
    UIBezierPath *_path;
}

@property (nonatomic, strong) NSMutableArray *paths;

@end

@implementation YZPaintView

- (NSMutableArray *)paths
{
    if (_paths == nil) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}

- (void)awakeFromNib
{
    _width = 2;
    _color = [UIColor blackColor];
}

// 根据touches集合获取对应的触摸点
- (CGPoint)pointWithTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    
    return [touch locationInView:self];
}


// 触摸开始
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 1.获取起点
    CGPoint startP = [self pointWithTouches:touches];
    
    // 2.创建贝塞尔路径
//    YZPaintPath *path = [YZPaintPath bezierPathWithColor:_color];
    
//    [path moveToPoint:startP];
    // 设置状态：注意在一创建的时候就设置。到时候直接画就好了。
//    path.lineWidth = _width;
//    
//    _path = path;

    YZPaintPath *path = [YZPaintPath bezierPathWithColor:_color lineWidth:_width startPoint:startP];
    _path = path;
    [_paths addObject:path];
}

// 触摸移动
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 获取移动点
    CGPoint moveP = [self pointWithTouches:touches];
    
    // 想给上面的路径添加直线，是不是要拿到上面的路径啊.
    // 添加线段
    [_path addLineToPoint:moveP];
    
    // 画线(调用drawRect)
    [self setNeedsDisplay];
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    [self.paths addObject:image];
    
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
// 调用drawRect每次都会重新绘制，将之前的清掉
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    for (YZPaintPath *path in self.paths) {
        // 在这是有问题的，每根线段的宽度都是一样的
//        [[UIColor redColor] set];
//        path.lineWidth = _width;
        
        if ([path isKindOfClass:[UIImage class]]) {
            UIImage *image = (UIImage *)path;
            [image drawInRect:rect];
        }else{
            
            [path.pathColor set];
            [path stroke];
        }
    }
    
    // 能直接画在后面吗，选择图片后，之后画的线是不是应该在图片的上面啊，不能被图片覆盖。画图是不是也要有顺序，那怎么能有顺序，是不是把它加入数组里，
    
}

- (void)clearScreen{
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}
- (void)undo
{
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}

@end
