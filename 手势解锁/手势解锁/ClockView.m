//
//  ClockView.m
//  手势解锁
//
//  Created by 余婷 on 16/3/22.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "ClockView.h"

@interface ClockView()

//选中按钮数组
@property(nonatomic, strong) NSMutableArray * selectedArray;

@property(nonatomic, assign) CGPoint curentPoint;

@end

@implementation ClockView

- (NSMutableArray *)selectedArray{

    if (_selectedArray == nil) {
        
        _selectedArray = [[NSMutableArray alloc] init];
        
    }
    
    return _selectedArray;
}

- (IBAction)pan:(UIPanGestureRecognizer *)pan{

    //获取触摸点
    _curentPoint = [pan locationInView:self];
    
    //判断触摸点是否在按钮上
    for (UIButton * btn in self.subviews) {
        
        if (CGRectContainsPoint(btn.frame, _curentPoint)) {
            
            if (!btn.selected) {
                
                btn.selected = YES;
                
                [self.selectedArray addObject:btn];
                
                
            }
  
        }
    }
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        
        //取消所有的选中按钮
        for (UIButton * button in self.selectedArray) {
            
            button.selected = NO;
        }
        
        //取消所有的线
        [self.selectedArray removeAllObjects];
        
        
    }
    

    //重绘
    [self setNeedsDisplay];
   
}


- (void)drawRect:(CGRect)rect{
    
    if (self.selectedArray.count > 0) {
        
        UIBezierPath * path = [UIBezierPath bezierPath];
        
        //把所有选中按钮连线
        NSUInteger count = self.selectedArray.count;
        for (int i = 0; i < count; i++) {
            
            UIButton * btn = self.selectedArray[i];
            
            if (i == 0) {
                
                [path moveToPoint:btn.center];
            }else{
                
                [path addLineToPoint:btn.center];
            }
            
        }
        
        [path addLineToPoint:self.curentPoint];
        
        //所有选中按钮连好线
        [[UIColor greenColor] set];
        
        //设置线宽
        path.lineWidth = 10;
        
        [path setLineCapStyle:kCGLineCapRound];
        
        //设置连接处为圆角
        [path setLineJoinStyle:kCGLineJoinRound];
        
        [path stroke];
        
        
    }
    
    
    
}


- (void)awakeFromNib{

    for (int i = 0; i < 9; i++) {
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        
        button.userInteractionEnabled = NO;
        
        [self addSubview:button];
    }
}

- (void)layoutSubviews{

    [super layoutSubviews];
    
    
    NSUInteger count = self.subviews.count;
    //列数
    int cols = 3;
    //行数
    int row = 3;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 74;
    CGFloat h = 74;
    CGFloat margin = (self.bounds.size.width - w*cols) / (cols + 1);
    
    
    for (int i = 0; i < count; i++) {
        
        UIButton * btn = self.subviews[i];
        
        x = margin + (i%cols) * (margin + w);
        y = (i/row) * (margin + h);
        
        NSLog(@"%f==%f",x, y);
        
        btn.frame = CGRectMake(x,y, w, h);
        
    }
    
}

@end
