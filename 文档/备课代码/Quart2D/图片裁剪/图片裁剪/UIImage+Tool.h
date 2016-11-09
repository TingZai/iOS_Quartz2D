//
//  UIImage+Tool.h
//  图片裁剪
//
//  Created by yz on 14-8-3.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tool)

// instancetype会自动识别当前类的对象
+ (instancetype)circleImageWithName:(NSString *)imageName borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;



@end
