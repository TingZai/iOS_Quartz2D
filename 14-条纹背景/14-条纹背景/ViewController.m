//
//  ViewController.m
//  14-条纹背景
//
//  Created by 余婷 on 16/1/27.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    //1.创建一行背景图片
    CGFloat rowW = self.view.bounds.size.width;
//    CGFloat rowH = 40;
    CGFloat rowH = self.textView.font.lineHeight;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(rowW, rowH), NO, 0.0);
    
    //画矩形框
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [[UIColor redColor] set];
    
    CGContextAddRect(ctx, CGRectMake(0, 0, rowW, rowH));
    
    CGContextFillPath(ctx);
    
    //2.画线
    [[UIColor greenColor] set];
    CGFloat lineW = 2;
    CGContextSetLineWidth(ctx, lineW);
    CGFloat dividerX = 10;
    CGFloat dividerY = rowH - lineW;
    CGContextMoveToPoint(ctx, dividerX, dividerY);
    CGContextAddLineToPoint(ctx, rowW - dividerX, dividerY);
    
    CGContextStrokePath(ctx);
    
    //3.取图
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //4.结束上下文
    UIGraphicsEndImageContext();
    
    //5.设置背景颜色
    self.textView.backgroundColor = [UIColor colorWithPatternImage:newImage];
    
}

- (void)imageBg{

    UIImage * oldImage = [UIImage imageNamed:@"luffy"];
    
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, 0.0);
    
    [oldImage drawInRect:self.view.bounds];
    
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:newImage];
    
}

@end
