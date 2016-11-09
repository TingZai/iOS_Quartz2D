//
//  ViewController.m
//  图片截屏
//
//  Created by yz on 15/6/15.
//  Copyright (c) 2015年 yz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, assign) CGPoint startP;

@property (nonatomic, weak) UIView *clipView;

@end

@implementation ViewController

- (UIView *)clipView
{
    if (_clipView == nil) {
        UIView *v = [[UIView alloc] init];
        v.backgroundColor = [UIColor blackColor];
        v.alpha = 0.3;
        [self.view addSubview:v];
        
        _clipView = v;
    }
    
    return _clipView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    [self.view addGestureRecognizer:pan];
    
}

- (void)pan:(UIPanGestureRecognizer *)pan
{


    if (pan.state == UIGestureRecognizerStateBegan) {
        
        _startP = [pan locationInView:self.view];
        
    }else if(pan.state == UIGestureRecognizerStateChanged){
        
        CGPoint endP = [pan locationInView:self.view];
        
        CGFloat w = endP.x - _startP.x;
        CGFloat h = endP.y - _startP.y;
        
        self.clipView.frame = CGRectMake(_startP.x, _startP.y, w, h);
        
        
        
    }else if(pan.state == UIGestureRecognizerStateEnded){
        
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.clipView.frame];
        [path addClip];
        
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        [_imageView.layer renderInContext:ctx];
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        
        UIGraphicsEndImageContext();
        
        _imageView.image = image;
        
        [self.clipView removeFromSuperview];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
