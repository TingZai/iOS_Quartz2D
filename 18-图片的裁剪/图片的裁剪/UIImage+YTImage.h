//
//  UIImage+YTImage.h
//  图片的裁剪
//
//  Created by 余婷 on 16/3/21.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(UIImage)

+ (UIImage *)imageWithClipImage:(UIImage *)image borderWidth:(CGFloat)borderW borderColor:(UIColor *)borderColor;

@end
