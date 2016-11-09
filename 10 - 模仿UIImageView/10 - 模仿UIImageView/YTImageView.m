//
//  YTImageView.m
//  10 - 模仿UIImageView
//
//  Created by 余婷 on 16/1/18.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "YTImageView.h"

@implementation YTImageView

- (void)setImage:(UIImage *)image{

    _image = image;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{

    [super drawRect:rect];
    
    [_image drawInRect:rect];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
