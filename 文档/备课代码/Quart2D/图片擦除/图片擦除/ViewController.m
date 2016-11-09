//
//  ViewController.m
//  图片擦除
//
//  Created by yz on 15/6/15.
//  Copyright (c) 2015年 yz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self.view];
    
    
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    
    
    
    CGFloat wh = 60;
    CGFloat x = point.x - wh / 2;
    CGFloat y = point.y - wh / 2;
    
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [_imageView.layer renderInContext:ctx];
    
    CGContextClearRect(ctx, CGRectMake(x, y, wh, wh));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    _imageView.image = image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
