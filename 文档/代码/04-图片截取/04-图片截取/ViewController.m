//
//  ViewController.m
//  04-图片截取
//
//  Created by xiaomage on 15/6/19.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) CGPoint startP;

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (nonatomic, weak) UIView *clipView;

@end

@implementation ViewController

- (UIView *)clipView{
    if (_clipView == nil) {
        UIView *view = [[UIView alloc] init];
        _clipView = view;
        
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.5;
        
        [self.view addSubview:view];
    }
    
    return _clipView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 给控制器的view添加一个pan手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    [self.view addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGPoint endA = CGPointZero;
    
    if (pan.state == UIGestureRecognizerStateBegan) { // 一开始拖动的时候
        
        // 获取一开始触摸点
      _startP = [pan locationInView:self.view];
        
    }else if(pan.state == UIGestureRecognizerStateChanged){ // 一直拖动
        // 获取结束点
         endA = [pan locationInView:self.view];
        
        CGFloat w = endA.x - _startP.x;
        CGFloat h = endA.y - _startP.y;
        
        // 获取截取范围
        CGRect clipRect = CGRectMake(_startP.x, _startP.y, w, h);

        
        // 生成截屏的view
        self.clipView.frame = clipRect;
        
        
        
    }else if (pan.state == UIGestureRecognizerStateEnded){
        
        
        // 图片裁剪，生成一张新的图片
        
        // 开启上下文
        // 如果不透明，默认超出裁剪区域会变成黑色，通常都是透明
        UIGraphicsBeginImageContextWithOptions(_imageV.bounds.size, NO, 0);
        
        // 设置裁剪区域
       UIBezierPath *path =  [UIBezierPath bezierPathWithRect:_clipView.frame];
        
        [path addClip];
        
        // 获取上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        // 把控件上的内容渲染到上下文
        [_imageV.layer renderInContext:ctx];
        
        
        // 生成一张新的图片
        _imageV.image = UIGraphicsGetImageFromCurrentImageContext();
        
        
        // 关闭上下文
        UIGraphicsEndImageContext();
        
        
        // 先移除
        [_clipView removeFromSuperview];
        // 截取的view设置为nil
        _clipView = nil;
        
    }
    

    // 获取手指的偏移量
//    pan translationInView:<#(UIView *)#>
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
