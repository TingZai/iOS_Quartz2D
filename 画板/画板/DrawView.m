//
//  DrawView.m
//  画板
//
//  Created by 余婷 on 16/3/22.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "DrawView.h"
#import "YTPath.h"

@interface DrawView()

@property(nonatomic, strong) YTPath * path;

@property(nonatomic, strong) NSMutableArray * pathArray;

@end

@implementation DrawView

#pragma mark - 启动
- (void)awakeFromNib{

    [self setUp];
    
}

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self setUp];
    }
    
    return self;
}

#pragma mark - 懒加载
- (NSMutableArray *)pathArray{

    if (_pathArray == nil) {
        
        _pathArray = [[NSMutableArray alloc] init];
    }
    
    return _pathArray;
}

#pragma mark - 初始化设置
- (void)setUp{

    //添加拖动手势
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    [self addGestureRecognizer:pan];
    
    //笔的默认颜色
    self.penColor = [UIColor blackColor];
    //线的默认宽度
    self.lineWidth = 2;
}

#pragma mark - 手势拖动响应事件
- (void)pan:(UIPanGestureRecognizer *)pan{
    
    //获取当前手指的触摸点
    CGPoint point = [pan locationInView:self];
    

    //获取开始点
    if (pan.state == UIGestureRecognizerStateBegan) {
        //创建贝塞尔路径
        _path = [[YTPath alloc] init];
        [_path.path moveToPoint:point];
        
        if (_isEraser) {
            _path.lineColor = [UIColor whiteColor];
        }else{
        
            _path.lineColor = self.penColor;
        }
        
        [_path.path setLineJoinStyle:kCGLineJoinRound];
        [_path.path setLineCapStyle:kCGLineCapRound];
        
        [_path.path setLineWidth:_lineWidth];
        
        [self.pathArray addObject:_path];
        
        
    }
    
    //手指一直拖，添加线到当前路径
    [_path.path addLineToPoint:point];
    
    [self setNeedsDisplay];

}

#pragma mark - 画图
- (void)drawRect:(CGRect)rect{
    
//    if (_image) {
//        
//        [_image drawInRect:rect];
//        
//    }

    for (YTPath * path in self.pathArray) {
        
        if ([path isKindOfClass:[UIImage class]]) {
            
            UIImage * image = (UIImage *)path;
            
            [image drawInRect:rect];
        }else{
        
            [path.lineColor set];
            
            [path.path stroke];
        }

    }
    
    
}

#pragma mark - 功能
//清屏
- (void)clear{

    [self.pathArray removeAllObjects];
    _image = nil;
    
    [self setNeedsDisplay];
}
//撤销
- (void)cancel{

    if (self.pathArray.count > 0) {
        
        [self.pathArray removeLastObject];
        
        [self setNeedsDisplay];
    }
}

//保存
- (void)save{

    //开启位图上下文
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0);
    
    //得到上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //渲染图片
    [self.layer renderInContext:ctx];
    
    
    //获取图片
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    //保存图片
    NSData * imageData = UIImagePNGRepresentation(image);
    
    [imageData writeToFile:@"/Users/yuting/Desktop/panter.png" atomically:YES];
    
    
}


- (void)drawImage:(UIImage *)image{

    _image = image;
    
    [self.pathArray addObject:_image];
    
    [self setNeedsDisplay];
}


@end
