//
//  ViewController.m
//  12 - 图片裁剪
//
//  Created by 余婷 on 16/1/21.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+YTImage.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.iconView.image = [UIImage cirleImageWithName:@"1.jpg" borderWidth:4 borderColor:[UIColor greenColor]];
    
}

- (void)test{

    //1.加载原图
    UIImage * oldImage = [UIImage imageNamed:@"1.jpg"];
    
    //2.开启上下文
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0);
    
    //3.画圆
    CGRect circleRect = CGRectMake(0, 0, oldImage.size.width, oldImage.size.height);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, circleRect);
    //4.按照当前的路径形状裁剪，超出这个形状以外的内容都不显示
    CGContextClip(ctx);
    
    //5.画图
    [oldImage drawInRect:circleRect];
    
    //6.取图
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //7.结束
    UIGraphicsEndImageContext();
    
    
    
    //8.写出文件
    NSData * data = UIImagePNGRepresentation(newImage);
    NSString * path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"new.png"];
    [data writeToFile:path atomically:YES];
    
    //9.显示图片
    self.iconView.image = newImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
