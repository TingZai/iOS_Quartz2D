//
//  ViewController.m
//  13 - 屏幕截图
//
//  Created by 余婷 on 16/1/21.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //加添一个可以拖拽的框
    
    
}
- (IBAction)clip:(id)sender {
    
    //延迟1.0秒后截图
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //1.开启上下文
        UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, 0);
        
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextAddRect(ctx, CGRectMake(100, 100, 100, 100));
        CGContextClip(ctx);
        
        //2.将控制的view的layer渲染到上下文
        [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
        
        //3.取图片
        UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
        NSData * data = UIImagePNGRepresentation(newImage);
        
        NSString * path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"new.png"];
        
        NSLog(@"%@", path);
        
        [data writeToFile:path atomically:YES];
        
        //4.结束上下文
        UIGraphicsEndImageContext();
        
        
    });
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
