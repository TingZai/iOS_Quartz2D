//
//  TextImageView.m
//  02-画图片和文字
//
//  Created by 余婷 on 16/1/13.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "TextImageView.h"

@implementation TextImageView

- (void)drawRect:(CGRect)rect{

    [super drawRect:rect];
    
    //画文字
//    [self drawText];
    
    //画图片
    [self drawImage];
    
    
}


#pragma mark - 画图片
- (void)drawImage{

    //1.取得图片
    UIImage * image = [UIImage imageNamed:@"Mole06.png"];
    
    //2.画
//    [image drawAtPoint:CGPointMake(50, 50)];
//    [image drawInRect:CGRectMake(10, 10, 200, 200)];
    [image drawAsPatternInRect:CGRectMake(0, 0, 200, 200)];
    
    //3.画文字
    
    NSString * str = @"婷 2015-7-3";
    [str drawInRect:CGRectMake(0, 170, 100, 30) withAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
}

#pragma mark - 画文字
- (void)drawText{
    
    //1.创建一个字符串
    NSString * str = @"余婷, morning";
    
    //2.将字符串画到某一点上
    [str drawAtPoint:CGPointMake(10, 10) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}];
    
    //3.将字符串画到某个范围中
    [str drawInRect:CGRectMake(10, 50, 100, 30) withAttributes:nil];
    
}

@end
