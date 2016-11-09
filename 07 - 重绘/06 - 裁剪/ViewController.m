//
//  ViewController.m
//  06 - 裁剪
//
//  Created by 余婷 on 16/1/14.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "ViewController.h"
#import "YTView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet YTView *circleView;

@end

@implementation ViewController

//- (YTView *)circleView{
//
//    if (_circleView == nil) {
//        
//        _circleView = [[YTView alloc] initWithFrame:self.view.bounds];
//        
//    }
//    
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    UITouch * touch = touches.anyObject;
    
    
    self.circleView.startPoint = [touch locationInView:_circleView];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    UITouch * touch = touches.anyObject;

    self.circleView.endPoint = [touch locationInView:self.view];
//
    self.circleView.controlPoint = CGPointMake(100, 100);
    
    
    
    [self draw];
//
//    [self.circleView setNeedsDisplay];
    
}

- (void)draw{

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctx, self.circleView.startPoint.x, self.circleView.startPoint.y);
    CGContextAddQuadCurveToPoint(ctx, 100, 100, self.circleView.endPoint.x, self.circleView.endPoint.y);
    
    CGContextStrokePath(ctx);
    
}

- (IBAction)valueChange:(UISlider *)sender {
    
    self.circleView.radius = sender.value;
    
    //重绘(这个方法内部会重新调用drawRect:方法进行绘制)
//    [self.circleView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
