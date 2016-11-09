//
//  ViewController.m
//  截取
//
//  Created by 余婷 on 16/3/21.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){

    CGPoint _startPoint;
    CGPoint _endPoint;
    
    
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic, strong) UIView * clipView;

@end

@implementation ViewController

- (UIView *)clipView{

    if (_clipView == nil) {
        
        _clipView = [[UIView alloc] init];
        _clipView.backgroundColor = [UIColor blackColor];
        _clipView.alpha = 0.5f;
        
        [self.view.window addSubview:_clipView];
    }
    
    return _clipView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    [self.view addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan{

    if (pan.state == UIGestureRecognizerStateBegan) {
        
        _startPoint = [pan locationInView:self.view];
    }else if (pan.state == UIGestureRecognizerStateEnded){
        
        
        //图片剪裁，形成一张新的图片
        UIGraphicsBeginImageContextWithOptions(_imageView.bounds.size, NO, 0);
        
        //设置剪裁范围
        //        UIRectClip(_clipView.frame);
        UIBezierPath * path = [UIBezierPath bezierPathWithRect:_clipView.frame];
        
        [path addClip];
        
        //获取上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        //渲染图片
        [_imageView.layer renderInContext:ctx];
        
        //生成一张新的图片
        _imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        
        
        
        //关闭上下文
        UIGraphicsEndImageContext();

        
        [_clipView removeFromSuperview];
        _clipView = nil;
        
       
        
        
    
    }else{
    
        _endPoint = [pan locationInView:self.view];
        
        self.clipView.frame = CGRectMake(_startPoint.x, _startPoint.y, _endPoint.x - _startPoint.x, _endPoint.y - _startPoint.y);
    }
}


@end
