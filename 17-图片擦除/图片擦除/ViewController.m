//
//  ViewController.m
//  图片擦除
//
//  Created by 余婷 on 16/3/22.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    
    [self.view addGestureRecognizer:pan];
    
}

- (void)pan:(UIPanGestureRecognizer *)pan{

    //获取触摸点
    CGPoint p = [pan locationInView:self.view];
    
    CGFloat wh = 10;
    CGFloat x = p.x - wh * 0.5;
    CGFloat y = p.y - wh * 0.5;
    
    CGRect rect = CGRectMake(x, y, wh, wh);
    
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
    //将控件的layer渲染上去
    [_topImageView.layer renderInContext:ctx];
    
    //擦除图片
    CGContextClearRect(ctx, rect);
    
    //获取生成的图片
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    _topImageView.image = image;
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
}

@end
