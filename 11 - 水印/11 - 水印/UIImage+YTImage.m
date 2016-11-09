//
//  UIImage+YTImage.m
//  11 - 水印
//
//  Created by 余婷 on 16/1/21.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "UIImage+YTImage.h"

@implementation UIImage(YTImage)

+ (UIImage *)waterImageWithBg:(NSString *)bg logo:(NSString *)logo{

    UIImage * bgImage = [UIImage imageNamed:bg];
    
    //上下文：基于位图（bitmap），所有东西需要会绘制到一张图片上去
    //1.创建一个基于位图的上下文
    //size:新图片的尺寸
    //opaque: YES:不透明 NO:透明
    //scale:
    //这行代码运行后就相当于创建一张新的bitmap，也就是新的UIImage对象
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
    
    //2.画背景
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    //3.画右下角的水印
    UIImage * waterImage = [UIImage imageNamed:logo];
    
    CGFloat scale = 1.0f;
    CGFloat margin = 5;
    CGFloat waterW = waterImage.size.width * scale;
    CGFloat waterH = waterImage.size.height * scale;
    CGFloat waterX = bgImage.size.width - waterW - margin;
    CGFloat waterY = bgImage.size.height - waterH - margin;
    
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    //4.从上下文中取得制作完成的UIImage对象
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //5.结束上下文
    UIGraphicsEndImageContext();
    
    
    //7.将image对象压缩为PNG格式的二进制数据
    NSData * data = UIImagePNGRepresentation(newImage);
    
    //8.写入文件
    //
    NSString * path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"new.png"];
    [data writeToFile:path atomically:YES];
    
    return newImage;
}

@end
